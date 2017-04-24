<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<% String context = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp">
      <jsp:param name="title" value="ttl.ok" />
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
               <fmt:message key="ttl.ok"/>
			   </a>
			 </h2>
			</div>
	        <p><fmt:message key="msg.operazione_effettuata_con_successo"/></p>
	        <p>
	          <br/><br/>
	          <b><a href="<%= context + response.encodeURL("/View/home.jsp")%>"><fmt:message key="lnk.vai_alla_home"/></a></b>
	          <br/><br/>
	          <b><a href="<%= context + response.encodeURL("/View/corsiPercorsi.jsp")%>"><fmt:message key="lnk.vai_a_corsi_e_percorsi"/></a></b>
	          <br/><br/>
	          <b><a href="<%= context + response.encodeURL("/View/eventiSpettacoli.jsp")%>"><fmt:message key="lnk.vai_a_eventi_e_spettacoli"/></a></b>
	          <br/><br/>
	          <b><a href="<%= context + response.encodeURL("/View/festeFiere.jsp")%>"><fmt:message key="lnk.vai_a_feste_e_fiere"/></a></b>
	          <br/><br/>
	          <b><a href="<%= context + response.encodeURL("/View/mostreMusei.jsp")%>"><fmt:message key="lnk.vai_a_mostre_e_musei"/></a></b>
	        </p>

		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.ok" />
       <jsp:param name="header_text" value="hdr.ok" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>




