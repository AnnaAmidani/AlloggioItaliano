<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="../View/snippets/locale_resolver.jsp" %>
<% String context = request.getContextPath(); %>
<%
String abbonato = "false";
if(session.getAttribute("abbonato") != null && session.getAttribute("abbonato").equals("true"))
{
  abbonato = "true";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
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

	        <p style="font-weight: bold">
	        <br /> <br />
	        <a href="<%= context + response.encodeURL("/View/logged.jsp")%>">scheda delle funzioni utente</a>
	        <br /> <br />
	        <a href="<%= context + response.encodeURL("/View/Registrazione1.jsp")%>">scheda di registrazione delle caratteristiche</a>
	        <br /> <br />
	        <%
	        if(abbonato.equals("true"))
	        {
	        %>
	          <a href="<%= context + response.encodeURL("/View/Registrazione2.jsp")%>">scheda di registrazione dei servizi</a>
	          <br /> <br />
	          <a href="<%= context + response.encodeURL("/View/Registrazione4.jsp")%>">scheda di registrazione della disponibilit&agrave;</a>
	          <br /> <br />
	        <%
	        }
	        %>
	        <a href="<%= context + response.encodeURL("/View/Registrazione3.jsp")%>">scheda di registrazione della descrizione</a>
	        </p>

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