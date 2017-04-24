<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
  <%
  String context = request.getContextPath();

  String msg = request.getParameter("msg");
  if(msg == null)
    msg = (String) request.getAttribute("msg");
  if(msg == null)
    msg = "msg.Si_e_verificato_un_errore_inatteso_";

  String nextPage = request.getParameter("nextPage");
  if( nextPage == null )
    nextPage = (String) request.getAttribute("nextPage");
  if( nextPage == null )
    nextPage = "/View/home.jsp";
  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
  <head>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.errorPage" />
  </jsp:include>
    <title><fmt:message key="ttl.errorPage"/></title>
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
               <fmt:message key="ttl.errorPage"/>
			   </a>
			 </h2>
			</div>
			  <p class="donestyle">
			    <fmt:message key="<%= msg %>"/>
			  </p>
			  <p>
			    <br/><br/>
			    <button type="button" onclick="location.href='<%= context + response.encodeURL( nextPage ) %>'">
			      <span class="round"><span><fmt:message key="btn.ok"/></span></span>
			    </button>
			  </p>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.errorPage" />
       <jsp:param name="header_text" value="hdr.errorpage" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>