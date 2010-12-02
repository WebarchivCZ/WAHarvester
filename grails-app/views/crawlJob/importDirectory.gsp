<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Přidat existující adresář</title></head>
<body>
<h1>Přidat existující adresář s dokončenými sklizněmi</h1>
<p>Adresar muze obsahovat nekolik podadresaru s joby (maximalne do urovne jedna)</p>
<g:form action="importDirectory">
    <label for="jobPath">Zadejte cestu</label>
    <g:textField name="jobPath"/>
    <g:submitButton name="loadExistingJob" value="Načíst"/>
</g:form>
</body>
</html>