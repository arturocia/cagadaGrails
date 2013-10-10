package mx.amib.sistemas.solicitante

import org.springframework.dao.DataIntegrityViolationException

class SolicitanteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [solicitanteInstanceList: Solicitante.list(params), solicitanteInstanceTotal: Solicitante.count()]
    }

    def create() {
        [solicitanteInstance: new Solicitante(params)]
    }

    def save() {
        def solicitanteInstance = new Solicitante(params)
        if (!solicitanteInstance.save(flush: true)) {
            render(view: "create", model: [solicitanteInstance: solicitanteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), solicitanteInstance.id])
        redirect(action: "show", id: solicitanteInstance.id)
    }

    def show(Long id) {
        def solicitanteInstance = Solicitante.get(id)
        if (!solicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), id])
            redirect(action: "list")
            return
        }

        [solicitanteInstance: solicitanteInstance]
    }

    def edit(Long id) {
        def solicitanteInstance = Solicitante.get(id)
        if (!solicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), id])
            redirect(action: "list")
            return
        }

        [solicitanteInstance: solicitanteInstance]
    }

    def update(Long id, Long version) {
        def solicitanteInstance = Solicitante.get(id)
        if (!solicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (solicitanteInstance.version > version) {
                solicitanteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'solicitante.label', default: 'Solicitante')] as Object[],
                          "Another user has updated this Solicitante while you were editing")
                render(view: "edit", model: [solicitanteInstance: solicitanteInstance])
                return
            }
        }

        solicitanteInstance.properties = params

        if (!solicitanteInstance.save(flush: true)) {
            render(view: "edit", model: [solicitanteInstance: solicitanteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), solicitanteInstance.id])
        redirect(action: "show", id: solicitanteInstance.id)
    }

    def delete(Long id) {
        def solicitanteInstance = Solicitante.get(id)
        if (!solicitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), id])
            redirect(action: "list")
            return
        }

        try {
            solicitanteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'solicitante.label', default: 'Solicitante'), id])
            redirect(action: "show", id: id)
        }
    }
}
