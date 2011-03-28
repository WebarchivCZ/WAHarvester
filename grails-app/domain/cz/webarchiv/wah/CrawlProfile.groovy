package cz.webarchiv.wah
/**
 * Class representing crawl profile, which could be used for crawl job
 * @author nanux
 */
class CrawlProfile
{
    String name
    String orderXml
    String comments

    static constraints = {
        name(blank: false)
        comments(nullable: true)
    }
    static mapping = {
        orderXml type: 'text'
    }

    static hasMany = [domainSheets: DomainSheet, crawlJobs: CrawlJob]
}
