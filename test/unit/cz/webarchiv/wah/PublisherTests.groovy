/*
 * This file is part of the WA Harvester.
 *
 * Licensed to the WebArchiv (WA) by Adam Brokes
 *
 * The IA licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * 2010
 */

package cz.webarchiv.wah

import grails.test.*
import cz.webarchiv.wadmin.Publisher

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
