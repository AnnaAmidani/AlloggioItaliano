<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
  <head>
    <jsp:include page="snippets/head.jsp" >
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
			  <%
			  String context = request.getContextPath();
			  String destinationPage = "/View/home.jsp";
			  String imagename = request.getParameter("imagename");
			  String msg = request.getParameter("msg");
			  %>
			  <br/><br/>
			  <p> <fmt:message key="<%= msg %>"/> </p>
			  <p>
			    <br/><br/>
			    <%
			    if(imagename != null)
			    {
			     if (imagename.equals("11") || imagename.equals("12"))
			       destinationPage = "/View/pubblicita.jsp";
			     else
			       destinationPage = "/View/Registrazione3.jsp";
			    }
			    %>
			    <button type="button" onclick="location.href='<%= context + response.encodeURL(destinationPage)%>'">
			      <span class="round"><span>ok</span></span>
			    </button>
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

