package cz.webarchiv.wadmin

class Resource {

    String title
    String url
    Boolean important
    String comments
    Date date
    Publisher publisher

    static constraints = {
        url(url: true)
    }

    static mapping = {
        table 'resources'
    }

    static belongsTo = [creator: Curator]
    static hasMany = [seeds: Seed]

}
