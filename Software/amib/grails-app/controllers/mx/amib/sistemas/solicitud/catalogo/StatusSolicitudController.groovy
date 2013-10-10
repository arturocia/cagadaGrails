package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class StatusSolicitudController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [statusSolicitudInstanceList: StatusSolicitud.list(params), statusSolicitudInstanceTotal: StatusSolicitud.count()]
    }

    def create() {
        [statusSolicitudInstance: new StatusSolicitud(params)]
    }

    def save() {
        def statusSolicitudInstance = new StatusSolicitud(params)
        if (!statusSolicitudInstance.save(flush: true)) {
            render(view: "create", model: [statusSolicitudInstance: statusSolicitudInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), statusSolicitudInstance.id])
        redirect(action: "show", id: statusSolicitudInstance.id)
    }

    def show(Long id) {
        def statusSolicitudInstance = StatusSolicitud.get(id)
        if (!statusSolicitudInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), id])
            redirect(action: "list")
            return
        }

        [statusSolicitudInstance: statusSolicitudInstance]
    }

    def edit(Long id) {
        def statusSolicitudInstance = StatusSolicitud.get(id)
        if (!statusSolicitudInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), id])
            redirect(action: "list")
            return
        }

        [statusSolicitudInstance: statusSolicitudInstance]
    }

    def update(Long id, Long version) {
        def statusSolicitudInstance = StatusSolicitud.get(id)
        if (!statusSolicitudInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (statusSolicitudInstance.version > version) {
                statusSolicitudInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'statusSolicitud.label', default: 'StatusSolicitud')] as Object[],
                          "Another user has updated this StatusSolicitud while you were editing")
                render(view: "edit", model: [statusSolicitudInstance: statusSolicitudInstance])
                return
            }
        }

        statusSolicitudInstance.properties = params

        if (!statusSolicitudInstance.save(flush: true)) {
            render(view: "edit", model: [statusSolicitudInstance: statusSolicitudInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), statusSolicitudInstance.id])
        redirect(action: "show", id: statusSolicitudInstance.id)
    }

    def delete(Long id) {
        def statusSolicitudInstance = StatusSolicitud.get(id)
        if (!statusSolicitudInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), id])
            redirect(action: "list")
            return
        }

        try {
            statusSolicitudInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'statusSolicitud.label', default: 'StatusSolicitud'), id])
            redirect(action: "show", id: id)
        }
    }
}
