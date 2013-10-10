package mx.amib.sistemas.solicitante.catalogo

import org.springframework.dao.DataIntegrityViolationException

class NivelEstudiosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [nivelEstudiosInstanceList: NivelEstudios.list(params), nivelEstudiosInstanceTotal: NivelEstudios.count()]
    }

    def create() {
        [nivelEstudiosInstance: new NivelEstudios(params)]
    }

    def save() {
        def nivelEstudiosInstance = new NivelEstudios(params)
        if (!nivelEstudiosInstance.save(flush: true)) {
            render(view: "create", model: [nivelEstudiosInstance: nivelEstudiosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), nivelEstudiosInstance.id])
        redirect(action: "show", id: nivelEstudiosInstance.id)
    }

    def show(Long id) {
        def nivelEstudiosInstance = NivelEstudios.get(id)
        if (!nivelEstudiosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), id])
            redirect(action: "list")
            return
        }

        [nivelEstudiosInstance: nivelEstudiosInstance]
    }

    def edit(Long id) {
        def nivelEstudiosInstance = NivelEstudios.get(id)
        if (!nivelEstudiosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), id])
            redirect(action: "list")
            return
        }

        [nivelEstudiosInstance: nivelEstudiosInstance]
    }

    def update(Long id, Long version) {
        def nivelEstudiosInstance = NivelEstudios.get(id)
        if (!nivelEstudiosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (nivelEstudiosInstance.version > version) {
                nivelEstudiosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'nivelEstudios.label', default: 'NivelEstudios')] as Object[],
                          "Another user has updated this NivelEstudios while you were editing")
                render(view: "edit", model: [nivelEstudiosInstance: nivelEstudiosInstance])
                return
            }
        }

        nivelEstudiosInstance.properties = params

        if (!nivelEstudiosInstance.save(flush: true)) {
            render(view: "edit", model: [nivelEstudiosInstance: nivelEstudiosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), nivelEstudiosInstance.id])
        redirect(action: "show", id: nivelEstudiosInstance.id)
    }

    def delete(Long id) {
        def nivelEstudiosInstance = NivelEstudios.get(id)
        if (!nivelEstudiosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), id])
            redirect(action: "list")
            return
        }

        try {
            nivelEstudiosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'nivelEstudios.label', default: 'NivelEstudios'), id])
            redirect(action: "show", id: id)
        }
    }
}
