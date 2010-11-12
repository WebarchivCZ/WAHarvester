package cz.webarchiv.wah

class Schedule {
    static constraints = {
    }

    static hasMany = [crawlTypes: CrawlType]
}
