package cz.webarchiv.wah.heritrix

import grails.test.*
import org.archive.crawler.framework.*

class HeritrixTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCrawlStatus() {
        CrawlStatus cs = CrawlStatus.CREATED
        assertEquals 'Created', cs.getDescription()
    }
}
