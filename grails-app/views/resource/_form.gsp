<%@ page import="cz.webarchiv.wadmin.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'url', 'error')} ">
  <label for="url">
    <g:message code="resource.url.label" default="Url"/>

  </label>
  <g:field type="url" name="url" value="${resourceInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'comments', 'error')} ">
  <label for="comments">
    <g:message code="resource.comments.label" default="Comments"/>

  </label>
  <g:textField name="comments" value="${resourceInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'creator', 'error')} required">
  <label for="creator">
    <g:message code="resource.creator.label" default="Creator"/>
    <span class="required-indicator">*</span>
  </label>
  <g:select id="creator" name="creator.id" from="${cz.webarchiv.wadmin.Curator.list()}" optionKey="id" required=""
            value="${resourceInstance?.creator?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'date', 'error')} required">
  <label for="date">
    <g:message code="resource.date.label" default="Date"/>
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="date" precision="day" value="${resourceInstance?.date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'important', 'error')} ">
  <label for="important">
    <g:message code="resource.important.label" default="Important"/>

  </label>
  <g:checkBox name="important" value="${resourceInstance?.important}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'publisher', 'error')} required">
  <label for="publisher">
    <g:message code="resource.publisher.label" default="Publisher"/>
    <span class="required-indicator">*</span>
  </label>
  <g:select id="publisher" name="publisher.id" from="${cz.webarchiv.wadmin.Publisher.list()}" optionKey="id" required=""
            value="${resourceInstance?.publisher?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'seeds', 'error')} ">
  <label for="seeds">
    <g:message code="resource.seeds.label" default="Seeds"/>

  </label>

  <ul class="one-to-many">
    <g:each in="${resourceInstance?.seeds ?}" var="s">
      <li><g:link controller="seed" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
      <g:link controller="seed" action="create"
              params="['resource.id': resourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'seed.label', default: 'Seed')])}</g:link>
    </li>
  </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'title', 'error')} ">
  <label for="title">
    <g:message code="resource.title.label" default="Title"/>

  </label>
  <g:textField name="title" value="${resourceInstance?.title}"/>
</div>

