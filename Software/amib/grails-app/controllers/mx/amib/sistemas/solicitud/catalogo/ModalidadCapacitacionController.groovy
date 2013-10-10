package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class ModalidadCapacitacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [modalidadCapacitacionInstanceList: ModalidadCapacitacion.list(params), modalidadCapacitacionInstanceTotal: ModalidadCapacitacion.count()]
    }

    def create() {
        [modalidadCapacitacionInstance: new ModalidadCapacitacion(params)]
    }

    def save() {
        def modalidadCapacitacionInstance = new ModalidadCapacitacion(params)
        if (!modalidadCapacitacionInstance.save(flush: true)) {
            render(view: "create", model: [modalidadCapacitacionInstance: modalidadCapacitacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), modalidadCapacitacionInstance.id])
        redirect(action: "show", id: modalidadCapacitacionInstance.id)
    }

    def show(Long id) {
        def modalidadCapacitacionInstance = ModalidadCapacitacion.get(id)
        if (!modalidadCapacitacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), id])
            redirect(action: "list")
            return
        }

        [modalidadCapacitacionInstance: modalidadCapacitacionInstance]
    }

    def edit(Long id) {
        def modalidadCapacitacionInstance = ModalidadCapacitacion.get(id)
        if (!modalidadCapacitacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), id])
            redirect(action: "list")
            return
        }

        [modalidadCapacitacionInstance: modalidadCapacitacionInstance]
    }

    def update(Long id, Long version) {
        def modalidadCapacitacionInstance = ModalidadCapacitacion.get(id)
        if (!modalidadCapacitacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (modalidadCapacitacionInstance.version > version) {
                modalidadCapacitacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion')] as Object[],
                          "Another user has updated this ModalidadCapacitacion while you were editing")
                render(view: "edit", model: [modalidadCapacitacionInstance: modalidadCapacitacionInstance])
                return
            }
        }

        modalidadCapacitacionInstance.properties = params

        if (!modalidadCapacitacionInstance.save(flush: true)) {
            render(view: "edit", model: [modalidadCapacitacionInstance: modalidadCapacitacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), modalidadCapacitacionInstance.id])
        redirect(action: "show", id: modalidadCapacitacionInstance.id)
    }

    def delete(Long id) {
        def modalidadCapacitacionInstance = ModalidadCapacitacion.get(id)
        if (!modalidadCapacitacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), id])
            redirect(action: "list")
            return
        }

        try {
            modalidadCapacitacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'modalidadCapacitacion.label', default: 'ModalidadCapacitacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
