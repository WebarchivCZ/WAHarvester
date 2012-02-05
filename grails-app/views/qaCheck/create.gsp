<%@ page import="cz.webarchiv.wadmin.QaCheck" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'qaCheck.label', default: 'QaCheck')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
  </span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                         args="[entityName]"/></g:link></span>
</div>

<div class="body">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${qaCheckInstance}">
    <div class="errors">
      <g:renderErrors bean="${qaCheckInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="resource"><g:message code="qaCheck.resource.label" default="Resource"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'resource', 'errors')}">
            <g:select name="resource.id" from="${cz.webarchiv.wadmin.Resource.list()}" optionKey="id"
                      value="${qaCheckInstance?.resource?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="comments"><g:message code="qaCheck.comments.label" default="Comments"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'comments', 'errors')}">
            <g:textField name="comments" value="${qaCheckInstance?.comments}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="curator"><g:message code="qaCheck.curator.label" default="Curator"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'curator', 'errors')}">
            <g:select name="curator.id" from="${cz.webarchiv.wadmin.Curator.list()}" optionKey="id"
                      value="${qaCheckInstance?.curator?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="dateChecked"><g:message code="qaCheck.dateChecked.label" default="Date Checked"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'dateChecked', 'errors')}">
            <g:datePicker name="dateChecked" precision="day" value="${qaCheckInstance?.dateChecked}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="dateCrawled"><g:message code="qaCheck.dateCrawled.label" default="Date Crawled"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'dateCrawled', 'errors')}">
            <g:datePicker name="dateCrawled" precision="day" value="${qaCheckInstance?.dateCrawled}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="proxyProblems"><g:message code="qaCheck.proxyProblems.label" default="Proxy Problems"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'proxyProblems', 'errors')}">
            <g:textField name="proxyProblems" value="${qaCheckInstance?.proxyProblems}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="solution"><g:message code="qaCheck.solution.label" default="Solution"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'solution', 'errors')}">
            <g:textField name="solution" value="${fieldValue(bean: qaCheckInstance, field: 'solution')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="solutionDate"><g:message code="qaCheck.solutionDate.label" default="Solution Date"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'solutionDate', 'errors')}">
            <g:datePicker name="solutionDate" precision="day" value="${qaCheckInstance?.solutionDate}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="solutionUser"><g:message code="qaCheck.solutionUser.label" default="Solution User"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'solutionUser', 'errors')}">
            <g:select name="solutionUser.id" from="${cz.webarchiv.wadmin.Curator.list()}" optionKey="id"
                      value="${qaCheckInstance?.solutionUser?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="ticketNo"><g:message code="qaCheck.ticketNo.label" default="Ticket No"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: qaCheckInstance, field: 'ticketNo', 'errors')}">
            <g:textField name="ticketNo" value="${fieldValue(bean: qaCheckInstance, field: 'ticketNo')}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save"
                                           value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
