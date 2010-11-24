<%@ page import="grails.converters.JSON" %>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="content-language" content="en"/>
    <meta name="robots" content="noindex,nofollow"/>
    <link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: 'reset.css')}"/> <!-- RESET -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: 'main.css')}"/> <!-- MAIN STYLE SHEET -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: '2col.css')}" title="2col"/> <!-- DEFAULT: 2 COLUMNS -->
    <link rel="alternate stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: '1col.css')}" title="1col"/> <!-- ALTERNATE: 1 COLUMN -->
<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: 'main-ie6.css')}" /><![endif]--> <!-- MSIE6 -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: 'style.css')}"/> <!-- GRAPHIC THEME -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: 'mystyle.css')}"/> <!-- WRITE YOUR CSS CODE HERE -->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="${resource(dir: 'css', file: 'fullcalendar.css')}"/> <!-- FULLCalendar jquery plugin -->
<g:javascript library="jquery" plugin="jquery"/>
<jqui:resources/>
<jq:plugin name="toggle"/>
<jq:plugin name="switcher"/>
<g:javascript src="wahJS.js"/>
    <title><g:layoutTitle default="WA Harvester - správce sklizní"/></title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
</head>

<body>
<div id="main">

    <!-- Tray -->
    <div id="tray" class="box">

        <p class="f-left box">

            <!-- Switcher -->
            <span class="f-left" id="switcher">
                <a href="#" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="${resource(dir: 'design', file: 'switcher-1col.gif')}" alt="1 Column"/></a>
                <a href="#" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="${resource(dir: 'design', file: 'switcher-2col.gif')}" alt="2 Columns"/></a>
            </span>

            Stroj: <strong>${request.getServerName()}</strong>

        </p>

        <p class="f-right">Uživatel: <strong><a href="#">Administrator</a></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="#" id="logout">Odhlásit</a></strong></p>

    </div> <!--  /tray -->

    <hr class="noscreen"/>

    <!-- Menu -->
    <div id="menu" class="box">

        <ul class="box f-right">
            <li><a href="#"><span><strong>&laquo; do Tracu</strong></span></a> <a href="#"><span><strong>do WAdminu &raquo;</strong></span></a></li>
        </ul>

        <g:applyLayout name="topMenu"/>

    </div> <!-- /header -->

    <hr class="noscreen"/>

    <!-- Columns -->
    <div id="cols" class="box">

        <!-- Aside (Left Column) -->
        <div id="aside" class="box">

            <div class="padding box">

                <!-- Logo (Max. width = 200px) -->
                <p id="logo"><a href="#"><img src="${resource(dir: 'design', file: 'logo.png')}" alt="WA Harvester logo" title="Visit Site"/></a></p>

                <!-- Search -->
                <form action="#" method="get" id="search">
                    <fieldset>
                        <legend>Vyhledat</legend>

                        <p><input type="text" size="17" name="" class="input-text"/>&nbsp;<input type="submit" value="OK" class="input-submit-02"/><br/>
                            <a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p>

                        <!-- Advanced search -->
                        <div id="search-options" style="display:none;">

                            <p>
                                <label><input type="checkbox" name="" checked="checked"/> Option I.</label><br/>
                                <label><input type="checkbox" name=""/> Option II.</label><br/>
                                <label><input type="checkbox" name=""/> Option III.</label>
                            </p>

                        </div> <!-- /search-options -->

                    </fieldset>
                </form>

                <!-- Create a new project -->
                <p id="btn-create" class="box"><a href="#"><span>Vytvořit novou sklizeň</span></a></p>

            </div> <!-- /padding -->

            <ul class="box">
                <li id="submenu-active"><a href="#">Sklizně seriálů</a></li>
                <ul>
                    <li><a href="#">Seznam</a></li>
                    <li><a href="#">Statistiky</a></li>
                    <li><a href="#">Vytvořit profil</a></li>
                </ul>
                <li><a href="#">Sklizně seriálů bez smlouvy</a></li>
                <li><a href="#">Testovací sklizně</a></li>
                <li><a href="#">QA sklizně</a></li>
                <li><a href="#">Zaarchivovat stránku</a></li>
            </ul>

            <p>&nbsp;&nbsp;<a href="javascript:toggle('application-status');" class="ico-drop">Status aplikace</a></p>

            <!-- Advanced search -->
            <div id="application-status" style="display:none;">

                <ul>
                    <li>App version: <g:meta name="app.version"></g:meta></li>
                    <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                    <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                    <li>JVM version: ${System.getProperty('java.version')}</li>
                    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                </ul>

            </div> <!-- /search-options -->

            <p>&nbsp;&nbsp;<a href="javascript:toggle('plugin-status');" class="ico-drop">Status pluginů</a></p>

            <!-- Advanced search -->
            <div id="plugin-status" style="display:none;">
                <ul>
                    <g:set var="pluginManager"
                            value="${applicationContext.getBean('pluginManager')}"></g:set>

                    <g:each var="plugin" in="${pluginManager.allPlugins}">
                        <li>${plugin.name} - ${plugin.version}</li>
                    </g:each>

                </ul>
            </div>
        </div> <!-- /aside -->

        <hr class="noscreen"/>

        <!-- Content (Right Column) -->
        <div id="content" class="box">
            <g:layoutBody/>
        </div>

    </div> <!-- /cols -->

    <hr class="noscreen"/>

    <!-- Footer -->
    <div id="footer" class="box">

        <p class="f-left">&copy; 2010 <a href="http://www.webarchiv.cz">WebArchiv</a>, All Rights Reserved &reg;</p>

        <p class="f-right">Templates by <a href="http://www.adminizio.com/">Adminizio</a></p>
        <p><a href="#" id="debugOpen">Debug</a></p>

    </div> <!-- /footer -->

</div> <!-- /main -->

<div id="debugInfo" class="hidden" style="width: 800px;"><debug:info/></div>

</body>
</html>