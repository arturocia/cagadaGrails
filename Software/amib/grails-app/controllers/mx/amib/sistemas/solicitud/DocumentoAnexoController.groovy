package mx.amib.sistemas.solicitud

import org.springframework.dao.DataIntegrityViolationException

class DocumentoAnexoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [documentoAnexoInstanceList: DocumentoAnexo.list(params), documentoAnexoInstanceTotal: DocumentoAnexo.count()]
    }

    def create() {
        [documentoAnexoInstance: new DocumentoAnexo(params)]
    }

    def save() {
        def documentoAnexoInstance = new DocumentoAnexo(params)
        if (!documentoAnexoInstance.save(flush: true)) {
            render(view: "create", model: [documentoAnexoInstance: documentoAnexoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), documentoAnexoInstance.id])
        redirect(action: "show", id: documentoAnexoInstance.id)
    }

    def show(Long id) {
        def documentoAnexoInstance = DocumentoAnexo.get(id)
        if (!documentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        [documentoAnexoInstance: documentoAnexoInstance]
    }

    def edit(Long id) {
        def documentoAnexoInstance = DocumentoAnexo.get(id)
        if (!documentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        [documentoAnexoInstance: documentoAnexoInstance]
    }

    def update(Long id, Long version) {
        def documentoAnexoInstance = DocumentoAnexo.get(id)
        if (!documentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (documentoAnexoInstance.version > version) {
                documentoAnexoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo')] as Object[],
                          "Another user has updated this DocumentoAnexo while you were editing")
                render(view: "edit", model: [documentoAnexoInstance: documentoAnexoInstance])
                return
            }
        }

        documentoAnexoInstance.properties = params

        if (!documentoAnexoInstance.save(flush: true)) {
            render(view: "edit", model: [documentoAnexoInstance: documentoAnexoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), documentoAnexoInstance.id])
        redirect(action: "show", id: documentoAnexoInstance.id)
    }

    def delete(Long id) {
        def documentoAnexoInstance = DocumentoAnexo.get(id)
        if (!documentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        try {
            documentoAnexoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo'), id])
            redirect(action: "show", id: id)
        }
    }
}
