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

/**
 *
 */
class CrawlJobTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()

        mockDomain(CrawlJob)
        CrawlJob activeJob = new CrawlJob("active job")
        activeJob.status = CrawlStatus.RUNNING
        activeJob.save()
        CrawlJob unknownJob = new CrawlJob("paused job")
        unknownJob.status = CrawlStatus.PAUSED
        unknownJob.save()
        def date = unknownJob.dateCreated
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testGetRunning() {
        def instances = CrawlJob.findAllByStatus(CrawlStatus.RUNNING);
        assert 1, instances.size()
        assert 'active job', instances.get(0).getName()
    }

    void testFindByStatus() {
        def instances = CrawlJob.findAllByStatus(CrawlStatus.PAUSED);
        assert 1, instances.size()
        assert 'unknown job', instances.get(0).getName()
        assert 'unknown job', instances.get(0).name

    }
}
