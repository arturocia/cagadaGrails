package mx.amib.sistemas.solicitante

import org.springframework.dao.DataIntegrityViolationException

class TelefonoSolicitanteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [telefonoSolicitanteInstanceList: TelefonoSolicitante.list(params), telefonoSolicitanteInstanceTotal: TelefonoSolicitante.count()]
    }

    def create() {
        [telefonoSolicitanteInstance: new TelefonoSolicitante(params)]
    }

    def save() {
        def telefonoSolicitanteInstance = new TelefonoSolicitante(params)
        if (!telefonoSolicitanteInstance.save(flush: true)) {
            render(view: "create", model: [telefonoSolicitanteInstance: telefonoSolicitanteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), telefonoSolicitanteInstance.id])
        redirect(action: "show", id: telefonoSolicitanteInstance.id)
    }

    def show(Long id) {
        def telefonoSolicitanteInstance = TelefonoSolicitante.get(id)
        if (!telefonoSolicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), id])
            redirect(action: "list")
            return
        }

        [telefonoSolicitanteInstance: telefonoSolicitanteInstance]
    }

    def edit(Long id) {
        def telefonoSolicitanteInstance = TelefonoSolicitante.get(id)
        if (!telefonoSolicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), id])
            redirect(action: "list")
            return
        }

        [telefonoSolicitanteInstance: telefonoSolicitanteInstance]
    }

    def update(Long id, Long version) {
        def telefonoSolicitanteInstance = TelefonoSolicitante.get(id)
        if (!telefonoSolicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (telefonoSolicitanteInstance.version > version) {
                telefonoSolicitanteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante')] as Object[],
                          "Another user has updated this TelefonoSolicitante while you were editing")
                render(view: "edit", model: [telefonoSolicitanteInstance: telefonoSolicitanteInstance])
                return
            }
        }

        telefonoSolicitanteInstance.properties = params

        if (!telefonoSolicitanteInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoSolicitanteInstance: telefonoSolicitanteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), telefonoSolicitanteInstance.id])
        redirect(action: "show", id: telefonoSolicitanteInstance.id)
    }

    def delete(Long id) {
        def telefonoSolicitanteInstance = TelefonoSolicitante.get(id)
        if (!telefonoSolicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), id])
            redirect(action: "list")
            return
        }

        try {
            telefonoSolicitanteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante'), id])
            redirect(action: "show", id: id)
        }
    }
}
