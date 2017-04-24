<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>
<%@page import="java.sql.*, anna.alit.servicebb.DbmsImpl" %>
<%
	String context = request.getContextPath();
	Object idL =  session.getAttribute("idLoggato");
%>

	<div id="toplinks">
	 <%String url =  context + response.encodeURL("/View/presentazione.jsp"); %>
		<div id="toplinks_inner">
			<ul>
				<li><a href="<%=url%>">Project</a> |</li>
				<li><a href="${pageContext.request.contextPath}/docs/InformativaPrivacy.pdf">Privacy</a> |</li>
				<li><a href="${pageContext.request.contextPath}/docs/RegolamentoAlloggioItaliano.pdf">Legal</a></li>
			</ul>
			<div class="clearer">&nbsp;</div>
		</div>
	</div>

	<div class="clearer">&nbsp;</div>

	<div id="header">
		<div id="header_inner">
        <div class="flag">
		  <jsp:include page="flags.jsp" /><br/>
         <%
         String sql="select count(id) as counter from datiaziende";
         try
         {
           ResultSet rs;
           rs = DbmsImpl.getInstance().executeQuery(sql);
           if(rs != null && rs.next())
           {
         %>
          <b><%= rs.getInt("counter")%></b>
         <%
           }
         }
         catch(SQLException e)
         {
           e.getMessage();
         }
         %>
        <fmt:message key="lnk.strutture"/>
	    <% if(idL != null)
	    {
	    %>
	    <br/>

         <form action="${pageContext.request.contextPath}/Action" method="get">

            <input type="hidden" name="action" id="action" value="logout"/>

            <button id="out" type="submit">

             <span class="round"><span><fmt:message key="btn.click_to_logout"/></span></span>

            </button>

         </form>

                <!--
	     <c:url var="action_logout" value="/Action">
	       <c:param name="action" value="logout" />
	     </c:url>
	     <a style="text-decoration:none;" href='<c:out value="${action_logout}"/>'>
	       <button id="out" type="button">
	         <span class="round"><span><fmt:message key="btn.click_to_logout"/></span></span>
	       </button>
	     </a> -->
	     <%
	     }
	     %>
		</div>
		<h1><img src="${pageContext.request.contextPath}/View/img/Alloggio-Logo.png" title="Alloggio Italiano" alt="Alloggio Italiano"/></h1>
	      <p><span><fmt:message key="int.occhiello"/></span></p>
		</div>


	</div>

	<div id="navigation">
		<div id="navigation_inner">
		  <jsp:include page="new_left.jsp" />
		</div>


<%-- the following are the boxes for Adsense spots --%>
<%-- FIRST SPOT-BOX --%>
		<div class="adSense120x600">
<script type="text/javascript"><!--
google_ad_client = "ca-pub-6541445756952525";
/* adj-jul-002 */
google_ad_slot = "8964120298";
google_ad_width = 120;
google_ad_height = 600;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
		</div>

		<br/>
		<br/>


<%-- 2ND SPOT-BOX --%>

<div class="adSense120x60">
<script type="text/javascript"><!--
google_ad_client = "ca-pub-6541445756952525";
/* link-unit-adj-001 */
google_ad_slot = "0098614571";
google_ad_width = 120;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>

		<br/>
		<br/>


<!--
				<div class="box">

					<div class="box_title"><fmt:message key="int.loghigalleria"/></div>

					<div class="box_content">

						<div class="thumbnailsNew">

							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:8px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-11.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:16px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-08.png"/></div></a>
<%--							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-12.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:10px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-14.png"/></div></a>
 --%>
 							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-16.png"/></div></a>
<%--							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:8px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-17.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:27px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-01.png"/></div></a>
--%>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:10px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-18.png"/></div></a>

							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:12px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-03.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" style="padding-top:8px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-04.png"/></div></a>
<%--							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-10.png"/></div></a>--%>
<%-- 							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-06.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-19.png"/></div></a>
 --%>
 							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumbNew"><div class="thumbs"></div></a>

							<div class="clearer">&nbsp;</div>

						</div>

					</div>

				</div>

-->
<BR/><BR/>
<%-- 3RD SPOT-BOX --%>

		 <div class="adSense120x240">
			<script type="text/javascript"><!--
			google_ad_client = "ca-pub-6541445756952525";
			/* 3rd_element_left_banner */
			google_ad_slot = "1998791011";
			google_ad_width = 120;
			google_ad_height = 240;
			//-->
			</script>
			<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
	</div>

