package cz.webarchiv.wah

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

    static List<CrawlJob> getRunning() {
        return CrawlJob.findAllByStatus(CrawlStatus.ACTIVE)
    }

}

enum CrawlStatus {
    UNBUILD('Unbuild'),
    ACTIVE('Active'),
    READY('Ready'),
    FINISHED('Finished'),
    UNKNOWN('Unknown')

    String status

    CrawlStatus(String status) {
        this.status = status
    }

    static list() {
        [UNBUILD, ACTIVE, READY, FINISHED, UNKNOWN]
    }

}