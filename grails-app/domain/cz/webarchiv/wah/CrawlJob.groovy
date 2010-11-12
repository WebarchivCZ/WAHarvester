package cz.webarchiv.wah

class CrawlJob {
    Integer status
    Integer priority
    String orderXml

    static constraints = {
    }

    static mappings = {
        orderXml type: 'text'
    }

    static hasMany = Seedlist
}
