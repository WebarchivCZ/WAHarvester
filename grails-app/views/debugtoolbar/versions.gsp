<ul>
    <li>App version: %{--
  - This file is part of the WA Harvester.
  -
  - Licensed to the WebArchiv (WA) by Adam Brokes
  -
  - The IA licenses this file to You under the Apache License, Version 2.0
  - (the "License"); you may not use this file except in compliance with
  - the License.  You may obtain a copy of the License at
  -
  -        http://www.apache.org/licenses/LICENSE-2.0
  -
  - Unless required by applicable law or agreed to in writing, software
  - distributed under the License is distributed on an "AS IS" BASIS,
  - WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  - See the License for the specific language governing permissions and
  - limitations under the License.
  -
  - 2010
  --}%

<g:meta name="app.version"></g:meta></li>
    <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
    <li>JVM version: ${System.getProperty('java.version')}</li>
</ul>

<table>
    <thead>
    <tr>
        <th>Plugin</th>
        <th>Version</th>
    </tr>
    </thead>
    <tbody>

    <g:set var="pluginManager"
            value="${applicationContext.getBean('pluginManager')}"></g:set>

    <g:each var="plugin" status="i" in="${pluginManager.allPlugins}">
        <tr class="${(i % 2) == 0 ? 'djDebugOdd' : 'djDebugEven'}">
            <td>${plugin.name}</td>
            <td>${plugin.version}</td>
        </tr>
    </g:each>

    </tbody>
</table>
