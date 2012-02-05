package cz.webarchiv.wah

class ImportJobService {
  static transactional = true

  CrawlJob[] importDirectory(String path, boolean persist) throws WaHarvesterException {
    // TODO rozdelit na prochazeni slozky a nasledne zpracovani jobu
    // TODO metoda isJobDirectory?
    File directory = new File(path)
    if (!directory.isDirectory()) {
      throw new WaHarvesterException('Path is not directory')
    }
    try {
      String jobDirectory = path
      if (!jobDirectory.endsWith(File.separator)) {
        jobDirectory += File.separator
      }

      CrawlJob job = parseOrderXML(new File(jobDirectory + "order.xml"))

      job.directoryName = directory.getName()
      job.seedlist = parseSeedList(new File(jobDirectory + "seeds.txt"))
      job.report = parseCrawlReport(new File(jobDirectory + "crawl-report.txt"))

      if (persist) {
        job.save()
      }

      log.info "Imported job ${job.name}"

      return [job]
    } catch (IOException ioe) {
      throw new WaHarvesterException("Could not open '${path}' directory")
    }
  }

  /**
   * Find jobs in imported directory and save them into database
   * @param path
   * @return
   * @throws WaHarvesterException
   */
  CrawlJob[] importDirectory(String path) throws WaHarvesterException {
    importDirectory(path, true)
  }

  protected CrawlJob parseOrderXML(File orderXMLFile) {
    if (orderXMLFile.exists()) {
      def orderXML = new XmlSlurper().parse(orderXMLFile)
      CrawlJob job = new CrawlJob()

      job.orderXml = orderXMLFile.getText()
      job.name = orderXML.meta.name.text()
      job.description = orderXML.meta.description.text()
      job.dateStarted = Date.parse('yyyyMMddHHmmss', orderXML.meta.date.text())
      job.totalBudget = orderXML.'**'.find {it.@name == 'queue-total-budget'}.text().asType(Integer)
      job.status = CrawlStatus.FINISHED

      return job
    }
    else {
      throw new WaHarvesterException('Can not open order.xml file: ' + orderXMLFile.getPath())
    }
  }

  protected CrawlJobReport parseCrawlReport(File crawlReport) {
    if (crawlReport.exists()) {
      def parsedLog = [:]
      crawlReport.splitEachLine(": ", {parsedLog[it[0]] = it[1]})
      CrawlJobReport report = new CrawlJobReport()
      report.seedsCrawled = Integer.valueOf(parsedLog['Total Seeds Crawled'])
      report.crawlSize = Long.valueOf(parsedLog['Total Raw Data Size in Bytes'].tokenize()[0])
      report.hostsCrawled = Integer.valueOf(parsedLog['Total Hosts Crawled'])
      report.documentsCount = Integer.valueOf(parsedLog['Total Documents Crawled'])
      report.duration = parsedLog['Duration Time']
      report.statusDescription = parsedLog['Crawl Status']
      return report
    }
  }

  protected Seedlist parseSeedList(File seedFile) {
    if (seedFile.exists()) {
      Seedlist seedList = new Seedlist()
      seedList.seeds = seedFile.getText()
      return seedList
    } else {
      throw new WaHarvesterException('Can not open seed file ' + seedFile.getPath())
    }
  }

}
