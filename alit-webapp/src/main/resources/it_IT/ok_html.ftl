<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>

<body>
<p>
${data!""}
<br/>
<br/>
${header!"NO HEADER"}
</p>
<p>
<b>email utente</b>: ${fromAnother}
</p>
<p>
${body!""}
</p>

<p>
La richiesta per spot è così composta:<br/><br/>

 <b>regione/i</b>:  <#list regioni as region>${region}, </#list><br/>
 <b>tipologia/e</b>: <#list tipologie as tipologia>${tipologia}, </#list><br/>
 <b>periodo</b>: <#list periodi as periodo>${periodo}, </#list><br/>
 <b>posizione</b>: <#list posizioni as posizione>${posizione}, </#list><br/>
</p>