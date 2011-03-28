package cz.webarchiv.wah

class Schedule
{
    Integer days
    String description
    String comments

    static constraints = {
    }

    static hasMany = [crawlTypes: CrawlType]
}
