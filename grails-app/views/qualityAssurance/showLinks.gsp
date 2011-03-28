<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Simple GSP page</title>
</head>
<body>
<p>
    Vyextrahované odkazy (${links.size()}):
</p>
<table>
    <g:each var="link" in="${links}">
        <tr>
            <td>${link}</td>
        </tr>
    </g:each>
</table>
<p><button onclick="history.go(-1)">Zpět</button></p>
</body>
</html>