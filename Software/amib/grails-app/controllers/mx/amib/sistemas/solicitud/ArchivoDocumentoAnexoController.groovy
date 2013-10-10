package mx.amib.sistemas.solicitud

import org.springframework.dao.DataIntegrityViolationException

class ArchivoDocumentoAnexoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [archivoDocumentoAnexoInstanceList: ArchivoDocumentoAnexo.list(params), archivoDocumentoAnexoInstanceTotal: ArchivoDocumentoAnexo.count()]
    }

    def create() {
        [archivoDocumentoAnexoInstance: new ArchivoDocumentoAnexo(params)]
    }

    def save() {
        def archivoDocumentoAnexoInstance = new ArchivoDocumentoAnexo(params)
        if (!archivoDocumentoAnexoInstance.save(flush: true)) {
            render(view: "create", model: [archivoDocumentoAnexoInstance: archivoDocumentoAnexoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), archivoDocumentoAnexoInstance.id])
        redirect(action: "show", id: archivoDocumentoAnexoInstance.id)
    }

    def show(Long id) {
        def archivoDocumentoAnexoInstance = ArchivoDocumentoAnexo.get(id)
        if (!archivoDocumentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        [archivoDocumentoAnexoInstance: archivoDocumentoAnexoInstance]
    }

    def edit(Long id) {
        def archivoDocumentoAnexoInstance = ArchivoDocumentoAnexo.get(id)
        if (!archivoDocumentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        [archivoDocumentoAnexoInstance: archivoDocumentoAnexoInstance]
    }

    def update(Long id, Long version) {
        def archivoDocumentoAnexoInstance = ArchivoDocumentoAnexo.get(id)
        if (!archivoDocumentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (archivoDocumentoAnexoInstance.version > version) {
                archivoDocumentoAnexoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo')] as Object[],
                          "Another user has updated this ArchivoDocumentoAnexo while you were editing")
                render(view: "edit", model: [archivoDocumentoAnexoInstance: archivoDocumentoAnexoInstance])
                return
            }
        }

        archivoDocumentoAnexoInstance.properties = params

        if (!archivoDocumentoAnexoInstance.save(flush: true)) {
            render(view: "edit", model: [archivoDocumentoAnexoInstance: archivoDocumentoAnexoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), archivoDocumentoAnexoInstance.id])
        redirect(action: "show", id: archivoDocumentoAnexoInstance.id)
    }

    def delete(Long id) {
        def archivoDocumentoAnexoInstance = ArchivoDocumentoAnexo.get(id)
        if (!archivoDocumentoAnexoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), id])
            redirect(action: "list")
            return
        }

        try {
            archivoDocumentoAnexoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'archivoDocumentoAnexo.label', default: 'ArchivoDocumentoAnexo'), id])
            redirect(action: "show", id: id)
        }
    }
}
