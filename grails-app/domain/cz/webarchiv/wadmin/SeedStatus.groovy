package cz.webarchiv.wadmin

class SeedStatus {

    String status
    String comments

    static constraints = {
    }

    static mapping = {
        table 'seed_status'
    }

    // too much noise in scaffolding
    //static hasMany = [seeds: Seed]
}
