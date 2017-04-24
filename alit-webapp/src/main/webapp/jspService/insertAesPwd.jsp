<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="../View/snippets/locale_resolver.jsp" %>
<%@ page import="
  java.util.*,
  anna.alit.utilities.InsertUsrAndPwd"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="../View/snippets/head.jsp" >
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

			<%
               //String execute = request.getParameter("execute");
               //InsertUsrAndPwd insertUsrAndPwd = new InsertUsrAndPwd();
               //insertUsrAndPwd.insert(execute);
            %>

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
