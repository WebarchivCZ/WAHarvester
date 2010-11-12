package cz.webarchiv.wadmin

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

    static hasMany = [resources: Resource]
}
