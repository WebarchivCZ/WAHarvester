package cz.webarchiv.wah

import grails.test.*
import org.junit.Test

class ImportJobServiceTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    @Test
    void testParseOrderXML() {
        File orderXML = new File(getClass().getResource('/resources/order-v1.14.4.xml').getFile())
        ImportJobService service = new ImportJobService()
        CrawlJob job = service.parseOrderXML(orderXML)

        assertEquals orderXML.getText(), job.orderXml
        assertEquals 'Serials-2010-02', job.name
        assertEquals 'sklizen serialu se smlouvou 24. 2. 2010', job.description
        assertEquals Date.parse('yyyyMMddHHmmss', '20100225100220').dateTimeString, job.dateStarted.dateTimeString
        assertEquals 15000, job.totalBudget

    }
}
