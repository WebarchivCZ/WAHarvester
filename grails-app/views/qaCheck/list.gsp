<%@ page import="cz.webarchiv.wadmin.QaCheck" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'qaCheck.label', default: 'QaCheck')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton"><g:link class="create" action="create">Nová kontrola kvality</g:link></span>
</div>

<div class="body">
  <h1>Výpis QA záznamů</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="id" title="${message(code: 'qaCheck.id.label', default: 'Id')}"/>

        <th><g:message code="qaCheck.resource.label" default="Resource"/></th>

        <th>Sklizně</th>

        <g:sortableColumn property="comments" title="${message(code: 'qaCheck.comments.label', default: 'Comments')}"/>

        <th><g:message code="qaCheck.curator.label" default="Curator"/></th>

        <g:sortableColumn property="dateChecked"
                          title="${message(code: 'qaCheck.dateChecked.label', default: 'Date Checked')}"/>

        <g:sortableColumn property="dateCrawled"
                          title="${message(code: 'qaCheck.dateCrawled.label', default: 'Date Crawled')}"/>

        <th>Trac</th>
        <th>WA Admin</th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${qaCheckInstanceList}" status="i" var="qaCheckInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show"
                      id="${qaCheckInstance.id}">${fieldValue(bean: qaCheckInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: qaCheckInstance, field: "resource")}</td>

          <td><a href="#">sklizně</a></td>

          <td>${fieldValue(bean: qaCheckInstance, field: "comments")}</td>

          <td>${fieldValue(bean: qaCheckInstance, field: "curator")}</td>

          <td><g:formatDate date="${qaCheckInstance.dateChecked}"/></td>

          <td><g:formatDate date="${qaCheckInstance.dateCrawled}"/></td>

          <td><a href="">${fieldValue(bean: qaCheckInstance, field: "ticketNo")}</a></td>
          <td><a href="">WA Admin</a></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${qaCheckInstanceTotal}"/>
  </div>
</div>
</body>
</html>
