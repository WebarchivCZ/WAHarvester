<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<h1>Dashboard</h1>
<div class="col50">
    <h2 class="tit">Upozornění</h2>
    <p class="msg warning">Je čas spustit výběrovou sklizeň (leden 2011)</p>

    <p class="msg done">Sklizeň - Selective-2010-12-00 - je dokončena</p>

    <p class="msg error">Heritrix - testovaci - neodpovídá</p>
</div>
<div class="col50 f-right">
    <h2 class="tit">Rozpis pravidelných sklizní</h2>
    <dl>
        <dt>leden 2011</dt>
        <dd>výběrová sklizeň</dd>
        <dt>únor 2011</dt>
        <dd>výběrová sklizeň</dd>
        <dt>březen 2011</dt>
        <dd>výběrová sklizeň bez smlouvy</dd>
    </dl>
</div>
<div class="fix"></div>
<h2>Sklizně</h2>
<div class="tabs box">
    <ul>
        <li><a href="#tab01"><span>Probíhající</span></a></li>
        <li><a href="#tab02"><span>Dokončené</span></a></li>
        <li><a href="#tab03"><span>Připravené</span></a></li>
    </ul>
    <div id="tab01">
        <p>Lorem ipsum dolor sit amet, consectetumr adipiscing elit.</p>
    </div>
    <div id="tab02">
        <table style="margin: 1em;">
            <tr><th>Název</th><th>Typ</th><th>Status</th><th>Ukončeno</th><th># dokumentů</th><th>velikost</th><th>Operátor</th><th>Komentář</th></tr>
            <tr><td>Selective-2010-12-00</td><td>Výběrová sklizeň</td><td>Ukončeno</td><td>25.12.2010</td><td>35 452 154</td><td>398 GB</td><td>Adam</td><td>Úmyslně vypnutý DeDuplicator</td></tr>
        </table>
    </div>
    <div id="tab03">
        <p>Lorem ipsum dolor sit amet, consecteotur adipiscing elit.</p>
    </div>
</div>
</body>
</html>