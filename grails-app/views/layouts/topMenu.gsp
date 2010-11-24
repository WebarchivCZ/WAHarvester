<ul class="box">
    <g:each var="c" in="['dashboard', 'monitor', 'crawlJob', 'statistics', 'qualityAssurance', 'crawlProfile', 'resource']">
        <g:set var="itemContent">
            <g:link controller="${c}">
                <span><g:message code="wah.topmenu.${c}"/></span>
            </g:link>
        </g:set>
        <g:if test="${controllerName == c}">
            <li id="menu-active">${itemContent}</li>
        </g:if>
        <g:else>
            <li>${itemContent}</li>
        </g:else>
    </g:each>
</ul>