package cz.webarchiv.wah

class CrawlConfig
{
    static constraints = {
    }

    static hasMany = [crawlJobs: CrawlJob]
    static belongsTo = CrawlType

    String orderXml
    String comments

    /**
     * OrderXML file is saved in 'text' type column (blob)
     */
    static mappings = {
        orderXml type: 'text'
    }


}
