package mx.amib.sistemas.solicitante

import org.springframework.dao.DataIntegrityViolationException

class ArchivoFotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [archivoFotoInstanceList: ArchivoFoto.list(params), archivoFotoInstanceTotal: ArchivoFoto.count()]
    }

    def create() {
        [archivoFotoInstance: new ArchivoFoto(params)]
    }

    def save() {
        def archivoFotoInstance = new ArchivoFoto(params)
        if (!archivoFotoInstance.save(flush: true)) {
            render(view: "create", model: [archivoFotoInstance: archivoFotoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), archivoFotoInstance.id])
        redirect(action: "show", id: archivoFotoInstance.id)
    }

    def show(Long id) {
        def archivoFotoInstance = ArchivoFoto.get(id)
        if (!archivoFotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), id])
            redirect(action: "list")
            return
        }

        [archivoFotoInstance: archivoFotoInstance]
    }

    def edit(Long id) {
        def archivoFotoInstance = ArchivoFoto.get(id)
        if (!archivoFotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), id])
            redirect(action: "list")
            return
        }

        [archivoFotoInstance: archivoFotoInstance]
    }

    def update(Long id, Long version) {
        def archivoFotoInstance = ArchivoFoto.get(id)
        if (!archivoFotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (archivoFotoInstance.version > version) {
                archivoFotoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'archivoFoto.label', default: 'ArchivoFoto')] as Object[],
                          "Another user has updated this ArchivoFoto while you were editing")
                render(view: "edit", model: [archivoFotoInstance: archivoFotoInstance])
                return
            }
        }

        archivoFotoInstance.properties = params

        if (!archivoFotoInstance.save(flush: true)) {
            render(view: "edit", model: [archivoFotoInstance: archivoFotoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), archivoFotoInstance.id])
        redirect(action: "show", id: archivoFotoInstance.id)
    }

    def delete(Long id) {
        def archivoFotoInstance = ArchivoFoto.get(id)
        if (!archivoFotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), id])
            redirect(action: "list")
            return
        }

        try {
            archivoFotoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'archivoFoto.label', default: 'ArchivoFoto'), id])
            redirect(action: "show", id: id)
        }
    }
}
