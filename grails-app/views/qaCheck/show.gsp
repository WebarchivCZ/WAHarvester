<%@ page import="cz.webarchiv.wadmin.QaCheck" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'qaCheck.label', default: 'QaCheck')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                         args="[entityName]"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                             args="[entityName]"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="default.show.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: qaCheckInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.resource.label" default="Resource"/></td>

        <td valign="top" class="value"><g:link controller="resource" action="show"
                                               id="${qaCheckInstance?.resource?.id}">${qaCheckInstance?.resource?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.comments.label" default="Comments"/></td>

        <td valign="top" class="value">${fieldValue(bean: qaCheckInstance, field: "comments")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.curator.label" default="Curator"/></td>

        <td valign="top" class="value"><g:link controller="curator" action="show"
                                               id="${qaCheckInstance?.curator?.id}">${qaCheckInstance?.curator?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.dateChecked.label" default="Date Checked"/></td>

        <td valign="top" class="value"><g:formatDate date="${qaCheckInstance?.dateChecked}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.dateCrawled.label" default="Date Crawled"/></td>

        <td valign="top" class="value"><g:formatDate date="${qaCheckInstance?.dateCrawled}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.problems.label" default="Problems"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${qaCheckInstance.problems}" var="p">
              <li><g:link controller="qaProblem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.proxyProblems.label" default="Proxy Problems"/></td>

        <td valign="top" class="value">${fieldValue(bean: qaCheckInstance, field: "proxyProblems")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.solution.label" default="Solution"/></td>

        <td valign="top" class="value">${fieldValue(bean: qaCheckInstance, field: "solution")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.solutionDate.label" default="Solution Date"/></td>

        <td valign="top" class="value"><g:formatDate date="${qaCheckInstance?.solutionDate}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.solutionUser.label" default="Solution User"/></td>

        <td valign="top" class="value"><g:link controller="curator" action="show"
                                               id="${qaCheckInstance?.solutionUser?.id}">${qaCheckInstance?.solutionUser?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="qaCheck.ticketNo.label" default="Ticket No"/></td>

        <td valign="top" class="value">${fieldValue(bean: qaCheckInstance, field: "ticketNo")}</td>

      </tr>

      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${qaCheckInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit"
                                           value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete"
                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
