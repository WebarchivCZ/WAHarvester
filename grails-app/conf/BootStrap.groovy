import cz.webarchiv.wah.Role
import cz.webarchiv.wah.User
import cz.webarchiv.wah.UserRole

class BootStrap
{
    def springSecurityService

    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                firstname: 'Firstname',
                lastname: 'Lastname',
                email: 'admin@email.com',
                password: springSecurityService.encodePassword('admin'),
                enabled: true).save(failOnError: true)
        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create(adminUser, adminRole)
        }
        if (!adminUser.authorities.contains(userRole)) {
            UserRole.create(adminUser, userRole)
        }
    }
    def destroy = {
    }
}
