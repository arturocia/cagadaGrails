package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class HorarioExamenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [horarioExamenInstanceList: HorarioExamen.list(params), horarioExamenInstanceTotal: HorarioExamen.count()]
    }

    def create() {
        [horarioExamenInstance: new HorarioExamen(params)]
    }

    def save() {
        def horarioExamenInstance = new HorarioExamen(params)
        if (!horarioExamenInstance.save(flush: true)) {
            render(view: "create", model: [horarioExamenInstance: horarioExamenInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), horarioExamenInstance.id])
        redirect(action: "show", id: horarioExamenInstance.id)
    }

    def show(Long id) {
        def horarioExamenInstance = HorarioExamen.get(id)
        if (!horarioExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), id])
            redirect(action: "list")
            return
        }

        [horarioExamenInstance: horarioExamenInstance]
    }

    def edit(Long id) {
        def horarioExamenInstance = HorarioExamen.get(id)
        if (!horarioExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), id])
            redirect(action: "list")
            return
        }

        [horarioExamenInstance: horarioExamenInstance]
    }

    def update(Long id, Long version) {
        def horarioExamenInstance = HorarioExamen.get(id)
        if (!horarioExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (horarioExamenInstance.version > version) {
                horarioExamenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'horarioExamen.label', default: 'HorarioExamen')] as Object[],
                          "Another user has updated this HorarioExamen while you were editing")
                render(view: "edit", model: [horarioExamenInstance: horarioExamenInstance])
                return
            }
        }

        horarioExamenInstance.properties = params

        if (!horarioExamenInstance.save(flush: true)) {
            render(view: "edit", model: [horarioExamenInstance: horarioExamenInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), horarioExamenInstance.id])
        redirect(action: "show", id: horarioExamenInstance.id)
    }

    def delete(Long id) {
        def horarioExamenInstance = HorarioExamen.get(id)
        if (!horarioExamenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), id])
            redirect(action: "list")
            return
        }

        try {
            horarioExamenInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'horarioExamen.label', default: 'HorarioExamen'), id])
            redirect(action: "show", id: id)
        }
    }
}
