package cz.webarchiv.wah

class CrawlJobController {
    def scaffold = true
    def importJobService

    def addExisting = {
        def path = params.jobPath
        if (path != null) {
            try {
                importJobService.importDirectory(path)
            } catch (WaHarvesterException whe) {
                log.debug whe.printStackTrace()
            }
        }
    }
}

