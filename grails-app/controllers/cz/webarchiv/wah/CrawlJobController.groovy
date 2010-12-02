package cz.webarchiv.wah

import org.apache.commons.io.FileUtils

class CrawlJobController {
    def scaffold = true
    def importJobService

    def importDirectory = {
        def defaultPath = grailsApplication.config.app.heritrix.jobDirectory
        flash.info = "Default heritrix job path: ${defaultPath}"
        if (params.jobPath != null) {
            try {
                CrawlJob[] jobs = importJobService.importDirectory(params.jobPath)
                println FileUtils.byteCountToDisplaySize(jobs[0].report.crawlSize)
            } catch (WaHarvesterException whe) {
                log.debug whe.printStackTrace()
            }
        }
    }
}

