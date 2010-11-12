datasources = {

    datasource(name: 'wadmin') {
        driverClassName('com.mysql.jdbc.Driver')
        dbCreate("update")
        url("jdbc:mysql://localhost/wadmin-test")
        username("waTest")
        password("test")
        domainClasses([cz.webarchiv.wadmin.Curator, cz.webarchiv.wadmin.Publisher, cz.webarchiv.wadmin.Resource,
                cz.webarchiv.wadmin.Seed, cz.webarchiv.wadmin.SeedStatus])
        dialect(org.hibernate.dialect.MySQL5InnoDBDialect)
        pooled(true)
        environments(['development'])
    }
}
