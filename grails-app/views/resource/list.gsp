<%@ page import="cz.webarchiv.wadmin.Resource" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
  <ul>
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
  </ul>
</div>

<div id="list-resource" class="content scaffold-list" role="main">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table>
    <thead>
    <tr>

      <g:sortableColumn property="url" title="${message(code: 'resource.url.label', default: 'Url')}"/>

      <g:sortableColumn property="comments" title="${message(code: 'resource.comments.label', default: 'Comments')}"/>

      <th><g:message code="resource.creator.label" default="Creator"/></th>

      <g:sortableColumn property="date" title="${message(code: 'resource.date.label', default: 'Date')}"/>

      <g:sortableColumn property="important"
                        title="${message(code: 'resource.important.label', default: 'Important')}"/>

      <th><g:message code="resource.publisher.label" default="Publisher"/></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${resourceInstanceList}" status="i" var="resourceInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show"
                    id="${resourceInstance.id}">${fieldValue(bean: resourceInstance, field: "url")}</g:link></td>

        <td>${fieldValue(bean: resourceInstance, field: "comments")}</td>

        <td>${fieldValue(bean: resourceInstance, field: "creator")}</td>

        <td><g:formatDate date="${resourceInstance.date}"/></td>

        <td><g:formatBoolean boolean="${resourceInstance.important}"/></td>

        <td>${fieldValue(bean: resourceInstance, field: "publisher")}</td>

      </tr>
    </g:each>
    </tbody>
  </table>

  <div class="pagination">
    <g:paginate total="${resourceInstanceTotal}"/>
  </div>
</div>
</body>
</html>
