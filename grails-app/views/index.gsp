<html>
<head>
    <title>Welcome to Grails</title>
    <meta name="layout" content="main"/>
</head>
<body>
<div id="nav">
    <div class="homePagePanel">
        <div class="panelTop"></div>
        <div class="panelBtm"></div>
    </div>
</div>
<div id="pageBody">
    <h1>Welcome to Grails</h1>
    <p>Congratulations, you have successfully started your first Grails application! At the moment
    this is the default page, feel free to modify it to either redirect to a controller or display whatever
    content you may choose. Below is a list of controllers that are currently deployed in this application,
    click on each to execute its default action:</p>

    <div id="controllerList" class="dialog">
        <h2>Available Controllers:</h2>
        <ul>
        %{--
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
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
    </div>
</div>
</body>
</html>
