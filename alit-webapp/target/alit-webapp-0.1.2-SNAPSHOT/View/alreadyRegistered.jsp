<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="../View/snippets/locale_resolver.jsp" %>
<%@ page import="  org.apache.commons.lang.StringUtils"%>

<%
String denominazione = (String)session.getAttribute("denominazione");
String mail = (String)session.getAttribute("mail");
if(StringUtils.isEmpty(denominazione))
{
  denominazione = request.getParameter("denominazione");
}
if(StringUtils.isEmpty(mail))
{
	mail = request.getParameter("mail");
}
session.setAttribute("username",(String)session.getAttribute("username"));
session.setAttribute("password",(String)session.getAttribute("password"));
session.setAttribute("mail",mail);
session.setAttribute("denominazione",denominazione);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.alreadyRegistered" />
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
               <fmt:message key="ttl.alreadyRegistered"/>
			   </a>
			 </h2>
			</div>

        <%
        String s = (String)session.getAttribute("success");
        if( StringUtils.isNotEmpty(s) && StringUtils.equals(s,"success") )
        {
        %>
	     <div id="alreadyRegistered" style="display:none">
	     <%
        }
        else
        {
	     %>
	     <div id="alreadyRegistered" style="display:block">
	     <%
	     }
	    %>
        <form name="toFirstContactMail" accept-charset="" action="${pageContext.request.contextPath}/RecuperoDati" method="post">
        <div>
	      Il vostro indirizzo e-mail risulta gi&agrave; utilizzato dalla struttura:<br/><br/>
          <b> <%=denominazione %></b><br/><br/>
          presente nei nostri elenchi.<br/><br/>
          <% if(StringUtils.isNotEmpty(request.getParameter("neverloggedon")))
          {
          %>
          Ci risulta tuttavia che la struttura indicata non abbia mai effettuato login sul sito Alloggio Italiano:
          non &egrave; possibile resettare la password finch&eacute; non sia stato effettuato almeno un accesso, e, in particolare, finch&eacute;
          non sia stato accettato il Regolamento di Alloggio Italiano.<br/>
          <%
          }
          %>
          <br/><br/>
          Se desiderate ricevere username e password per poter amministrare le pagine di servizi dedicate a <b><%=denominazione %></b>
          cliccate sul bottone "invia mail" dopo aver inserito il codice di controllo:<br/><br/>
            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
            <br/><br/>
            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
                     <br/><br/>
            <button type="submit">
              <span class="round"><span><fmt:message key="btn.invia_la_mail"/></span></span>
            </button>
          <br/><br/>
          <%
          String r = request.getParameter("noreg");
		  if(StringUtils.isEmpty(r))
		  {
          %>
          <div id="reg_page" style="display:block">
          <%
		  }
		  else
		  {
          %>
          <div id="reg_page" style="display:none">
          <%
		  }
          %>
          Se invece volete registrare un'altra struttura dovete inserire un diverso indirizzo e-mail.<br/>
          Potete ultimare la registrazione in questo senso cliccando <a href="javascript: onclick=history.back()">qui</a>.
          </div>
        </div>
        </form>
     </div>

        <%
        if( StringUtils.isNotEmpty(s) && StringUtils.equals(s,"success") )
        {
        %>
        <p>
          Vi sono state spedite all'indirizzo <b><%=mail %></b> la username e la password per l'accesso alle pagine di amministrazione relative alla struttura <%= denominazione %>.<br/>
          Dopo aver letto l'e-mail loggatevi a <a href="${pageContext.request.contextPath}/View/doLog.jsp">questa pagina</a>.
        </p>

		<%
		}
		%>
		  </div>
		</div>
	 </div>
     <jsp:include page="../View/snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.alreadyRegistered" />
       <jsp:param name="header_text" value="hdr.alreadyRegistered" />
     </jsp:include>
     <jsp:include page="../View/snippets/new_footer.jsp" />
  </div>
</div>
</div>
</div>
</body>
</html>
