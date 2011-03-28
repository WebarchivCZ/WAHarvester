package cz.webarchiv.wah

class CrawlJobReport
{
    /**
     * how long does the job takes
     */
    String duration
    /**
     * how many urls has been downloaded
     */
    Integer downloadedURI
    /**
     * how many urls was queued in the end
     */
    Integer queuedURI
    /**
     * journal of the job
     */
    String journal
    /**
     * how many seeds was crawled
     */
    Integer seedsCrawled
    /**
     * crawled hosts count
     */
    Integer hostsCrawled
    /**
     * crawled documents count
     */
    Integer documentsCount
    /**
     * raw  data size in Bytes
     */
    Long crawlSize
    /**
     * status description
     */
    String statusDescription

    static belongsTo = [job: CrawlJob]
    static constraints = {
        downloadedURI(nullable: true)
        journal(nullable: true)
        queuedURI(nullable: true)
    }
}
