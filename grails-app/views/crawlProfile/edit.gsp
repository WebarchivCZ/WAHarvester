<%@ page import="cz.webarchiv.wah.CrawlProfile" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'crawlProfile.label', default: 'CrawlProfile')}"/>
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
  <g:hasErrors bean="${crawlProfileInstance}">
    <div class="errors">
      <g:renderErrors bean="${crawlProfileInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${crawlProfileInstance?.id}"/>
    <g:hiddenField name="version" value="${crawlProfileInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="crawlProfile.name.label" default="Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlProfileInstance, field: 'name', 'errors')}">
            <g:textField name="name" value="${crawlProfileInstance?.name}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="comments"><g:message code="crawlProfile.comments.label" default="Comments"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlProfileInstance, field: 'comments', 'errors')}">
            <g:textField name="comments" value="${crawlProfileInstance?.comments}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="crawlJobs"><g:message code="crawlProfile.crawlJobs.label" default="Crawl Jobs"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlProfileInstance, field: 'crawlJobs', 'errors')}">
            <g:select name="crawlJobs" from="${cz.webarchiv.wah.CrawlJob.list()}" multiple="yes" optionKey="id" size="5"
                      value="${crawlProfileInstance?.crawlJobs*.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="domainSheets"><g:message code="crawlProfile.domainSheets.label"
                                                 default="Domain Sheets"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlProfileInstance, field: 'domainSheets', 'errors')}">
            <g:select name="domainSheets" from="${cz.webarchiv.wah.DomainSheet.list()}" multiple="yes" optionKey="id"
                      size="5" value="${crawlProfileInstance?.domainSheets*.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="orderXml"><g:message code="crawlProfile.orderXml.label" default="Order Xml"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: crawlProfileInstance, field: 'orderXml', 'errors')}">
            <g:textField name="orderXml" value="${crawlProfileInstance?.orderXml}"/>
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
