<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="anna.alit.beanbb.ParamsMap, anna.alit.beanbb.ParamsMapImpl"%>
<%
  String context = request.getContextPath();
  ParamsMap params = new ParamsMapImpl();
  params.put("header", "cancellazione utente");
  params.put("page", "View/cancellazioneForm.jsp");
  params.put("subject", "cancellazione utente");
  params.put("body", "");
  session.setAttribute("params", params);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.deleteUserForm" />
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
               <fmt:message key="ttl.deleteUserForm"/>
			   </a>
			 </h2>
			</div>
	        <form class="mail" name="inseventi" accept-charset=""
	          action="${pageContext.request.contextPath}/CancellazioneUtente" method="post">
	          <p class="mail">
	            Desidero che ogni riferimento alla mia struttura ricettiva sia rimosso dai vostri elenchi e che venga altres&igrave; cancellato l'account provvisorio attivo per la struttura.<br/>
	            <br/>Motivazione:<br/>
                <input name="reasonWhy" type="radio" class="styled" value="La struttura ricettiva non esiste"/> La struttura ricettiva non esiste<br/>
                <input name="reasonWhy" type="radio" class="styled" value="La struttura ricettiva non rientra nella categoria extra-alberghiera"/> La struttura ricettiva non rientra nella categoria extra-alberghiera<br/>
                <input name="reasonWhy" type="radio" class="styled" value="La struttura ricettiva &egrave; sprovvista di camere"/> La struttura ricettiva &egrave;  sprovvista di camere<br/>
                <input name="reasonWhy" type="radio" class="styled" value="La struttura ricettiva ospita soltanto per un minimo di una settimana"/> La struttura ricettiva ospita soltanto per un minimo di una settimana<br/>
                <input name="reasonWhy" type="radio" class="styled" value="La struttura ricettiva ha cessato l'attività"/> La struttura ricettiva ha cessato l'attivit&agrave;<br/>
                <input name="reasonWhy" type="radio" class="styled" value="Non desiderate comparire nei nostri elenchi"/> Non desiderate comparire nei nostri elenchi<br/>
	              <input name="reasonWhy" type="radio" class="styled" value="altro"/> Altro<br/><br/>
	            <fmt:message key="prm.il_mio_indirizzo_di_posta_elettronica_e_"/><br/>
	            <input name="userMail" id="userMail" type="text" size="30"  class="smusso"/>
	            <span style="font-weight:bold;">
	        <% if((Boolean)session.getAttribute("errorMsg") != null && (Boolean)session.getAttribute("errorMsg") == true)
	           {
	             session.removeAttribute("errorMsg");
	           %>
	           <br/><br/>
	           Spiacenti, impossibile recuperare informazioni associate all'indirizzo inserito. <br/>Vi invitiamo a verificare che sia corretto e riprovare. <br/>In caso l'errore persista, <a href="mailto:postmaster@alloggioitaliano.it">scriveteci</a>: provvederemo quanto prima a rimuovere i vostri dati manualmente se presenti.
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
       <jsp:param name="title" value="ttl.deleteUserForm" />
       <jsp:param name="header_text" value="hdr.deleteUserForm" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>




