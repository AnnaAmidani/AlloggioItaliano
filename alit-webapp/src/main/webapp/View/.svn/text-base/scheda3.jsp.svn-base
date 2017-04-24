<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  anna.alit.beanbb.HashBean,
  anna.alit.servicebb.JspServiceImpl,
  anna.alit.servicebb.GetAlloggioDataImpl,
  anna.alit.servicebb.TitolareServiceImpl,
  anna.alit.servicexhtml.TableXhtml"
%>
  <%
  String context = request.getContextPath();

  HashBean hashbean = (HashBean) session.getAttribute("hashbean");

  if(hashbean == null)
  {
	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
  }

  String denominazione =  (hashbean.get("denominazione") != null) ? hashbean.get("denominazione") : "";
  String tipoesteso =  (hashbean.get("tipoesteso") != null) ? hashbean.get("tipoesteso") : "";
  String prov =  (hashbean.get("nomeesteso") != null) ? hashbean.get("nomeesteso") : "";
  String regione =  (hashbean.get("regione") != null) ? hashbean.get("regione") : "";
  String comune = (hashbean.get("comune") != null) ? hashbean.get("comune") : "";
  String sigla = (hashbean.get("sigla") != null) ? hashbean.get("sigla") : "";
  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>scheda disponibilità: <%=tipoesteso %> <%=denominazione %> <%=comune %> <%=prov %> <%=regione %></title>
  <meta http-equiv="content-type" content="text/html" />
  <meta name="autore" content="Anna Amidani" />
  <meta name="description" content="scheda di descrizione della disponibilità de <%=tipoesteso %> <%=denominazione %> <%=comune %>  <%=prov %> <%=regione %>" />
  <meta name="keywords" content="<%=tipoesteso %>, <%=denominazione %>, <%=comune %> , <%=prov %>, <%=regione %>, disponibilità, calendario, stagioni, alta, bassa, prezzi" />
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.scheda3" />
  </jsp:include>
</head>

<body>

<div id="wrapper">
<div id="wrapper_inner">
  <jsp:include page="snippets/new_header.jsp" />
  <div id="main">
	<div class="left" id="content">
		<div id="content_inner">
		  <div class="post">

			<div class="post_title">
			 <h2>
			   <a href="#">
               <fmt:message key="ttl.scheda3"/>
			   </a>
			 </h2>
			</div>

			 <div class="responsab">
               <%
                 if(hashbean.get("responsabilita") != null)
                 {
	                 if(hashbean.get("responsabilita").equals("t"))
	                 {
	                   %>
	                   <fmt:message key="hdd.noresp_struttura"/>
	                   <%
	                 }
	                 else
	                 {
	                   %>
	                  <fmt:message key="hdd.noresp_alloggio"/>
	                   <%
	                 }
                 }
               %>
		    </div>
		    <br/>
		      <div class="social">
			    <%String thisUrl = request.getRequestURL()+"?"+request.getQueryString(); %>
			    <g:plusone size="medium"></g:plusone>
                <iframe src="http://www.facebook.com/plugins/like.php?href=<%=thisUrl%>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font=verdana&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:110px; height:21px; margin-right:25px" allowTransparency="true"></iframe>
	            <a href="http://twitter.com/share" class="twitter-share-button" data-url="<%=thisUrl%>" data-count="horizontal">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>&nbsp;&nbsp;
	            <a href="http://www.netlog.com/go/manage/links/view=save&origin=external&url=<%=thisUrl%>"><img src="http://v4.netlogstatic.com/last/s/i/common/buttons/add_link.png" /></a>
	          </div>
			    <div class="intestazione">
	              <b>
	                <%= (hashbean.get("tipoesteso") != null) ? hashbean.get("tipoesteso") : "" %>
	                <%= denominazione %>
	              </b>
	              <br/>
	              <%= (hashbean.get("loco") != null) ? hashbean.get("loco") : "" %>
	              <%= (hashbean.get("indirizzo") != null) ? hashbean.get("indirizzo") : "" %>
	              <%
	              String civico = hashbean.get("civico");
	              if ( civico != null && !(civico.equals("")) )
	                out.print(", " + civico);
	              %>
	              <% if(hashbean.get("nzona") != null && hashbean.get("zona") != null) out.print("  "); %>
	              <%= (hashbean.get("nzona") != null) ? hashbean.get("nzona") : "" %>
	              <%= (hashbean.get("zona") != null) ? hashbean.get("zona") : "" %>
	              <br/>
	              <%
	              String cap = hashbean.get("cap");
	              if (cap != null && !(cap.equals("")))
	                out.print(cap + " - ");

	              if ( comune != null && !(comune.equals("")) && !(comune.equals("-")) )
	              {
	              %>
	              <fmt:message key="msg.comune_di"/> <%= comune %>
	              <%
	              }
	              %>
	              <br/>
	              <fmt:message key="msg.provincia_di"/>
	              <%= (hashbean.get("nomeesteso") != null) ? hashbean.get("nomeesteso") : "" %>
	              <fmt:message key="msg.-_regione"/>
	              <%= (hashbean.get("regione") != null) ? hashbean.get("regione") : "" %>
			    </div>
				<br/>

		       <%
                String c = comune.replaceAll(" ", "-").replaceAll("\\`", "-").replaceAll("--", "-");
                String d = denominazione.replaceAll(" ", "-").replaceAll("\\`", "-").replaceAll("--", "-");
           %>

      <table id="currentnext">
        <tr>
          <td id="next2" class="navLblScheda">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
              <a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda1.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
                <b><fmt:message key="msg.caratteristiche_e_servizi_della_struttura"/></b>
              </a>
            </div>
          </td>
<!--           <td id="next1" class="navLblScheda">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
              <a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda2.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
                <b><fmt:message key="msg.descrizione_della_struttura"/></b>
              </a>
            </div>
          </td>   -->
          <td id="current" class="navLblScheda">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-pink.png"></img>
              <a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda3.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
                <b><fmt:message key="msg.disponibilita_della_struttura"/></b>
              </a>
            </div>
          </td>
        </tr>
      </table>

			<br/><br/>

	    <div>
	      <fmt:message key="msg.calendario_di_apertura_chiusura_ecc"/>
	    </div>

	    <br/>

			<div class="calend_bkg">
             <div class="calend_bkg" >
		      <%= TableXhtml.getCalendarTable(hashbean, request.getContextPath()) %>
             </div>
            </div>

		    <div class="calend_bkg_leg">
		    <div class="calend_bkg_leg_sub">
		    <table class="tab">
		    <tr>
		      <td class="pad">
		        <img src="${pageContext.request.contextPath}/View/img/cal0.gif"/><br/>
		        <fmt:message key="msg.disponibilita_non_stabilita_della_struttura"/>
		      </td>
		      <td class="pad">
		        <img src="${pageContext.request.contextPath}/View/img/cal1.gif"/><br/>
		        <fmt:message key="msg.struttura_aperta_e_completamente_libera_bassa_stagione"/>
		      </td>
		      <td class="pad">
		        <img src="${pageContext.request.contextPath}/View/img/cal4_old.gif"/><br/>
		        <fmt:message key="msg.struttura_in_parte_prenotata"/>
		      </td>
		    </tr>
		    <tr>
		      <td class="pad">
		        <img src="${pageContext.request.contextPath}/View/img/cal3.gif"/><br/>
		        <fmt:message key="msg.periodo_di_chiusura_della_struttura"/>
		      </td>
		      <td class="pad">
		        <img src="${pageContext.request.contextPath}/View/img/cal2.gif"/><br/>
		        <fmt:message key="msg.struttura_aperta_e_completamente_libera_alta_stagione"/>
		      </td>
		      <td class="pad">
		        <img src="${pageContext.request.contextPath}/View/img/cal5_old.gif"/><br/>
		        <fmt:message key="msg.struttura_completamente_prenotata"/>
		      </td>
		    </tr>
		  </table>
		  </div>
         </div>



			<br/><br/>


<hr/>
			<br/><br/>
			<div><fmt:message key="int.prezzidescr"/></div>
			<br/>
			<table width="670px" id="prices">
		     <thead>
		     <tr>
<% if(locale.equals("en"))
{
%>
		     <th> <img src="<%=context%>/View/img/pricesLabels/season.gif"/> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/number-of-stays.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/sleeping-bed.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/single-room-bc.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/single-room-bp.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/double-bc-1px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/double-bp-1px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/double-bc-2px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/double-bp-2px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/triple-bc-3px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/triple-bp-3px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/quadruple-bc-4px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/quadruple-bp-4px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/flat.gif" /> </th>

<%
}
else
{
%>
		     <th> <img src="<%=context%>/View/img/pricesLabels/stagione.gif"/> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/durata-soggiorno.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/posto-letto.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/singola-bc-1px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/singola-bp-1px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/doppia-bc-1px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/doppia-bp-1px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/doppia-bc-2px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/doppia-bp-2px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/tripla-bc-3px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/tripla-bp-3px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/quadrupla-bc-4px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/quadrupla-bp-4px.gif" /> </th>
		     <th> <img src="<%=context%>/View/img/pricesLabels/appartamento.gif" /> </th>

<%
}
%>
		     </tr>
		     </thead>
		     <%
		      String[] tab = TitolareServiceImpl.getInstance().getTabWithoutZero( hashbean.get("tab") );

		       out.println(TableXhtml.getTableOutput(context, locale, tab));
		     %>
		     </table>
		     <p class="note"><b>note:&nbsp;</b>
		     <%= (hashbean.get("note") != null) ? hashbean.get("note") : "" %>
		     </p>


<br/><br/>


		    <p style="clear:both">
		       <%
		         if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
		         {
		       %>
					<% if(regione != null) regione = regione.replaceAll(" ", "-"); %>
					<b><a style="color:black" href="<%= context + response.encodeURL("/View/alloggioRis.jsp?regione="+ regione)%>">TORNA A PAGINA RISULTATI...</a></b>
		       <%
		         }
		       else
		         {
		       %>
					<b><a style="color:black" href="<%= context + response.encodeURL("/View/logged.jsp")%>">TORNA A PANNELLO FUNZIONI UTENTE...</a></b>
		       <%
		         }
		       %>

		    </p>

             <br/>
             <br/>

              <%--
			 <div class="bannerContainer">

			 <div class="adSense468x60">
				<script type="text/javascript"><!--
				google_ad_client = "ca-pub-6541445756952525";
				/* 1st_image_bottom_banner */
				google_ad_slot = "0500198359";
				google_ad_width = 468;
				google_ad_height = 60;
				//-->
				</script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			 </div>
		     </div>
		     --%>

            <div style="clear:both"></div>

		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.scheda3" />
       <jsp:param name="header_text" value="hdr.scheda3" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>