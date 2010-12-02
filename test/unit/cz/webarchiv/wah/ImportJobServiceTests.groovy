package cz.webarchiv.wah

import grails.test.*
import org.junit.Test

class ImportJobServiceTests extends GrailsUnitTestCase {
    def jobDirHeritrix1 = '/resources/jobDirectoryHeritrix1/'

    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    @Test
    void testImportDirectory() {
        mockLogging ImportJobService.class

        ImportJobService service = new ImportJobService()
        CrawlJob[] jobs = service.importDirectory(getClass().getResource('/resources/jobDirectoryHeritrix1').getPath())

        assertEquals 'Serials-2010-02', jobs[0].name
        assertEquals 'jobDirectoryHeritrix1', jobs[0].directoryName
        assertEquals 'sklizen serialu se smlouvou 24. 2. 2010', jobs[0].description
        assertEquals Date.parse('yyyyMMddHHmmss', '20100225100220').dateTimeString, jobs[0].dateStarted.dateTimeString
        assertEquals 15000, jobs[0].totalBudget
        assertEquals 'Finished - Ended by operator', jobs[0].report.statusDescription
        assertTrue jobs[0].seedlist.contains('http://www.fi.muni.cz/~qprokes')
    }

    @Test
    void testParseOrderXML() {
        //File orderXML = new File(getClass().getResource('/resources/order-v1.14.4.xml').getFile())
        File orderXML = new File(getClass().getResource(jobDirHeritrix1 + 'order.xml').getFile())
        ImportJobService service = new ImportJobService()
        CrawlJob job = service.parseOrderXML(orderXML)

        assertEquals orderXML.getText(), job.orderXml
        assertEquals 'Serials-2010-02', job.name
        assertEquals 'sklizen serialu se smlouvou 24. 2. 2010', job.description
        assertEquals Date.parse('yyyyMMddHHmmss', '20100225100220').dateTimeString, job.dateStarted.dateTimeString
        assertEquals 15000, job.totalBudget
    }

    @Test
    void testParseCrawlReport() {
        /**
         * Crawl Name: Serials-2010-02
         Crawl Status: Finished - Ended by operator
         Duration Time: 13d23h39m10s578ms
         Total Seeds Crawled: 2022
         Total Seeds not Crawled: 7
         Total Hosts Crawled: 204790
         Total Documents Crawled: 18719872
         Processed docs/sec: 15.48
         Bandwidth in Kbytes/sec: 991
         Total Raw Data Size in Bytes: 1226573387843 (1.1 TB)
         Novel Bytes: 1226573385193 (1.1 TB)
         Not-modified Bytes: 2650 (2.6 KB)

         */

        File crawReport = new File(getClass().getResource(jobDirHeritrix1 + 'crawl-report.txt').getFile())
        ImportJobService service = new ImportJobService()
        CrawlJobReport report = service.parseCrawlReport(crawReport)
        assertEquals 1226573387843, report.crawlSize
        assertEquals '13d23h39m10s578ms', report.duration
        assertEquals 2022, report.seedsCrawled
        assertEquals 204790, report.hostsCrawled
        assertEquals 18719872, report.documentsCount
    }

    @Test
    void testParseSeedList() {
        File seedTxt = new File(getClass().getResource(jobDirHeritrix1 + 'seeds.txt').getFile())
        ImportJobService service = new ImportJobService()
        Seedlist seedlist = service.parseSeedList(seedTxt)

        assertTrue seedlist.contains('http://www.fi.muni.cz/~qprokes')
    }
}
