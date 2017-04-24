
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- $Revision: 284 $ -->
<!-- :encoding=UTF-8: -->
<html>
<head>
 <title>Errore</title>
 <style>
 </style>
 <script type="text/javascript">
 </script>
</head>
<body class="organic">
<div>
 Si e' verificato un errore:<br/>
 <#if errorList??><#list errorList as msg><br/>${msg}</#list></#if>
</div>
</body>
</html>

