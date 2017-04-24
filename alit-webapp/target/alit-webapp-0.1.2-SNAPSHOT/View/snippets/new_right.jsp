<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>

  <%
  String header_text = request.getParameter("header_text");
  %>
		<div class="right" id="sidebar_outer">
			<div id="sidebar">
				<div class="box">

					<div class="box_title"><fmt:message key="int.questapagina"/></div>

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
 				<div class="box_content">
 					<div class="adSense300x250">
<script type="text/javascript"><!--
google_ad_client = "ca-pub-6541445756952525";
/* adj-jul-003 */
google_ad_slot = "7467498105";
google_ad_width = 300;
google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
 			</div>


				<div class="box">

					<div class="box_title"><fmt:message key="int.rapida"/></div>

					<div class="box_content">
                      <jsp:include page="right_navigation.jsp" />
					</div>

				</div>


				<div class="box">
<script type="text/javascript"><!--
google_ad_client = "ca-pub-6541445756952525";
/* ad-jul001 */
google_ad_slot = "5325435677";
google_ad_width = 300;
google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>


				<div class="box">

					<div class="box_title"><fmt:message key="int.risorse"/></div>

					<div class="box_content">
						<ul>
							<li><a href="http://www.italia.it" title="Sito ufficiale del turismo in Italia">Italia</a></li>
							<li><a href="http://www.easy-italia.com" title="Informazioni e assistenza ai turisti">Easy Italia</a></li>
							<li><a href="http://www.magnifico.beniculturali.it" title="Eventi in corso e informazione ai turisti">Progetto Magnifico</a></li>
							<li><a href="http://www.beniculturali.it" title="Mostre, eventi, fiere, festival e appuntamenti">Ministero per i Beni e le Attivit&agrave; Culturali</a></li>
							<li><a href="http://www.finesettimana.it" title="Tempo libero e vacanze brevi">Fine Settimana</a></li>
							<li><a href="http://www.italiadelcigno.it" title="Percorsi poco noti">Italia del Cigno</a></li>
							<li><a href="http://www.touringclub.it" title="Eventi sul territorio italiano">Touring Club Italiano</a></li>
							<li><a href="http://www.borghitalia.it" title="Il fascino dell'Italia nascosta">I Borghi pi&ugrave; Belli d'Italia</a></li>
							<li><a href="http://www.qualcosadafare.it" title="Eventi, luoghi e cose da fare">Qualcosa da Fare</a></li>
							<li><a href="http://mostreemusei.sns.it/" title="LAARTE - Scuola Normale Superiore di Pisa">Osservatorio Mostre e Musei</a></li>
						</ul>
					</div>

				</div>

				<div class="box">

					<div class="box_title"><fmt:message key="int.loghigalleria"/></div>

					<div class="box_content">

						<div class="thumbnails">

							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:16px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-08.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:8px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-11.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-12.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:10px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-14.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-16.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:8px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-17.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:27px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-01.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:10px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-18.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:12px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-03.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" style="padding-top:8px" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-04.png"/></div></a>
<%--							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-10.png"/></div></a>--%>
 							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-06.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"><img class="galleria" src="${pageContext.request.contextPath}/View/css-ai/imgs/loghi/Alloggio-Italiano-19.png"/></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"></div></a>
							<a href="${pageContext.request.contextPath}/View/logo.jsp" class="thumb"><div class="thumbs"></div></a>

							<div class="clearer">&nbsp;</div>

						</div>

					</div>

				</div>

		</div>
		</div>