<%@ page import="cz.webarchiv.wah.CrawlJob" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'crawlJob.label', default: 'CrawlJob')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                             args="[entityName]"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'crawlJob.id.label', default: 'Id')}"/>

        <g:sortableColumn property="name" title="${message(code: 'crawlJob.name.label', default: 'Name')}"/>

        <g:sortableColumn property="priority" title="${message(code: 'crawlJob.priority.label', default: 'Priority')}"/>

        <g:sortableColumn property="directoryName"
                          title="${message(code: 'crawlJob.directoryName.label', default: 'Directory Name')}"/>

        <g:sortableColumn property="comments" title="${message(code: 'crawlJob.comments.label', default: 'Comments')}"/>

        <g:sortableColumn property="dateCreated"
                          title="${message(code: 'crawlJob.dateCreated.label', default: 'Date Created')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${crawlJobInstanceList}" status="i" var="crawlJobInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show"
                      id="${crawlJobInstance.id}">${fieldValue(bean: crawlJobInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: crawlJobInstance, field: "name")}</td>

          <td>${fieldValue(bean: crawlJobInstance, field: "priority")}</td>

          <td>${fieldValue(bean: crawlJobInstance, field: "directoryName")}</td>

          <td>${fieldValue(bean: crawlJobInstance, field: "comments")}</td>

          <td><g:formatDate date="${crawlJobInstance.dateCreated}"/></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${crawlJobInstanceTotal}"/>
  </div>
</div>
</body>
</html>
