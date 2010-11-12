package cz.webarchiv.wah

class CrawlConfig {
    static constraints = {
    }

    static hasMany = [crawlJobs: CrawlJob]
    static belongsTo = CrawlType


}
