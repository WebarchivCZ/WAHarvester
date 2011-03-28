package cz.webarchiv.wadmin

/**
 * Domain class for Quality Assurance checks done by curators
 */
class QaCheck
{
    Resource resource
    Curator curator
    Date dateChecked
    Date dateCrawled
    Integer solution
    Date solutionDate
    Curator solutionUser
    String proxyProblems
    String comments
    Integer ticketNo

    static hasMany = [problems: QaProblem]
    static belongsTo = QaProblem

    static mapping = {
        table 'qa_checks'
        problems column: 'qa_problem_id', joinTable: 'qa_checks_qa_problems'
    }

    static constraints = {
        resource()
    }
}
