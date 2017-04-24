<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- $Revision: 284 $  :encoding=UTF-8:-->
<html>
<head>
 <title>Login</title>
 <style>
  input, select { background-color:#dedede; color:#000; border:1px solid #737373; padding:0px; font-size:13px; }
 </style>
</head>
<body>
<div class="loginBody">
 <@s.form name="login" method="POST" action="j_spring_security_check">
  <@s.textfield label="Nome utente" labelposition="top" name="j_username" value="user" cssStyle="width:200px;"/>
  <@s.password label="Password" labelposition="top" name="j_password" value="user" cssStyle="width:200px; margin-bottom:2em;"/>
  <@s.submit value="Entra" cssClass="bt"/>
 </@s.form>
</div>
</body>
</html>

