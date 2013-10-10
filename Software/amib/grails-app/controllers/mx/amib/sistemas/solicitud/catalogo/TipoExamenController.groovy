package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class TipoExamenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoExamenInstanceList: TipoExamen.list(params), tipoExamenInstanceTotal: TipoExamen.count()]
    }

    def create() {
        [tipoExamenInstance: new TipoExamen(params)]
    }

    def save() {
        def tipoExamenInstance = new TipoExamen(params)
        if (!tipoExamenInstance.save(flush: true)) {
            render(view: "create", model: [tipoExamenInstance: tipoExamenInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), tipoExamenInstance.id])
        redirect(action: "show", id: tipoExamenInstance.id)
    }

    def show(Long id) {
        def tipoExamenInstance = TipoExamen.get(id)
        if (!tipoExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), id])
            redirect(action: "list")
            return
        }

        [tipoExamenInstance: tipoExamenInstance]
    }

    def edit(Long id) {
        def tipoExamenInstance = TipoExamen.get(id)
        if (!tipoExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), id])
            redirect(action: "list")
            return
        }

        [tipoExamenInstance: tipoExamenInstance]
    }

    def update(Long id, Long version) {
        def tipoExamenInstance = TipoExamen.get(id)
        if (!tipoExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoExamenInstance.version > version) {
                tipoExamenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoExamen.label', default: 'TipoExamen')] as Object[],
                          "Another user has updated this TipoExamen while you were editing")
                render(view: "edit", model: [tipoExamenInstance: tipoExamenInstance])
                return
            }
        }

        tipoExamenInstance.properties = params

        if (!tipoExamenInstance.save(flush: true)) {
            render(view: "edit", model: [tipoExamenInstance: tipoExamenInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), tipoExamenInstance.id])
        redirect(action: "show", id: tipoExamenInstance.id)
    }

    def delete(Long id) {
        def tipoExamenInstance = TipoExamen.get(id)
        if (!tipoExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoExamenInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoExamen.label', default: 'TipoExamen'), id])
            redirect(action: "show", id: id)
        }
    }
}
