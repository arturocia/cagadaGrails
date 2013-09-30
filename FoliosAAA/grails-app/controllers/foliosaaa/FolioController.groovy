package foliosaaa

import mx.com.amiba.foliosaaa.Folio;

import org.springframework.dao.DataIntegrityViolationException

class FolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [folioInstanceList: Folio.list(params), folioInstanceTotal: Folio.count()]
    }

    def create() {
        [folioInstance: new Folio(params)]
    }

    def save() {
        def folioInstance = new Folio(params)
        if (!folioInstance.save(flush: true)) {
            render(view: "create", model: [folioInstance: folioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'folio.label', default: 'Folio'), folioInstance.id])
        redirect(action: "show", id: folioInstance.id)
    }

    def show(Long id) {
        def folioInstance = Folio.get(id)
        if (!folioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'folio.label', default: 'Folio'), id])
            redirect(action: "list")
            return
        }

        [folioInstance: folioInstance]
    }

    def edit(Long id) {
        def folioInstance = Folio.get(id)
        if (!folioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'folio.label', default: 'Folio'), id])
            redirect(action: "list")
            return
        }

        [folioInstance: folioInstance]
    }

    def update(Long id, Long version) {
        def folioInstance = Folio.get(id)
        if (!folioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'folio.label', default: 'Folio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (folioInstance.version > version) {
                folioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'folio.label', default: 'Folio')] as Object[],
                          "Another user has updated this Folio while you were editing")
                render(view: "edit", model: [folioInstance: folioInstance])
                return
            }
        }

        folioInstance.properties = params

        if (!folioInstance.save(flush: true)) {
            render(view: "edit", model: [folioInstance: folioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'folio.label', default: 'Folio'), folioInstance.id])
        redirect(action: "show", id: folioInstance.id)
    }

    def delete(Long id) {
        def folioInstance = Folio.get(id)
        if (!folioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'folio.label', default: 'Folio'), id])
            redirect(action: "list")
            return
        }

        try {
            folioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'folio.label', default: 'Folio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'folio.label', default: 'Folio'), id])
            redirect(action: "show", id: id)
        }
    }
}
