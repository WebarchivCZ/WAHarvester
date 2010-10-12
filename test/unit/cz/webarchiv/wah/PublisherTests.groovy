package cz.webarchiv.wah

import grails.test.*
import cz.webarchiv.wah.Publisher

class PublisherTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
        def publisher = new Publisher(name: 'Honza', comments: 'komentar')
        assertEquals publisher.name, 'Honza'
        assertEquals publisher.comments, 'komentar'
        assertNotSame publisher.name, 'Pepa'
    }
}
