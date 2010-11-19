package cz.webarchiv.wah

/**
 * Tests for domain class CrawlJob
 * @author nanux
 */

import grails.test.*

/**
 *
 */
class CrawlJobTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()

        mockDomain(CrawlJob)
        CrawlJob activeJob = new CrawlJob("active job")
        activeJob.status = CrawlStatus.RUNNING
        activeJob.save()
        CrawlJob unknownJob = new CrawlJob("paused job")
        unknownJob.status = CrawlStatus.PAUSED
        unknownJob.save()
        def date = unknownJob.dateCreated
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testGetRunning() {
        def instances = CrawlJob.findAllByStatus(CrawlStatus.RUNNING);
        assert 1, instances.size()
        assert 'active job', instances.get(0).getName()
    }

    void testFindByStatus() {
        def instances = CrawlJob.findAllByStatus(CrawlStatus.PAUSED);
        assert 1, instances.size()
        assert 'unknown job', instances.get(0).getName()
        assert 'unknown job', instances.get(0).name

    }
}
