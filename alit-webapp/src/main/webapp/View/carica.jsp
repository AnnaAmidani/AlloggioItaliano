<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<% String context = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.carica" />
  </jsp:include>
</head>

<body onload="document.getElementById('loading').style.visibility = 'hidden'">
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
               <fmt:message key="ttl.carica"/>
			   </a>
			 </h2>
			</div>
	        <div id="forImm"></div>
	        <form enctype="multipart/form-data" action="${pageContext.request.contextPath}/ImageServlet" method="post">
	          <p align="center">
	            <font size="2pt">
	              <br/><br/>
	              <b><fmt:message key="msg.scrivi_il_percorso_o_cerca_nel_filesystem_"/></b>
	              <br/><br/>
	              <input type="file" name="image" />
	            </font>
	            <br/><br/>
	            <%
	            String imageNumber = request.getParameter("imagename");
	            session.setAttribute("imageNumber", imageNumber);
	            %>
	            <input type="hidden" name="personalImage" value="" />
	            <br/><br/>
	            <button type="submit" onclick="document.getElementById('loading').style.visibility='visible'">
	              <span class="round_170"><span><fmt:message key="btn.invia"/></span></span>
	            </button>
	            <button type="reset">
	              <span class="round_170"><span><fmt:message key="btn.reset"/></span></span>
	            </button>
	          </p>
	        </form>
	          <div align="center">
	            <div id="loading">
	              <img src="${pageContext.request.contextPath}/View/img/loading3.gif" width="100px" height="100px"/>
	            </div>
	          </div>

		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.carica" />
       <jsp:param name="header_text" value="hdr.carica" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>





