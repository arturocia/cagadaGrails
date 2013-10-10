package mx.amib.sistemas.sepomex.catalogo

import org.springframework.dao.DataIntegrityViolationException

class EntidadFederativaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [entidadFederativaInstanceList: EntidadFederativa.list(params), entidadFederativaInstanceTotal: EntidadFederativa.count()]
    }

    def create() {
        [entidadFederativaInstance: new EntidadFederativa(params)]
    }

    def save() {
        def entidadFederativaInstance = new EntidadFederativa(params)
        if (!entidadFederativaInstance.save(flush: true)) {
            render(view: "create", model: [entidadFederativaInstance: entidadFederativaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), entidadFederativaInstance.id])
        redirect(action: "show", id: entidadFederativaInstance.id)
    }

    def show(Long id) {
        def entidadFederativaInstance = EntidadFederativa.get(id)
        if (!entidadFederativaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), id])
            redirect(action: "list")
            return
        }

        [entidadFederativaInstance: entidadFederativaInstance]
    }

    def edit(Long id) {
        def entidadFederativaInstance = EntidadFederativa.get(id)
        if (!entidadFederativaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), id])
            redirect(action: "list")
            return
        }

        [entidadFederativaInstance: entidadFederativaInstance]
    }

    def update(Long id, Long version) {
        def entidadFederativaInstance = EntidadFederativa.get(id)
        if (!entidadFederativaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (entidadFederativaInstance.version > version) {
                entidadFederativaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'entidadFederativa.label', default: 'EntidadFederativa')] as Object[],
                          "Another user has updated this EntidadFederativa while you were editing")
                render(view: "edit", model: [entidadFederativaInstance: entidadFederativaInstance])
                return
            }
        }

        entidadFederativaInstance.properties = params

        if (!entidadFederativaInstance.save(flush: true)) {
            render(view: "edit", model: [entidadFederativaInstance: entidadFederativaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), entidadFederativaInstance.id])
        redirect(action: "show", id: entidadFederativaInstance.id)
    }

    def delete(Long id) {
        def entidadFederativaInstance = EntidadFederativa.get(id)
        if (!entidadFederativaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), id])
            redirect(action: "list")
            return
        }

        try {
            entidadFederativaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entidadFederativa.label', default: 'EntidadFederativa'), id])
            redirect(action: "show", id: id)
        }
    }
}
