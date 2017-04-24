<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="anna.alit.beanbb.ParamsMap, anna.alit.beanbb.ParamsMapImpl"%>
<%
  String context = request.getContextPath();
  ParamsMap params = new ParamsMapImpl();
  params.put("header", "Alloggio Italiano");
  params.put("page", "View/retrievePwdForm.jsp");
  params.put("subject", "recupero password - conferma");
  params.put("body", "Servizio di notifica");
  session.setAttribute("params", params);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.retrievePwdForm" />
  </jsp:include>
</head>
<body>

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
               <fmt:message key="ttl.retrievePwdForm"/>
			   </a>
			 </h2>
			</div>
	        <form class="mail" name="inseventi" accept-charset=""
	          action="${pageContext.request.contextPath}/RecuperoPassword" method="post">
	          <p class="mail">
	            Indicate il vostro indirizzo di email: se risulterete nei nostri elenchi vi verrà spedita una email con il link di conferma. In seguito alla conferma vi sarà possibile creare una nuova password.<br/>
	            <br/><br/><fmt:message key="prm.il_mio_indirizzo_di_posta_elettronica_e_"/><br/>
	            <input name="userMail" id="userMail" type="text" size="30"  class="smusso"/>
	            <span style="font-weight:bold">
	        <% if((Boolean)session.getAttribute("errorMsg") != null && (Boolean)session.getAttribute("errorMsg") == true)
	           {
	             session.removeAttribute("errorMsg");
	           %>
	            <br/><br/>
	           Spiacenti, impossibile recuperare informazioni associate all'indirizzo inserito.<br/>Vi invitiamo a verificare che sia corretto e riprovare.<br/>In caso l'errore persista, <a href="mailto:postmaster@alloggioitaliano.it">scriveteci</a>: provvederemo quanto prima a contattarvi per recuperare i vostri dati manualmente se presenti.
			 <%
			 }
			 %>
			 </span>
	            <br/><br/>
	            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
	            <br/><br/>
	            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
	            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
	          </p>
	          <p class="mail_btn">
	            <button type="submit">
	              <span class="round"><span><fmt:message key="btn.invio"/></span></span>
	            </button>
	          </p>
	        </form>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.retrievePwdForm" />
       <jsp:param name="header_text" value="hdr.retrievePwdForm" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>




