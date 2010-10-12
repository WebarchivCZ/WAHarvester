package cz.webarchiv.wah

class Seed {

    String url
    Boolean redirect
    Boolean robots
    Date validFrom
    Date validTo
    String comments

    static constraints = {
    }

    static mapping = {
        table 'seeds'
    }

    static belongsTo = [resource: Resource, seedStatus: SeedStatus]
}
