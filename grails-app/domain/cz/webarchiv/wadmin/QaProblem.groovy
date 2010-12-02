package cz.webarchiv.wadmin

class QaProblem {
    static hasMany = [qaChecks: QaCheck]

    static mapping = {
        table 'qa_problems'
        qaChecks column: 'qa_check_id', joinTable: 'qa_checks_qa_problems'
    }

    static constraints = {

    }
}
