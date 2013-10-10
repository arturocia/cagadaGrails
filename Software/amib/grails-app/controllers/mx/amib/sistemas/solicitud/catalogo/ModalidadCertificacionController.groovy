package mx.amib.sistemas.solicitud.catalogo

import org.springframework.dao.DataIntegrityViolationException

class ModalidadCertificacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [modalidadCertificacionInstanceList: ModalidadCertificacion.list(params), modalidadCertificacionInstanceTotal: ModalidadCertificacion.count()]
    }

    def create() {
        [modalidadCertificacionInstance: new ModalidadCertificacion(params)]
    }

    def save() {
        def modalidadCertificacionInstance = new ModalidadCertificacion(params)
        if (!modalidadCertificacionInstance.save(flush: true)) {
            render(view: "create", model: [modalidadCertificacionInstance: modalidadCertificacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), modalidadCertificacionInstance.id])
        redirect(action: "show", id: modalidadCertificacionInstance.id)
    }

    def show(Long id) {
        def modalidadCertificacionInstance = ModalidadCertificacion.get(id)
        if (!modalidadCertificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), id])
            redirect(action: "list")
            return
        }

        [modalidadCertificacionInstance: modalidadCertificacionInstance]
    }

    def edit(Long id) {
        def modalidadCertificacionInstance = ModalidadCertificacion.get(id)
        if (!modalidadCertificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), id])
            redirect(action: "list")
            return
        }

        [modalidadCertificacionInstance: modalidadCertificacionInstance]
    }

    def update(Long id, Long version) {
        def modalidadCertificacionInstance = ModalidadCertificacion.get(id)
        if (!modalidadCertificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (modalidadCertificacionInstance.version > version) {
                modalidadCertificacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion')] as Object[],
                          "Another user has updated this ModalidadCertificacion while you were editing")
                render(view: "edit", model: [modalidadCertificacionInstance: modalidadCertificacionInstance])
                return
            }
        }

        modalidadCertificacionInstance.properties = params

        if (!modalidadCertificacionInstance.save(flush: true)) {
            render(view: "edit", model: [modalidadCertificacionInstance: modalidadCertificacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), modalidadCertificacionInstance.id])
        redirect(action: "show", id: modalidadCertificacionInstance.id)
    }

    def delete(Long id) {
        def modalidadCertificacionInstance = ModalidadCertificacion.get(id)
        if (!modalidadCertificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), id])
            redirect(action: "list")
            return
        }

        try {
            modalidadCertificacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'modalidadCertificacion.label', default: 'ModalidadCertificacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
