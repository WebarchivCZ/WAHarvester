package cz.webarchiv.wadmin

class QaCheckController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 5, 100)
    [qaCheckInstanceList: QaCheck.list(params), qaCheckInstanceTotal: QaCheck.count()]
  }

  def create = {
    def qaCheckInstance = new QaCheck()
    qaCheckInstance.properties = params
    return [qaCheckInstance: qaCheckInstance]
  }

  def save = {
    def qaCheckInstance = new QaCheck(params)
    if (qaCheckInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), qaCheckInstance.id])}"
      redirect(action: "show", id: qaCheckInstance.id)
    }
    else {
      render(view: "create", model: [qaCheckInstance: qaCheckInstance])
    }
  }

  def show = {
    def qaCheckInstance = QaCheck.get(params.id)
    if (!qaCheckInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), params.id])}"
      redirect(action: "list")
    }
    else {
      [qaCheckInstance: qaCheckInstance]
    }
  }

  def edit = {
    def qaCheckInstance = QaCheck.get(params.id)
    if (!qaCheckInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [qaCheckInstance: qaCheckInstance]
    }
  }

  def update = {
    def qaCheckInstance = QaCheck.get(params.id)
    if (qaCheckInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (qaCheckInstance.version > version) {

          qaCheckInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'qaCheck.label', default: 'QaCheck')] as Object[], "Another user has updated this QaCheck while you were editing")
          render(view: "edit", model: [qaCheckInstance: qaCheckInstance])
          return
        }
      }
      qaCheckInstance.properties = params
      if (!qaCheckInstance.hasErrors() && qaCheckInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), qaCheckInstance.id])}"
        redirect(action: "show", id: qaCheckInstance.id)
      }
      else {
        render(view: "edit", model: [qaCheckInstance: qaCheckInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def qaCheckInstance = QaCheck.get(params.id)
    if (qaCheckInstance) {
      try {
        qaCheckInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'qaCheck.label', default: 'QaCheck'), params.id])}"
      redirect(action: "list")
    }
  }
}
