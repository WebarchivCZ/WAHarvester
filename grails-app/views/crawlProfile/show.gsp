<%@ page import="cz.webarchiv.wah.CrawlProfile" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'crawlProfile.label', default: 'CrawlProfile')}"/>
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
        <td valign="top" class="name"><g:message code="crawlProfile.id.label" default="Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlProfileInstance, field: "id")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlProfile.name.label" default="Name"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlProfileInstance, field: "name")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlProfile.comments.label" default="Comments"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlProfileInstance, field: "comments")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlProfile.crawlJobs.label" default="Crawl Jobs"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${crawlProfileInstance.crawlJobs}" var="c">
              <li><g:link controller="crawlJob" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlProfile.domainSheets.label" default="Domain Sheets"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${crawlProfileInstance.domainSheets}" var="d">
              <li><g:link controller="domainSheet" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="crawlProfile.orderXml.label" default="Order Xml"/></td>

        <td valign="top" class="value">${fieldValue(bean: crawlProfileInstance, field: "orderXml")}</td>

      </tr>

      </tbody>
    </table>
  </div>

  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${crawlProfileInstance?.id}"/>
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
