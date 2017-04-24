<%--
Stampa il footer.

Per includere la pagina utilizzare:

  <jsp:include page="snippets/footer.jsp" />

per ottenere il footer con link,
altrimenti (per ottenerlo senza link) usare:

  <jsp:include page="snippets/footer.jsp" >
    <jsp:param name="no_link" value="true" />
  </jsp:include>

--%>

<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>

  <%
  String header_text = request.getParameter("header_text");
  %>

		<div class="right" id="sidebar_outer">
			<div id="sidebar">

				<div class="box">

					<div class="box_title">In questa pagina</div>

					<div class="box_content">
						<p>
							<%
					        if( header_text != null )
					        {
					            String first = "_first";
					            String last = "_last";
					        %>
					        <fmt:message key="<%=header_text + first %>"/>
					        <fmt:message key="<%=header_text + last %>"/>
					        <%
					        }
					        %>
						</p>
					</div>

				</div>

				<div class="box">

					<div class="box_title">Categories</div>

					<div class="box_content">
						<ul>
                          <jsp:include page="right_navigation.jsp" >
                        </ul>
					</div>

				</div>
<!--
				<div class="box">

					<div class="box_title">Resources</div>

					<div class="box_content">
						<ul>
							<li><a href="http://templates.arcsin.se/">Arcsin Web Templates</a></li>
							<li><a href="http://www.google.com/">Google</a> - Web Search</li>
							<li><a href="http://www.w3schools.com/">W3Schools</a> - Online Web Tutorials</li>
							<li><a href="http://www.wordpress.org/">WordPress</a> - Blog Platform</li>
							<li><a href="http://cakephp.org/">CakePHP</a> - PHP Framework</li>
						</ul>
					</div>

				</div>
 -->
				<div class="box">

					<div class="box_title">Gallery</div>

					<div class="box_content">

						<div class="thumbnails">

							<a href="#" class="thumb"><img src="${pageContext.request.contextPath}/View/img/sample-thumbnail.jpg" width="75" height="75" alt="" /></a>
							<a href="#" class="thumb"><img src="${pageContext.request.contextPath}/View/img/sample-thumbnail.jpg" width="75" height="75" alt="" /></a>
							<a href="#" class="thumb"><img src="${pageContext.request.contextPath}/View/img/sample-thumbnail.jpg" width="75" height="75" alt="" /></a>
							<a href="#" class="thumb"><img src="${pageContext.request.contextPath}/View/img/sample-thumbnail.jpg" width="75" height="75" alt="" /></a>
							<a href="#" class="thumb"><img src="${pageContext.request.contextPath}/View/img/sample-thumbnail.jpg" width="75" height="75" alt="" /></a>
							<a href="#" class="thumb"><img src="${pageContext.request.contextPath}/View/img/sample-thumbnail.jpg" width="75" height="75" alt="" /></a>

							<div class="clearer">&nbsp;</div>

						</div>

					</div>

				</div>

			</div>
		</div>

		<div class="clearer">&nbsp;</div>

		<div id="footer">
			<div id="footer_inner">

				<div class="left">
					&copy; 2008 Website.com - Your Site Slogan
				</div>

				<div class="right">
				  <p>
					<b> <fmt:message key="msg.alloggio_italiano_2009"/> </b>
					<br/> <small><fmt:message key="msg.sede_legale"/></small>
					<br/> <fmt:message key="msg.partita_iva"/>
					<br/> <a href="${pageContext.request.contextPath}/docs/InformativaPrivacy.pdf">Informativa Privacy</a>
				  </p>
				</div>

				<div class="clearer">&nbsp;</div>

			</div>
		</div>


<%--
  <% String no_link = request.getParameter("no_link"); %>

  <div id="footer">
    <%
    if( no_link != null && no_link.equals("true") )
    {
      %><fmt:message key="lnk.alloggioitaliano"/><%
    }
    else
    {
      %>
        <a href="<%= request.getContextPath() + response.encodeURL("/View/home.jsp") %>">
          <fmt:message key="lnk.alloggioitaliano"/>
        </a>
      <%
    }
    %>
  </div>

  <div id="sub_footer">
  <p>
    <b> <fmt:message key="msg.alloggio_italiano_2009"/> </b>
    <br/> <small><fmt:message key="msg.sede_legale"/></small>
    <br/> <fmt:message key="msg.partita_iva"/>
    <br/> <a href="${pageContext.request.contextPath}/docs/InformativaPrivacy.pdf">Informativa Privacy</a>
  </p>
</div>

  --%>
