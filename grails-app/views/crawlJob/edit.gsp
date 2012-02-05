<%@ page import="cz.webarchiv.wah.CrawlJob" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'crawlJob.label', default: 'CrawlJob')}"/>
  <title><g:message code="default.edit.label" args="[entityName]"/></title>
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
  <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${crawlJobInstance}">
    <div class="errors">
      <g:renderErrors bean="${crawlJobInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${crawlJobInstance?.id}"/>
    <g:hiddenField name="version" value="${crawlJobInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="crawlJob.name.label" default="Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'name', 'errors')}">
            <g:textField name="name" value="${crawlJobInstance?.name}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="priority"><g:message code="crawlJob.priority.label" default="Priority"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'priority', 'errors')}">
            <g:select name="priority" from="${1..3}" value="${fieldValue(bean: crawlJobInstance, field: 'priority')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="directoryName"><g:message code="crawlJob.directoryName.label" default="Directory Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'directoryName', 'errors')}">
            <g:textField name="directoryName" value="${crawlJobInstance?.directoryName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="comments"><g:message code="crawlJob.comments.label" default="Comments"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'comments', 'errors')}">
            <g:textField name="comments" value="${crawlJobInstance?.comments}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="dateFinished"><g:message code="crawlJob.dateFinished.label" default="Date Finished"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'dateFinished', 'errors')}">
            <g:datePicker name="dateFinished" precision="day" value="${crawlJobInstance?.dateFinished}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="dateStarted"><g:message code="crawlJob.dateStarted.label" default="Date Started"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'dateStarted', 'errors')}">
            <g:datePicker name="dateStarted" precision="day" value="${crawlJobInstance?.dateStarted}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="description"><g:message code="crawlJob.description.label" default="Description"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'description', 'errors')}">
            <g:textField name="description" value="${crawlJobInstance?.description}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="heritrix"><g:message code="crawlJob.heritrix.label" default="Heritrix"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'heritrix', 'errors')}">
            <g:select name="heritrix.id" from="${cz.webarchiv.wah.heritrix.Heritrix.list()}" optionKey="id"
                      value="${crawlJobInstance?.heritrix?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="launchCount"><g:message code="crawlJob.launchCount.label" default="Launch Count"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'launchCount', 'errors')}">
            <g:textField name="launchCount" value="${fieldValue(bean: crawlJobInstance, field: 'launchCount')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="operator"><g:message code="crawlJob.operator.label" default="Operator"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'operator', 'errors')}">
            <g:select name="operator.id" from="${cz.webarchiv.wah.User.list()}" optionKey="id"
                      value="${crawlJobInstance?.operator?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="orderXml"><g:message code="crawlJob.orderXml.label" default="Order Xml"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'orderXml', 'errors')}">
            <g:textField name="orderXml" value="${crawlJobInstance?.orderXml}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="report"><g:message code="crawlJob.report.label" default="Report"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'report', 'errors')}">
            <g:select name="report.id" from="${cz.webarchiv.wah.CrawlJobReport.list()}" optionKey="id"
                      value="${crawlJobInstance?.report?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="seedlist"><g:message code="crawlJob.seedlist.label" default="Seedlist"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'seedlist', 'errors')}">
            <g:select name="seedlist.id" from="${cz.webarchiv.wah.Seedlist.list()}" optionKey="id"
                      value="${crawlJobInstance?.seedlist?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="status"><g:message code="crawlJob.status.label" default="Status"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'status', 'errors')}">
            <g:select name="status" from="${cz.webarchiv.wah.CrawlStatus?.values()}"
                      keys="${cz.webarchiv.wah.CrawlStatus?.values()*.name()}"
                      value="${crawlJobInstance?.status?.name()}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="totalBudget"><g:message code="crawlJob.totalBudget.label" default="Total Budget"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlJobInstance, field: 'totalBudget', 'errors')}">
            <g:textField name="totalBudget" value="${fieldValue(bean: crawlJobInstance, field: 'totalBudget')}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>

    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update"
                                           value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete"
                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
