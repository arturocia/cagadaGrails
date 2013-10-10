package mx.amib.sistemas.sepomex.catalogo

import org.springframework.dao.DataIntegrityViolationException

class AsentamientoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [asentamientoInstanceList: Asentamiento.list(params), asentamientoInstanceTotal: Asentamiento.count()]
    }

    def create() {
        [asentamientoInstance: new Asentamiento(params)]
    }

    def save() {
        def asentamientoInstance = new Asentamiento(params)
        if (!asentamientoInstance.save(flush: true)) {
            render(view: "create", model: [asentamientoInstance: asentamientoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), asentamientoInstance.id])
        redirect(action: "show", id: asentamientoInstance.id)
    }

    def show(Long id) {
        def asentamientoInstance = Asentamiento.get(id)
        if (!asentamientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), id])
            redirect(action: "list")
            return
        }

        [asentamientoInstance: asentamientoInstance]
    }

    def edit(Long id) {
        def asentamientoInstance = Asentamiento.get(id)
        if (!asentamientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), id])
            redirect(action: "list")
            return
        }

        [asentamientoInstance: asentamientoInstance]
    }

    def update(Long id, Long version) {
        def asentamientoInstance = Asentamiento.get(id)
        if (!asentamientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (asentamientoInstance.version > version) {
                asentamientoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'asentamiento.label', default: 'Asentamiento')] as Object[],
                          "Another user has updated this Asentamiento while you were editing")
                render(view: "edit", model: [asentamientoInstance: asentamientoInstance])
                return
            }
        }

        asentamientoInstance.properties = params

        if (!asentamientoInstance.save(flush: true)) {
            render(view: "edit", model: [asentamientoInstance: asentamientoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), asentamientoInstance.id])
        redirect(action: "show", id: asentamientoInstance.id)
    }

    def delete(Long id) {
        def asentamientoInstance = Asentamiento.get(id)
        if (!asentamientoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), id])
            redirect(action: "list")
            return
        }

        try {
            asentamientoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asentamiento.label', default: 'Asentamiento'), id])
            redirect(action: "show", id: id)
        }
    }
}
