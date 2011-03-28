package cz.webarchiv.wah

import org.apache.commons.io.FileUtils
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class CrawlJobController
{
    def importJobService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def importDirectory = {
        def defaultPath = grailsApplication.config.app.heritrix.jobDirectory
        flash.info = "Default heritrix job path: ${defaultPath}"
        if (params.jobPath != null) {
            try {
                CrawlJob[] jobs = importJobService.importDirectory(params.jobPath)
                jobs.each {
                    if (!it.validate()) {
                        println it.errors.each {println it}
                    } else {
                        it.save(failOnError: true)
                    }
                }

            } catch (WaHarvesterException whe) {
                this.message = whe.message
                log.debug whe.message
            }
        }
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [crawlJobInstanceList: CrawlJob.list(params), crawlJobInstanceTotal: CrawlJob.count()]
    }

    def create = {
        def crawlJobInstance = new CrawlJob()
        crawlJobInstance.properties = params
        return [crawlJobInstance: crawlJobInstance]
    }

    def save = {
        def crawlJobInstance = new CrawlJob(params)
        if (crawlJobInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), crawlJobInstance.id])}"
            redirect(action: "show", id: crawlJobInstance.id)
        }
        else {
            render(view: "create", model: [crawlJobInstance: crawlJobInstance])
        }
    }

    def show = {
        def crawlJobInstance = CrawlJob.get(params.id)
        if (!crawlJobInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), params.id])}"
            redirect(action: "list")
        }
        else {
            [crawlJobInstance: crawlJobInstance]
        }
    }

    def edit = {
        def crawlJobInstance = CrawlJob.get(params.id)
        if (!crawlJobInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [crawlJobInstance: crawlJobInstance]
        }
    }

    def update = {
        def crawlJobInstance = CrawlJob.get(params.id)
        if (crawlJobInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (crawlJobInstance.version > version) {

                    crawlJobInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'crawlJob.label', default: 'CrawlJob')] as Object[], "Another user has updated this CrawlJob while you were editing")
                    render(view: "edit", model: [crawlJobInstance: crawlJobInstance])
                    return
                }
            }
            crawlJobInstance.properties = params
            if (!crawlJobInstance.hasErrors() && crawlJobInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), crawlJobInstance.id])}"
                redirect(action: "show", id: crawlJobInstance.id)
            }
            else {
                render(view: "edit", model: [crawlJobInstance: crawlJobInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def crawlJobInstance = CrawlJob.get(params.id)
        if (crawlJobInstance) {
            try {
                crawlJobInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'crawlJob.label', default: 'CrawlJob'), params.id])}"
            redirect(action: "list")
        }
    }
}
