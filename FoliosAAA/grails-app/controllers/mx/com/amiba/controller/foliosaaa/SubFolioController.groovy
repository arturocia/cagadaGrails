package mx.com.amiba.controller.foliosaaa

import mx.com.amiba.foliosaaa.SubFolio;

import org.springframework.dao.DataIntegrityViolationException

class SubFolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subFolioInstanceList: SubFolio.list(params), subFolioInstanceTotal: SubFolio.count()]
    }

    def create() {
        [subFolioInstance: new SubFolio(params)]
    }

    def save() {
        def subFolioInstance = new SubFolio(params)
        if (!subFolioInstance.save(flush: true)) {
            render(view: "create", model: [subFolioInstance: subFolioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), subFolioInstance.id])
        redirect(action: "show", id: subFolioInstance.id)
    }

    def show(Long id) {
        def subFolioInstance = SubFolio.get(id)
        if (!subFolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), id])
            redirect(action: "list")
            return
        }

        [subFolioInstance: subFolioInstance]
    }

    def edit(Long id) {
        def subFolioInstance = SubFolio.get(id)
        if (!subFolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), id])
            redirect(action: "list")
            return
        }

        [subFolioInstance: subFolioInstance]
    }

    def update(Long id, Long version) {
        def subFolioInstance = SubFolio.get(id)
        if (!subFolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subFolioInstance.version > version) {
                subFolioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subFolio.label', default: 'SubFolio')] as Object[],
                          "Another user has updated this SubFolio while you were editing")
                render(view: "edit", model: [subFolioInstance: subFolioInstance])
                return
            }
        }

        subFolioInstance.properties = params

        if (!subFolioInstance.save(flush: true)) {
            render(view: "edit", model: [subFolioInstance: subFolioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), subFolioInstance.id])
        redirect(action: "show", id: subFolioInstance.id)
    }

    def delete(Long id) {
        def subFolioInstance = SubFolio.get(id)
        if (!subFolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), id])
            redirect(action: "list")
            return
        }

        try {
            subFolioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subFolio.label', default: 'SubFolio'), id])
            redirect(action: "show", id: id)
        }
    }
}
