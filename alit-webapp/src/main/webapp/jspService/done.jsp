<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="../View/snippets/locale_resolver.jsp" %>
<%@ page import="
  java.util.*,
  anna.alit.beanbb.HashBean,
  anna.alit.beanbb.ParamsMap,
  anna.alit.utilities.UtilService,
  anna.alit.beanbb.ParamsMapImpl"
%>
<%
  ParamsMap params = new ParamsMapImpl();
  String mail =  (String)request.getAttribute("mail");
  String den = (String)request.getAttribute("denominazione");
  den = UtilService.alitRequestFormatter(den);
  params.put("denominazione", den);
  params.put("to", mail);
  params.put("header", "Benvenuti nel portale Alloggio Italiano");
  params.put("page", "View/doLog.jsp");
  params.put("subject", "Registrazione di " + den +" effettuata con successo");
  session.setAttribute("params", params);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <script language="javascript" type="text/javascript">
    function validPrivacy(confirm)
    {
      if (!confirm.privacy[0].checked)
      {
        alert("Per registrarsi è necessario acconsentire al trattamento dei dati personali");
        return false;
      }
      return true;
    }
  </script>
  <jsp:include page="../View/snippets/head.jsp">
      <jsp:param name="title" value="ttl.done" />
  </jsp:include>

</head>

<body>

<div id="wrapper">
<div id="wrapper_inner">
  <jsp:include page="../View/snippets/new_header.jsp"/>
  <div id="main">
	<div class="left" id="content">
		<div id="content_inner">
		  <div class="post">

			<div class="post_title">
			 <h2>
			   <a href="#">
               <fmt:message key="ttl.done"/>
			   </a>
			 </h2>
			</div>

        <p>scheda 1: registrazione effettuata</p>
        <br />
        <p>
          <b>username</b> e <b>password</b> saranno spedite all'indirizzo <font color="blue"> <%= mail%> </font>
          Per concludere l'operazione premete il bottone sottostante. Alla prossima visita sar&agrave; possibile completare la descrizione
          della vostra struttura arrichendola di ulteriori dettagli!
        </p>
        <br /><br /><!-- iso-8859-1 -->
        <form name="confirm" onsubmit="return validPrivacy(document.confirm)" accept-charset="" action="${pageContext.request.contextPath}/MailServices" method="post">
   <%--         <div style="overflow:auto; height:400px"> --%>
            <div style="font-size:9pt">
                <%@ include file="../View/text/privacy.html" %>
            </div>
          <p>
           <br/><br/>
            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
            <br/><br/>
            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
            <br/><br/>
            <input type="hidden" id="body" name="body"
              value="
Forniamo di seguito le credenziali di accesso ad Alloggio Italiano, che potrete modificare dalla pagina di login.<br/><br/>
<% String username = (String)request.getAttribute("username"); username = UtilService.alitRequestFormatter(username); %>
USERNAME: <%= username %><br/>
PASSWORD: <%= request.getAttribute("password") %><br/><br/>

Cordialmente,<br/>
Servizio Registrazione Alloggio Italiano<br/><br/>


e-mail autogenerata, non rispondere al mittente"
            />
          <button type="submit">
            <span class="round_270"> <span>concludete la registrazione</span></span>
          </button>
        </p>
        </form>

		  </div>
		</div>
	 </div>
     <jsp:include page="../View/snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.done" />
       <jsp:param name="header_text" value="hdr.done" />
     </jsp:include>
     <jsp:include page="../View/snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>
