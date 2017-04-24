<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="anna.alit.beanbb.ParamsMap, anna.alit.beanbb.ParamsMapImpl"%>
<%
  String context = request.getContextPath();
  ParamsMap params = new ParamsMapImpl();
  params.put("header", "Un utente ha effettuato una richiesta di cancellazione struttura.");
  params.put("page", "View/logged.jsp");
  params.put("subject", "richiesta di cancellazione");
  session.setAttribute("params", params);

%>

<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  response.sendRedirect(request.getContextPath() + response.encodeURL("doLog.jsp"));
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <script language="javascript">
    function checkpwd()
    {
      if (document.getElementById('password').value == "")
      {
        alert('Devi immettere una password');
      }
      if (document.getElementById('password').value != document.getElementById('password2').value)
      {
        alert('La password immessa non corrisponde');
      }
      else
      {
        document.getElementById('second').style.visibility='visible';
      }
    }
  </script>
  <script language="javascript">
    function hide()
    {
      document.getElementById('second').style.visibility='hidden';
      document.getElementById('third').style.visibility='hidden';
    }
  </script>
<jsp:include page="snippets/head.jsp">
      <jsp:param name="title" value="ttl.cancellazione" />
  </jsp:include>
</head>

<body onload="hide();">
<div id="wrapper">
<div id="wrapper_inner">
  <jsp:include page="snippets/new_header.jsp"/>
  <div id="main">
	<div class="left" id="content">
		<div id="content_inner">
		  <div class="post">
			<div class="post_title">
			 <h2>
			   <a href="#">
               <fmt:message key="ttl.cancellazione"/>
			   </a>
			 </h2>
            </div>
              <div>
		        <form class="reg1" name="del" accept-charset="" action="${pageContext.request.contextPath}/MailServices" method="post">
		          <b>Se desiderate che la vostra struttura non compaia nei nostri elenchi, seguite le istruzioni seguenti:</b>
		          <br/>
		          <i>Username:</i><br />
		          <input name="username" id="username" class="smusso" size="20" type="text" />
		          <br />
		          <i>Password:</i><br />
		          <input name="password" id="password" class="smusso" size="20" type="password" />
		          <br />
		          <i>Conferma Password:</i><br />
		          <input name="password2" id="password2" class="smusso" size="20" type="password" />
		          <br /><br />
		          <button type="button" onclick="checkpwd()">
		            <span class="round"><span>Ok</span></span>
		          </button>
                  <br/><br/>
		          <div id="second" style="visibility:hidden">
		            <b>Intendete cancellare definitivamente la vostra struttura dagli elenchi di Alloggio Italiano?</b> <br/>
		            <button type="button" onclick="alert('per richieste diverse dalla cancellazione definitiva, chiudere questa pagina e usare contattaci')">
		              <span class="round"><span>no</span></span>
		            </button>
		            <button type="button" onclick="document.getElementById('third').style.visibility='visible'">
		              <span class="round"><span>si</span></span>
		            </button>
		          </div>
		          <br/><br/>
		          <div id="third" style="visibility:hidden">
		          <textarea name="body" id="body" class="descr" cols="40" rows="5"
		            onclick="document.getElementById('body').value =''">potete comunicare le vostre motivazioni</textarea>
		          <br/>
		          <br/>
		          <b>Con questa procedura autorizzate Alloggio Italiano a eliminare definitivamente qualsiasi dato relativo alla vostra struttura.</b>
		          <br/>La cancellazione verr&agrave; automaticamente eseguita con effetto immediato.<br/><br/>
		            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
		            <br/>
		            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
		            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
		          <br/>
		          <button type="button" onclick="alert('per richieste diverse dalla cancellazione definitiva, chiudere questa pagina e usare contattaci')">
		            <span class="round"><span>annulla</span></span>
		          </button>
		          <button type="submit">
		            <span class="round"><span>conferma</span></span>
		          </button>
		          </div>
		        </form>
		       </div>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.cancellazione" />
       <jsp:param name="header_text" value="hdr.cancellazione" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>





