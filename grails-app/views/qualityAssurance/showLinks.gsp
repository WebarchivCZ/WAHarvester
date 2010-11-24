<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Simple GSP page</title>
</head>
<body>
xxx
<g:each var="link" in="${links}">
    <p>${link}</p>
</g:each>
</body>
</html>