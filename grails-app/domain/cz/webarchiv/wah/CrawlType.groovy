package cz.webarchiv.wah

class CrawlType {
    String type
    String description
    String comments

    static constraints = {
    }

    static hasOne = Schedule
    static hasMany = [crawlJobs: CrawlJob]
}
