package cz.webarchiv.wah

import grails.test.GrailsUnitTestCase
import org.junit.Test

class ImportJobServiceIntegrationTests extends GrailsUnitTestCase {
  final String DIR_JOB_HERITRIX_1 = '/resources/jobDirectoryHeritrix1/'

  def ImportJobService service

  protected void setUp() {
    super.setUp()
    service = new ImportJobService()
  }

  protected void tearDown() {
    super.tearDown()
  }

  @Test
  void testSavingJobImport() {
    CrawlJob[] jobs = service.importDirectory(getClass().getResource(DIR_JOB_HERITRIX_1).getPath())
    assertEquals 1, CrawlJob.count()
    assertEquals 1, jobs.length
    assertFalse 2 == CrawlJob.count()

    CrawlJob job = jobs[0]

    assertTrue job.validate()
    assertNotNull job.save()
    assertTrue CrawlJob.exists(job.id)

    assertNotNull "Crawl report doesn't have set ID attribute", job.report.id
    assertTrue "Crawl report doesn't exist", CrawlJobReport.exists(job.report.id)
    assertEquals 1, CrawlJobReport.count()
    assertEquals 1, Seedlist.count()
  }
}
