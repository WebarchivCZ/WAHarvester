package cz.webarchiv.wah

class ImportJobService {
    static transactional = true

    def importDirectory(String path) throws WaHarvesterException {
        File directory = new File(path)
        if (!directory.isDirectory()) {
            throw new WaHarvesterException('Path is not directory')
        }
        try {
            File orderXMLFile = new File("${path}${File.separator}order.xml")
            CrawlJob job = parseOrderXML(orderXMLFile)
            // File crawlReport = new File("${path}${File.separator}crawl-report.txt")
            // CrawlJob cj = parseCrawlReport(crawlReport)
        } catch (IOException ioe) {
            throw new WaHarvesterException("Could not open '${path}' directory")
            log.debug ioe.stackTrace
        }
    }

    protected CrawlJob parseOrderXML(File orderXMLFile) {
        def orderXML = new XmlSlurper().parse(orderXMLFile)
        CrawlJob job = new CrawlJob()

        job.orderXml = orderXMLFile.getText()
        job.name = orderXML.meta.name.text()
        job.description = orderXML.meta.description.text()
        job.dateStarted = Date.parse('yyyyMMddHHmmss', orderXML.meta.date.text())
        job.totalBudget = orderXML.'**'.find {it.@name == 'queue-total-budget'}.text().asType(Integer)

        return job
    }

    protected CrawlJob parseCrawlReport(File crawlReport) {
        if (crawlReport.exists()) {
            println crawlReport.readLines().find {it.contains("Crawl Name")}
        }
    }
}
