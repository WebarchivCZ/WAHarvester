package cz.webarchiv.wadmin

class Curator {
  String username
  String password
  String vocative
  String firstname
  String lastname
  String email
  String icq
  String skype
  Boolean active
  Integer logins
  String comments

  static constraints = {
  }
  static mapping = {
    datasource('wadmin')
    table 'curators'
    username(size: 3..20)
    email(email: true)
  }

  static hasMany = [resources: Resource]

  public String toString() {
    return firstname
  }
}
