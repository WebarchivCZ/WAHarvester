hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
  development {
    dataSource {
      pooled = true
      dbCreate = "create-drop"
      url = "jdbc:mysql://localhost/waharvester-test"
      driverClassName = "com.mysql.jdbc.Driver"
      dialect = org.hibernate.dialect.MySQL5InnoDBDialect
      username = "waharvester"
      password = "brumla"
    }
  }
  dateSource_wadmin {
    driverClassName = 'com.mysql.jdbc.Driver'
    dbCreate = "update"
    url = "jdbc:mysql://localhost/wadmin-test"
    username = "waTest"
    password = "test"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
  }
}
test {
  dataSource {
    dbCreate = "update"
    url = "jdbc:h2:mem:testDb"
  }
}
production {
  dataSource {
    dbCreate = "update"
    url = "jdbc:hsqldb:file:prodDb;shutdown=true"
  }
  dateSource_wadmin {
    driverClassName = 'com.mysql.jdbc.Driver'
    dbCreate = "update"
    url = "jdbc:mysql://localhost/wadmin-test"
    username = "waTest"
    password = "test"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
  }
}
