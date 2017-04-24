<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <jsp:include page="snippets/head.jsp" >
    <jsp:param name="title" value="ttl.presentazione" />
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
               <fmt:message key="ttl.presentazione"/>
			   </a>
			 </h2>
			</div>
			    <p>
		          <%
		          if( locale.equals("it") )
		          {
		            %>  <%@ include file="text/presentazione_it.html" %> <%
		          }
		          else if( locale.equals("en"))
		          {
		            %>  <%@ include file="text/presentazione_en.html" %> <%
		          }
		          else if( locale.equals("de") )
		          {
		            %>  <%@ include file="text/presentazione_de.html" %> <%
		          }
		          else if( locale.equals("fr") )
		          {
		            %>  <%@ include file="text/presentazione_fr.html" %> <%
		          }
		          %>
		       </p>
		  </div>
		</div>
	 </div>
	 <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.presentazione" />
       <jsp:param name="header_text" value="hdr.presentazione" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>