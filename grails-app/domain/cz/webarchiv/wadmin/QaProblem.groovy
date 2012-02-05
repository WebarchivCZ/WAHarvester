package cz.webarchiv.wadmin

class QaProblem {
  String problem
  String descriptions
  String question
  String comments

  static hasMany = [qaChecks: QaCheck]

  static mapping = {
    datasource('wadmin')
    table 'qa_problems'
    qaChecks column: 'qa_check_id', joinTable: 'qa_checks_qa_problems'
  }

  static constraints = {

  }
}
