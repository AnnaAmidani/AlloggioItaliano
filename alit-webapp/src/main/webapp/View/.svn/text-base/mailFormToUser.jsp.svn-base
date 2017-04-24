<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  anna.alit.beanbb.ParamsMap,
  anna.alit.beanbb.ParamsMapImpl"
%>
<% String context = request.getContextPath(); %>

<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  session.setAttribute( "time", request.getParameter("time") );
  session.setAttribute( "id", request.getParameter("connection") );
  session.setAttribute( "gotoPage", "View/mailFormToUser.jsp" );
  response.sendRedirect(request.getContextPath()+response.encodeURL("doLog.jsp"));
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.mailFromToUser" />
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
               <fmt:message key="ttl.mailFromToUser"/>
			   </a>
			 </h2>
			</div>
	        <%
	        String time = request.getParameter("time");
	        String id = request.getParameter("connection");
	        if(time == null || id == null)
	        {
	          time = (String)request.getAttribute("time");
	          id = (String)request.getAttribute("id");
	        }

	        ParamsMap params = new ParamsMapImpl();
	        params.put("time", time);
	        params.put("id", id);
	        params.put("page", "View/home.jsp");
	        params.put("subject", "RE: richiesta utente");
	        params.put("header", "Alloggio Italiano ");
	        params.put("page", "View/home.jsp");

	        session.setAttribute("params", params);

	        %>
	        <form class="reg1" name="inseventi" accept-charset="" action="${pageContext.request.contextPath}/MailServices" method="post">
	          <p>
	            <fmt:message key="msg.Utilizzare_il_seguente_box_di_testo"/>
	          </p>
	          <p>
	            <textarea name="body" id="body" class="descr" cols="60" rows="20"></textarea>
	            <%--
	            <br/><br/>
	            <b>
	            <fmt:message key="prm.il_mio_indirizzo_di_posta_elettronica_e_"/></b>
	            <input name="userMail" id="userMail" type="text" size="30"  class="smusso"/>
	            --%>
	            <br/><br/>
	            <img src="${pageContext.request.contextPath}/kaptcha.jpg" /><br/><br/>
	            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>
	            &nbsp;
	            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
	            <br/><br/>
	            <button type="submit">
	              <span class="round"><span><fmt:message key="btn.invia_la_mail"/></span></span>
	            </button>
	          </p>
	        </form>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.mailFromToUser" />
       <jsp:param name="header_text" value="hdr.mailFormToUser" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>
