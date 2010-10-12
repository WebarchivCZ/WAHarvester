package cz.webarchiv.wah

class Publisher {

    String name
    String comments
    static constraints = {
        name(blank: false)
        comments(nullable: true)
    }
    
    static mapping = {
        table 'publishers'
    }
}
