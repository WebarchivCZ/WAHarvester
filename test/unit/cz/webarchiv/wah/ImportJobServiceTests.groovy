package cz.webarchiv.wah

import grails.test.*
import org.junit.Test

class ImportJobServiceTests extends GrailsUnitTestCase
{
    static final String DIR_JOB_HERITRIX_1 = '/resources/jobDirectoryHeritrix1/'

    def ImportJobService service;

    protected void setUp()
    {
        super.setUp()
        mockLogging ImportJobService.class
        mockDomain(CrawlJob)
        mockDomain(CrawlJobReport)
        mockDomain(Seedlist)
        service = new ImportJobService()
    }

    protected void tearDown()
    {
        super.tearDown()
    }

    @Test
    void testImportDirectory()
    {
        CrawlJob[] jobs = service.importDirectory(getClass().getResource(DIR_JOB_HERITRIX_1).getPath())

        assertEquals 'Serials-2010-02', jobs[0].name
        assertEquals 'jobDirectoryHeritrix1', jobs[0].directoryName
        assertEquals 'sklizen serialu se smlouvou 24. 2. 2010', jobs[0].description
        assertEquals Date.parse('yyyyMMddHHmmss', '20100225100220').dateTimeString, jobs[0].dateStarted.dateTimeString
        assertEquals 15000, jobs[0].totalBudget
        assertEquals 'Finished - Ended by operator', jobs[0].report.statusDescription
        assertTrue jobs[0].seedlist.contains('http://www.fi.muni.cz/~qprokes')
    }

    @Test
    void testParseOrderXML()
    {
        File orderXML = new File(getClass().getResource(DIR_JOB_HERITRIX_1 + 'order.xml').getFile())
        CrawlJob job = service.parseOrderXML(orderXML)

        assertEquals orderXML.getText(), job.orderXml
        assertEquals 'Serials-2010-02', job.name
        assertEquals 'sklizen serialu se smlouvou 24. 2. 2010', job.description
        assertEquals Date.parse('yyyyMMddHHmmss', '20100225100220').dateTimeString, job.dateStarted.dateTimeString
        assertEquals 15000, job.totalBudget
    }

    @Test
    void testParseCrawlReport()
    {
        File crawReport = new File(getClass().getResource(DIR_JOB_HERITRIX_1 + 'crawl-report.txt').getFile())
        CrawlJobReport report = service.parseCrawlReport(crawReport)
        assertEquals 1226573387843, report.crawlSize
        assertEquals '13d23h39m10s578ms', report.duration
        assertEquals 2022, report.seedsCrawled
        assertEquals 204790, report.hostsCrawled
        assertEquals 18719872, report.documentsCount
    }

    @Test
    void testParseSeedList()
    {
        File seedTxt = new File(getClass().getResource(DIR_JOB_HERITRIX_1 + 'seeds.txt').getFile())
        ImportJobService service = new ImportJobService()
        Seedlist seedlist = service.parseSeedList(seedTxt)

        assertTrue seedlist.contains('http://www.fi.muni.cz/~qprokes')
    }


}
