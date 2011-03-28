package cz.webarchiv.wah

class Seedlist
{
    /**
     * list of seeds
     */
    String seeds
    /**
     * if the seeds.txt file is too large to store in database then it should be located outside in regular file
     */
    String fileLocation
    static constraints = {
        fileLocation(nullable: true)
        seeds(maxSize: 10000000)
    }

    static mappings = {
        seeds type: 'text'
    }

    static belongsTo = CrawlJob

    public boolean contains(String url)
    {
        if (seeds.contains(url)) {
            return true
        } else {return false}
    }

    public String toString()
    {
        return seeds.toString()
    }
}
