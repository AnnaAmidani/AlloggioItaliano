<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="../View/snippets/locale_resolver.jsp" %>
<% String context = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
  <jsp:include page="../View/snippets/head.jsp" >
      <jsp:param name="title" value="ttl.error" />
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
               <fmt:message key="ttl.error"/>
			   </a>
			 </h2>
			</div>
		      <p>Si &egrave; verificato un'errore inatteso. Ci scusiamo per l'inconveniente</p>
		      <p style="font-weight: bold">
		        <br />
		        <a href="<%= context + response.encodeURL("/View/home.jsp")%>">torna alla home</a> <br />
		      </p>
		  </div>
		</div>
	 </div>
     <jsp:include page="../View/snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.error" />
       <jsp:param name="header_text" value="hdr.error" />
     </jsp:include>
     <jsp:include page="../View/snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>
