package cz.webarchiv.wah

/**
 * CrawlJob class, every crawling job has one record in database
 * Based on Heritrix class CrawlJob
 * @author nanux
 */

class CrawlJob {
    /**
     * short name of the job
     */
    String name
    /**
     * job status - enum defined within the class
     */
    CrawlStatus status
    /**
     * priority of the job [range from 1 to 3 - 1 is highest]
     */
    Integer priority
    /**
     * orderXML definition - in mappings defined as text field in database
     */
    String orderXml
    /**
     * operator of the job
     */
    User operator
    /**
     * description of job (in order.xml)
     */
    String description
    /**
     * max budget for queue
     */
    Integer totalBudget
    /**
     * directory name
     */
    String directoryName
    /**
     * job has one seedlist
     */
    Seedlist seedlist
    /**
     * crawl report
     */
    CrawlJobReport report

    String comments

    Integer launchCount

    Date dateStarted
    Date dateFinished

    // Auto generated columns by grails
    Date dateCreated
    Date lastUpdated

    public CrawlJob() {
        super()
    }

    public CrawlJob(String name) {
        super()
        this.name = name
    }

    static constraints = {
        name(blank: false, nullable: false, unique: 'dateStarted')
        priority(range: 1..3)
        directoryName(unique: true)
    }

    /**
     * OrderXML file is saved in 'text' type column (blob)
     */
    static mappings = {
        orderXml type: 'text'
    }

    static addExisting(String path) {
        File d = new File(path)
        println d.toString()
        if (d.exists()) {
            d.eachFileRecurse {println it}
        } else {
            throw new IOException('Cannot open directory path')
        }
    }
}
/**
 * Enum with values assignable to CrawlJob.status
 * Based on Heritrix org.archive.crawler.framework.CrawlStatus
 */
enum CrawlStatus {
    /** Inital value. May not be ready to run/incomplete.           */
    CREATED("Created"),

    /** Job has been successfully submitted to a CrawlJobHandler.           */
    PENDING("Pending"),

    /** Job is being crawled.           */
    RUNNING("Running"),

    /** Job was deleted by user, will not be displayed in UI.           */
    DELETED("Deleted"),

    /** Job was terminted by user input while crawling.           */
    ABORTED("Finished - Ended by operator"),

    /** Something went very wrong.           */
    FINISHED_ABNORMAL("Finished - Abnormal exit from crawling"),

    /** Job finished normally having completed its crawl.           */
    FINISHED("Finished"),

    /** Job finished normally when the specified timelimit was hit.           */
    FINISHED_TIME_LIMIT("Finished - Timelimit hit"),

    /**
     * Job finished normally when the specifed amount of data (MB) had been
     * downloaded
     */
    FINISHED_DATA_LIMIT("Finished - Maximum amount of data limit hit"),

    /**
     * Job finished normally when the specified number of documents had been
     * fetched.
     */
    FINISHED_DOCUMENT_LIMIT("Finished - Maximum number of documents limit hit"),

    FINISHED_WRITE_LIMIT("Finished - Maximum bytes written"),

    /**
     * Job is going to be temporarly stopped after active threads are finished.
     */
    WAITING_FOR_PAUSE("Pausing - Waiting for threads to finish"),

    /** Job was temporarly stopped. State is kept so it can be resumed           */
    PAUSED("Paused"),

    /**
     * Job is being checkpointed.  When finished checkpointing, job is set
     * back to STATUS_PAUSED (Job must be first paused before checkpointing
     * will run).
     */
    CHECKPOINTING("Checkpointing"),

    /** Job could not be launced due to an InitializationException           */
    MISCONFIGURED("Could not launch job - Fatal InitializationException"),

    /** Job is actually a profile           */
    PROFILE("Profile"),

    /** Prepared.           */
    PREPARING("Preparing");

    public String description

    /**
     * @param status name of status
     * @return new CrawlStatus instance
     */
    CrawlStatus(String description) {
        this.description = description
    }

    /**
     * @return lis of available CrawlJob statuses
     */
    static list() {
        [CREATED]
    }

}