package foliosaaa

import org.springframework.dao.DataIntegrityViolationException

class HolaMundoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [holaMundoInstanceList: HolaMundo.list(params), holaMundoInstanceTotal: HolaMundo.count()]
    }

    def create() {
        [holaMundoInstance: new HolaMundo(params)]
    }

    def save() {
        def holaMundoInstance = new HolaMundo(params)
        if (!holaMundoInstance.save(flush: true)) {
            render(view: "create", model: [holaMundoInstance: holaMundoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), holaMundoInstance.id])
        redirect(action: "show", id: holaMundoInstance.id)
    }

    def show(Long id) {
        def holaMundoInstance = HolaMundo.get(id)
        if (!holaMundoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), id])
            redirect(action: "list")
            return
        }

        [holaMundoInstance: holaMundoInstance]
    }

    def edit(Long id) {
        def holaMundoInstance = HolaMundo.get(id)
        if (!holaMundoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), id])
            redirect(action: "list")
            return
        }

        [holaMundoInstance: holaMundoInstance]
    }

    def update(Long id, Long version) {
        def holaMundoInstance = HolaMundo.get(id)
        if (!holaMundoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (holaMundoInstance.version > version) {
                holaMundoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'holaMundo.label', default: 'HolaMundo')] as Object[],
                          "Another user has updated this HolaMundo while you were editing")
                render(view: "edit", model: [holaMundoInstance: holaMundoInstance])
                return
            }
        }

        holaMundoInstance.properties = params

        if (!holaMundoInstance.save(flush: true)) {
            render(view: "edit", model: [holaMundoInstance: holaMundoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), holaMundoInstance.id])
        redirect(action: "show", id: holaMundoInstance.id)
    }

    def delete(Long id) {
        def holaMundoInstance = HolaMundo.get(id)
        if (!holaMundoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), id])
            redirect(action: "list")
            return
        }

        try {
            holaMundoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'holaMundo.label', default: 'HolaMundo'), id])
            redirect(action: "show", id: id)
        }
    }
}
