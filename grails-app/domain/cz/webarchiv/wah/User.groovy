package cz.webarchiv.wah

class User
{
    String username
    String password
    String email
    String firstname
    String lastname

    static hasMany = [jobs: CrawlJob]

    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        password blank: false
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities()
    {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }
}
