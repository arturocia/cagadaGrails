package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class InstitutoCapacitadorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [institutoCapacitadorInstanceList: InstitutoCapacitador.list(params), institutoCapacitadorInstanceTotal: InstitutoCapacitador.count()]
    }

    def create() {
        [institutoCapacitadorInstance: new InstitutoCapacitador(params)]
    }

    def save() {
        def institutoCapacitadorInstance = new InstitutoCapacitador(params)
        if (!institutoCapacitadorInstance.save(flush: true)) {
            render(view: "create", model: [institutoCapacitadorInstance: institutoCapacitadorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), institutoCapacitadorInstance.id])
        redirect(action: "show", id: institutoCapacitadorInstance.id)
    }

    def show(Long id) {
        def institutoCapacitadorInstance = InstitutoCapacitador.get(id)
        if (!institutoCapacitadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), id])
            redirect(action: "list")
            return
        }

        [institutoCapacitadorInstance: institutoCapacitadorInstance]
    }

    def edit(Long id) {
        def institutoCapacitadorInstance = InstitutoCapacitador.get(id)
        if (!institutoCapacitadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), id])
            redirect(action: "list")
            return
        }

        [institutoCapacitadorInstance: institutoCapacitadorInstance]
    }

    def update(Long id, Long version) {
        def institutoCapacitadorInstance = InstitutoCapacitador.get(id)
        if (!institutoCapacitadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (institutoCapacitadorInstance.version > version) {
                institutoCapacitadorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador')] as Object[],
                          "Another user has updated this InstitutoCapacitador while you were editing")
                render(view: "edit", model: [institutoCapacitadorInstance: institutoCapacitadorInstance])
                return
            }
        }

        institutoCapacitadorInstance.properties = params

        if (!institutoCapacitadorInstance.save(flush: true)) {
            render(view: "edit", model: [institutoCapacitadorInstance: institutoCapacitadorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), institutoCapacitadorInstance.id])
        redirect(action: "show", id: institutoCapacitadorInstance.id)
    }

    def delete(Long id) {
        def institutoCapacitadorInstance = InstitutoCapacitador.get(id)
        if (!institutoCapacitadorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), id])
            redirect(action: "list")
            return
        }

        try {
            institutoCapacitadorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador'), id])
            redirect(action: "show", id: id)
        }
    }
}
