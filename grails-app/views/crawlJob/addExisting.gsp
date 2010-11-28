<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Přidat existující adresář</title></head>
<body>
<g:form action="addExisting">
    <label for="jobPath">Zadejte cestu</label>
    <g:textField name="jobPath"/>
    <g:submitButton name="loadExistingJob" value="Načíst"/>
</g:form>
</body>
</html>