package cz.webarchiv.wah

class DomainSheet
{
    String orderXML
    String comments
    String name
    String description

    static constraints = {
    }

    static belongsTo = CrawlProfile
}
