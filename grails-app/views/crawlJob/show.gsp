<%@ page import="cz.webarchiv.wah.CrawlJob" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'crawlJob.label', default: 'CrawlJob')}"/>
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
        <td valign="top" class="name"><g:message code="crawlJob.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.name.label" default="Name"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "name")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.priority.label" default="Priority"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "priority")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.directoryName.label" default="Directory Name"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "directoryName")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.comments.label" default="Comments"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "comments")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.dateCreated.label" default="Date Created"/></td>

        <td valign="top" class="value"><g:formatDate date="${crawlJobInstance?.dateCreated}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.dateFinished.label" default="Date Finished"/></td>

        <td valign="top" class="value"><g:formatDate date="${crawlJobInstance?.dateFinished}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.dateStarted.label" default="Date Started"/></td>

        <td valign="top" class="value"><g:formatDate date="${crawlJobInstance?.dateStarted}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.description.label" default="Description"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "description")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.heritrix.label" default="Heritrix"/></td>

        <td valign="top" class="value"><g:link controller="heritrix" action="show"
                                               id="${crawlJobInstance?.heritrix?.id}">${crawlJobInstance?.heritrix?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.lastUpdated.label" default="Last Updated"/></td>

        <td valign="top" class="value"><g:formatDate date="${crawlJobInstance?.lastUpdated}"/></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.launchCount.label" default="Launch Count"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "launchCount")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.operator.label" default="Operator"/></td>

        <td valign="top" class="value"><g:link controller="user" action="show"
                                               id="${crawlJobInstance?.operator?.id}">${crawlJobInstance?.operator?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.orderXml.label" default="Order Xml"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "orderXml")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.report.label" default="Report"/></td>

        <td valign="top" class="value"><g:link controller="crawlJobReport" action="show"
                                               id="${crawlJobInstance?.report?.id}">${crawlJobInstance?.report?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.seedlist.label" default="Seedlist"/></td>

        <td valign="top" class="value"><g:link controller="seedlist" action="show"
                                               id="${crawlJobInstance?.seedlist?.id}">${crawlJobInstance?.seedlist?.encodeAsHTML()}</g:link></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.status.label" default="Status"/></td>

        <td valign="top" class="value">${crawlJobInstance?.status?.encodeAsHTML()}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlJob.totalBudget.label" default="Total Budget"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlJobInstance, field: "totalBudget")}</td>

      </tr>

      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${crawlJobInstance?.id}"/>
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
