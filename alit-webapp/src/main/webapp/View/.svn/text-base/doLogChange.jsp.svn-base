<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
  <head>
  <script language="javascript" type="text/javascript">
    function validForm(change)
    {
      if (change.password.value == "")
      {
        alert("Immettere una password");
        change.password.focus();
        return false;
      }
      if (change.password.value != change.password2.value)
      {
        alert("La password immessa non corrisponde");
        change.password.focus();
        change.password.select();
        return false;
      }
      return true;
    }
  </script>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.doLogChange" />
  </jsp:include>
</head>

<body>
<div id="wrapper">
<div id="wrapper_inner">
  <jsp:include page="snippets/new_header.jsp" />
  <div id="main">
	<div class="left" id="content">
		<div id="content_inner">
		  <div class="post">

			<div class="post_title">
			 <h2>
			   <a href="#">
               <fmt:message key="ttl.doLogChange"/>
			   </a>
			 </h2>
			</div>
	        <form name="change" onsubmit="return validForm(document.change)" action="${pageContext.request.contextPath}/Action">
	          <input type="hidden" name="actiontype" value="changeUserAndPwd" />

	          <div>
	            <font color="red">Inserire la nuova password e ridigitarla per conferma.</font>
	            <br/>
	              Ad operazione effettuata verrete riportati alla pagina di login: riaccedete subito utilizzando la nuova password!
	            <br/>
	            <br/>
	            <br/>

	            <table>
	              <tr>
	                <td> <b>Username:&nbsp;&nbsp;<%= (request.getAttribute("username")!= null) ? request.getAttribute("username") : "" %></b> </td>
	                <td> <input name="oldusername" class="smusso" size="20" type="text" /> </td>
	              </tr>
	              <tr>
	                <td colspan="2"></td>
	              </tr>
	              <tr>
	                <td> <b>Nuova Password:&nbsp;&nbsp;&nbsp;</b> </td>
	                <td> <input name="password" class="smusso" size="20" type="password" /> </td>
	              </tr>
	              <tr>
	                <td> <b>Ridigita Password:&nbsp;&nbsp;</b> </td>
	                <td> <input name="password2" class="smusso" size="20" type="password" /> </td>
	              </tr>
	              <tr>
	                <td colspan="2"></td>
	              </tr>
	            </table>

	            <br/><br/>

	            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
	            <br/><br/>
	            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
	            <input type="text" class="smusso" size="12" name="kaptcha" value="" />

	            <br/><br/>
	            <button id="cambia" type="submit" value="Enter">
	              <span class="round_270"><span>Inviate i dati</span></span>
	            </button>
	         </div>
	        </form>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.doLogChange" />
       <jsp:param name="header_text" value="hdr.login_change" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>


