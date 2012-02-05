package cz.webarchiv.wadmin

class SeedStatus {
  String status
  String comments

  static constraints = {
  }

  static mapping = {
    datasource('wadmin')
    table 'seed_status'
  }

  // too much noise in scaffolding
  //static hasMany = [seeds: Seed]
}
