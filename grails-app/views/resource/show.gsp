<%@ page import="cz.webarchiv.wadmin.Resource" %>
<!doctype html>
<html>
<head>
  <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
  <ul>
    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
  </ul>
</div>

<div id="show-resource" class="content scaffold-show" role="main">
  <h1><g:message code="default.show.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <ol class="property-list resource">

    <g:if test="${resourceInstance?.url}">
      <li class="fieldcontain">
        <span id="url-label" class="property-label"><g:message code="resource.url.label" default="Url"/></span>

        <span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${resourceInstance}"
                                                                               field="url"/></span>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.comments}">
      <li class="fieldcontain">
        <span id="comments-label" class="property-label"><g:message code="resource.comments.label"
                                                                    default="Comments"/></span>

        <span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${resourceInstance}"
                                                                                    field="comments"/></span>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.creator}">
      <li class="fieldcontain">
        <span id="creator-label" class="property-label"><g:message code="resource.creator.label"
                                                                   default="Creator"/></span>

        <span class="property-value" aria-labelledby="creator-label"><g:link controller="curator" action="show"
                                                                             id="${resourceInstance?.creator?.id}">${resourceInstance?.creator?.encodeAsHTML()}</g:link></span>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.date}">
      <li class="fieldcontain">
        <span id="date-label" class="property-label"><g:message code="resource.date.label" default="Date"/></span>

        <span class="property-value" aria-labelledby="date-label"><g:formatDate
                date="${resourceInstance?.date}"/></span>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.important}">
      <li class="fieldcontain">
        <span id="important-label" class="property-label"><g:message code="resource.important.label"
                                                                     default="Important"/></span>

        <span class="property-value" aria-labelledby="important-label"><g:formatBoolean
                boolean="${resourceInstance?.important}"/></span>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.publisher}">
      <li class="fieldcontain">
        <span id="publisher-label" class="property-label"><g:message code="resource.publisher.label"
                                                                     default="Publisher"/></span>

        <span class="property-value" aria-labelledby="publisher-label"><g:link controller="publisher" action="show"
                                                                               id="${resourceInstance?.publisher?.id}">${resourceInstance?.publisher?.encodeAsHTML()}</g:link></span>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.seeds}">
      <li class="fieldcontain">
        <span id="seeds-label" class="property-label"><g:message code="resource.seeds.label" default="Seeds"/></span>

        <g:each in="${resourceInstance.seeds}" var="s">
          <span class="property-value" aria-labelledby="seeds-label"><g:link controller="seed" action="show"
                                                                             id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
        </g:each>

      </li>
    </g:if>

    <g:if test="${resourceInstance?.title}">
      <li class="fieldcontain">
        <span id="title-label" class="property-label"><g:message code="resource.title.label" default="Title"/></span>

        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${resourceInstance}"
                                                                                 field="title"/></span>

      </li>
    </g:if>

  </ol>
  <g:form>
    <fieldset class="buttons">
      <g:hiddenField name="id" value="${resourceInstance?.id}"/>
      <g:link class="edit" action="edit" id="${resourceInstance?.id}"><g:message code="default.button.edit.label"
                                                                                 default="Edit"/></g:link>
      <g:actionSubmit class="delete" action="delete"
                      value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                      onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </fieldset>
  </g:form>
</div>
</body>
</html>
