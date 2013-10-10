package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class TipoServicioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoServicioInstanceList: TipoServicio.list(params), tipoServicioInstanceTotal: TipoServicio.count()]
    }

    def create() {
        [tipoServicioInstance: new TipoServicio(params)]
    }

    def save() {
        def tipoServicioInstance = new TipoServicio(params)
        if (!tipoServicioInstance.save(flush: true)) {
            render(view: "create", model: [tipoServicioInstance: tipoServicioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), tipoServicioInstance.id])
        redirect(action: "show", id: tipoServicioInstance.id)
    }

    def show(Long id) {
        def tipoServicioInstance = TipoServicio.get(id)
        if (!tipoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), id])
            redirect(action: "list")
            return
        }

        [tipoServicioInstance: tipoServicioInstance]
    }

    def edit(Long id) {
        def tipoServicioInstance = TipoServicio.get(id)
        if (!tipoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), id])
            redirect(action: "list")
            return
        }

        [tipoServicioInstance: tipoServicioInstance]
    }

    def update(Long id, Long version) {
        def tipoServicioInstance = TipoServicio.get(id)
        if (!tipoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoServicioInstance.version > version) {
                tipoServicioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoServicio.label', default: 'TipoServicio')] as Object[],
                          "Another user has updated this TipoServicio while you were editing")
                render(view: "edit", model: [tipoServicioInstance: tipoServicioInstance])
                return
            }
        }

        tipoServicioInstance.properties = params

        if (!tipoServicioInstance.save(flush: true)) {
            render(view: "edit", model: [tipoServicioInstance: tipoServicioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), tipoServicioInstance.id])
        redirect(action: "show", id: tipoServicioInstance.id)
    }

    def delete(Long id) {
        def tipoServicioInstance = TipoServicio.get(id)
        if (!tipoServicioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoServicioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoServicio.label', default: 'TipoServicio'), id])
            redirect(action: "show", id: id)
        }
    }
}
