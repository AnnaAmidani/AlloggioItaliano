<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<% String context = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.doLog" />
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
               <fmt:message key="ttl.doLog"/>
			   </a>
			 </h2>
			</div>
	          <form name="check" action="${pageContext.request.contextPath}/Action" method="post">
	            <input type="hidden" name="actiontype" value="checklogin" />
	            <input type="hidden" name="gotoPage" value="<%= session.getAttribute("gotoPage") %>" />
                <b>Username:</b> <br/> <input name="username" class="smusso" size="20" type="text" />
                <br/><br/>
                <b>Password:</b> <br/> <input name="password" class="smusso" size="20" type="password" />
                <br/><br/>
                <button id="Subn" type="submit" value="Enter">
                  <span class="round_170"><span>Invio</span></span>
                </button>
                <button id="Subdatipersi" type="button"  onclick="location.href='<%= context + response.encodeURL("/View/retrievePwdForm.jsp")%>';">
                  <span class="round_170"><span>Recupero Dati</span></span>
                </button>
                <button id="NewRegistration" type="button"  onclick="location.href='<%= context + response.encodeURL("/View/Registrazione1.jsp")%>';">
                  <span class="round_170"><span>Registrazione</span></span>
                </button>

				<%--
                <button type="button" onclick="location.href='<%= context + response.encodeURL("/View/doLogChange.jsp")%>';">
                  <span class="round_170"><span>Modifica password</span></span>
                </button>
                 --%>

	          </form>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.doLog" />
       <jsp:param name="header_text" value="hdr.login" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>



