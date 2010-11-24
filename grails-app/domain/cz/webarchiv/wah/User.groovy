package cz.webarchiv.wah

class User {
    String username
    String password
    String email
    String firstname
    String lastname

    static hasMany = [jobs: CrawlJob]

    static constraints = {
    }
}
