<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="anna.alit.beanbb.ParamsMap, anna.alit.beanbb.ParamsMapImpl"%>
<%
  String context = request.getContextPath();
  ParamsMap params = new ParamsMapImpl();
  params.put("header", "Un utente ha effettuato una richiesta");
  params.put("page", "View/cercaAlloggio.jsp");
  params.put("subject", "richiesta utente");
  session.setAttribute("params", params);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.mailForm" />
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
               <fmt:message key="ttl.mailForm"/>
			   </a>
			 </h2>
			</div>
	        <form class="mail" name="inseventi" accept-charset=""
	          action="${pageContext.request.contextPath}/MailServices" method="post">
	          <p class="mail">
	            <textarea name="body" id="body" class="descr"></textarea>
	            <br/>
	            <fmt:message key="prm.il_mio_indirizzo_di_posta_elettronica_e_"/><br/>
	            <input name="fromAnother" id="fromAnother" type="text" size="30"  class="smusso"/>
	            <br/><br/>
	            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
                 <button type="button" onclick="window.location.reload();">
                   <%-- <span class="round"><span>--%>refresh<%--</span></span> --%>
                 </button>
                 <br/><br/>
	            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
	            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
	          </p>
	          <p class="mail_btn">
	            <button type="submit">
	              <span class="round"><span><fmt:message key="btn.invia_la_mail"/></span></span>
	            </button>
	          </p>
	        </form>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.mailForm" />
       <jsp:param name="header_text" value="hdr.mailForm" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>




