package mx.amib.sistemas.sepomex.catalogo

import org.springframework.dao.DataIntegrityViolationException

class SepomexController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sepomexInstanceList: Sepomex.list(params), sepomexInstanceTotal: Sepomex.count()]
    }

    def create() {
        [sepomexInstance: new Sepomex(params)]
    }

    def save() {
        def sepomexInstance = new Sepomex(params)
        if (!sepomexInstance.save(flush: true)) {
            render(view: "create", model: [sepomexInstance: sepomexInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), sepomexInstance.id])
        redirect(action: "show", id: sepomexInstance.id)
    }

    def show(Long id) {
        def sepomexInstance = Sepomex.get(id)
        if (!sepomexInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), id])
            redirect(action: "list")
            return
        }

        [sepomexInstance: sepomexInstance]
    }

    def edit(Long id) {
        def sepomexInstance = Sepomex.get(id)
        if (!sepomexInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), id])
            redirect(action: "list")
            return
        }

        [sepomexInstance: sepomexInstance]
    }

    def update(Long id, Long version) {
        def sepomexInstance = Sepomex.get(id)
        if (!sepomexInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sepomexInstance.version > version) {
                sepomexInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sepomex.label', default: 'Sepomex')] as Object[],
                          "Another user has updated this Sepomex while you were editing")
                render(view: "edit", model: [sepomexInstance: sepomexInstance])
                return
            }
        }

        sepomexInstance.properties = params

        if (!sepomexInstance.save(flush: true)) {
            render(view: "edit", model: [sepomexInstance: sepomexInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), sepomexInstance.id])
        redirect(action: "show", id: sepomexInstance.id)
    }

    def delete(Long id) {
        def sepomexInstance = Sepomex.get(id)
        if (!sepomexInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), id])
            redirect(action: "list")
            return
        }

        try {
            sepomexInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sepomex.label', default: 'Sepomex'), id])
            redirect(action: "show", id: id)
        }
    }
}
