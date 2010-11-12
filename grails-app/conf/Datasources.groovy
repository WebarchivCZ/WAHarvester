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

datasources = {

    datasource(name: 'wadmin') {
        driverClassName('com.mysql.jdbc.Driver')
        dbCreate("update")
        url("jdbc:mysql://localhost/wadmin-test")
        username("waTest")
        password("test")
        domainClasses([cz.webarchiv.wadmin.Curator, cz.webarchiv.wadmin.Publisher, cz.webarchiv.wadmin.Resource,
                cz.webarchiv.wadmin.Seed, cz.webarchiv.wadmin.SeedStatus])
        dialect(org.hibernate.dialect.MySQL5InnoDBDialect)
        pooled(true)
        environments(['development'])
    }
}
