package cz.webarchiv.wah
/**
 * CrawlJob class, every crawling job has one record in database
 * Based on Heritrix class CrawlJob
 * @author nanux
 */

class CrawlJob {
    String name
    CrawlStatus status
    String statusDescription
    Integer priority
    String orderXml

    Date dateCreated
    Date lastUpdated

    public CrawlJob(String name) {
        this.name = name
    }

    static constraints = {
        name(blank: false, nullable: false)
        priority(range: 1..3)
    }

    static mappings = {
        orderXml type: 'text'
    }

    static hasMany = [seedlists: Seedlist]

    // TODO: decide if this function is needed

    static List<CrawlJob> getRunning() {
        return CrawlJob.findAllByStatus(CrawlStatus.ACTIVE)
    }

}
/**
 * Enum with values assignable to CrawlJob.status
 * Based on Heritrix CrawlJob.getJobStatusDescription()
 */
enum CrawlStatus {
    UNBUILD('Unbuild'),
    ACTIVE('Active'),
    READY('Ready'),
    FINISHED('Finished'),
    UNKNOWN('Unknown')

    String status

    /**
     *
     * @param status name of status
     * @return new CrawlStatus instance
     */
    CrawlStatus(String status) {
        this.status = status
    }

    /**
     * @return lis of available CrawlJob statuses
     */
    static list() {
        [UNBUILD, ACTIVE, READY, FINISHED, UNKNOWN]
    }

}