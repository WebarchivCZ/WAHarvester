package cz.webarchiv.wah

class SeedlistController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [seedlistInstanceList: Seedlist.list(params), seedlistInstanceTotal: Seedlist.count()]
  }

  def create = {
    def seedlistInstance = new Seedlist()
    seedlistInstance.properties = params
    return [seedlistInstance: seedlistInstance]
  }

  def save = {
    def seedlistInstance = new Seedlist(params)
    if (seedlistInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), seedlistInstance.id])}"
      redirect(action: "show", id: seedlistInstance.id)
    }
    else {
      render(view: "create", model: [seedlistInstance: seedlistInstance])
    }
  }

  def show = {
    def seedlistInstance = Seedlist.get(params.id)
    if (!seedlistInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), params.id])}"
      redirect(action: "list")
    }
    else {
      [seedlistInstance: seedlistInstance]
    }
  }

  def edit = {
    def seedlistInstance = Seedlist.get(params.id)
    if (!seedlistInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [seedlistInstance: seedlistInstance]
    }
  }

  def update = {
    def seedlistInstance = Seedlist.get(params.id)
    if (seedlistInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (seedlistInstance.version > version) {

          seedlistInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'seedlist.label', default: 'Seedlist')] as Object[], "Another user has updated this Seedlist while you were editing")
          render(view: "edit", model: [seedlistInstance: seedlistInstance])
          return
        }
      }
      seedlistInstance.properties = params
      if (!seedlistInstance.hasErrors() && seedlistInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), seedlistInstance.id])}"
        redirect(action: "show", id: seedlistInstance.id)
      }
      else {
        render(view: "edit", model: [seedlistInstance: seedlistInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def seedlistInstance = Seedlist.get(params.id)
    if (seedlistInstance) {
      try {
        seedlistInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'seedlist.label', default: 'Seedlist'), params.id])}"
      redirect(action: "list")
    }
  }
}
