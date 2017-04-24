<%--
Stampa il footer.
Per includere la pagina utilizzare:

  <jsp:include page="snippets/new_footer.jsp" />

per ottenere il footer con link, altrimenti (per ottenerlo senza link) usare:

  <jsp:include page="snippets/new_footer.jsp" >
    <jsp:param name="no_link" value="true" />
  </jsp:include>

--%>

<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>

<% String no_link = request.getParameter("no_link"); %>

       <div class="clearer">&nbsp;</div>
		<div id="footer">
			<div id="footer_inner">

				<div class="left">
					<b> <fmt:message key="msg.alloggio_italiano_2009"/> </b>
					<br/> <small><fmt:message key="msg.sede_legale"/></small>
					<br/> <fmt:message key="msg.partita_iva"/>
					<br/> <a href="${pageContext.request.contextPath}/docs/InformativaPrivacy.pdf">Informativa Privacy</a>
				</div>

				<div class="right">
				<%--
				<%
			    if( no_link != null && no_link.equals("true") )
			    {
			      %><fmt:message key="lnk.alloggioitaliano"/><%
			    }
			    else
			    {
			      %>--%>
			        <a href="<%= request.getContextPath() + response.encodeURL("/View/home.jsp") %>">
			          <fmt:message key="lnk.alloggioitaliano"/>
			        </a>
			    <%-- <%
			    }
			    %> --%>
				</div>
				<div class="clearer">&nbsp;</div>
			</div>
		</div>