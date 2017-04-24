<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  anna.alit.servicebb.JspServiceImpl,
  anna.alit.beanbb.HashBean,
  org.apache.commons.lang.StringUtils,
  anna.alit.servicebb.GetAlloggioDataImpl"
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
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <title>scheda descrizione: <%=tipoesteso %> <%=denominazione %> <%= comune%> <%=prov %> <%=regione %></title>
<!--  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=ABQIAAAAkLucPIc7YtSivqIzqYLJQRSbM_AZt0X8PfcJ4lNq_ej3KJYxjRQVX0seVkth2d86GEvxXgugIusB8g" type="text/javascript"></script>   <script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=ABQIAAAAkLucPIc7YtSivqIzqYLJQRSbM_AZt0X8PfcJ4lNq_ej3KJYxjRQVX0seVkth2d86GEvxXgugIusB8g"></script> -->
<script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=ABQIAAAAkLucPIc7YtSivqIzqYLJQRRYrBLueRg11qs1OyECXYhR3fToYhTsrqcdx-ldv0l7GXyVYP0n_Z7pKw"></script>
  <script type="text/javascript">
  function addLoadEvent(func) {
	  var oldonload = window.onload;
	  if (typeof window.onload != 'function') {
	    window.onload = func;
	  } else {
	    window.onload = function() {
	      if (oldonload) {
	        oldonload();
	      }
	      func();
	    }
	  }
	}
  addLoadEvent(function() {
		initialize();
	  });
  </script>
  <script>
  var address = null;
  var map = null;
  var geocoder = null;
    function initialize()
    {
      address = document.getElementById('address').value;
      if (GBrowserIsCompatible())
      {
        map = new GMap2(document.getElementById("cartina"));
        map.setCenter(new GLatLng(41.75223117, 13.72740214), 4); //latitudine, logitudine, livello di zoom
        map.addControl(new GSmallMapControl());
        map.addControl(new GMapTypeControl());
        geocoder = new GClientGeocoder();
        showAddress(address);
      }
    }

    function showAddress(address)
    {
      if (geocoder)
      {
        geocoder.getLatLng(
            address,
            function(point)
            {
              if (!point)
              {
                alert('<fmt:message key="msg.indirizzo_non_disponibile_su_googlemap"/>');
              }
              else
              {
                map.setCenter(point, 13);
                var marker = new GMarker(point);
                map.addOverlay(marker);
              }
            }
          );
      }
    }
  </script>
  <meta name="description" content="scheda di descrizione de <%=tipoesteso %> <%=denominazione %> <%=comune%> <%=prov %> <%=regione %>" />
  <meta name="keywords" content="<%=tipoesteso %>, <%=denominazione %>, <%= comune%>, <%=prov %>, <%=regione %>, descrizione, mappa, immagini, foto" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/slide.js"></script>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.scheda2" />
  </jsp:include>
</head>

<!-- <body onload="initialize()" onunload="GUnload()"> -->
<body onunload="GUnload()">

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
               <fmt:message key="ttl.scheda2"/>
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

		    String indirizzo = hashbean.get("indirizzo");
		    String loco = hashbean.get("loco");
		    String sigl = hashbean.get("sigla");

		    String address = "";

		    if(sigl == null)
		      sigl = "";
		    if(indirizzo == null)
		      indirizzo = "";
		    if(loco == null)
		      loco = "";
		    if(civico == null)
		      civico = "";
		    if(comune == null || (comune.equals("-")))
		      comune = "";
		    if(indirizzo.contains("Frazione"))
		      indirizzo = indirizzo.replace("Frazione", "");
		    if(indirizzo.contains("LocalitÃ "))
		      indirizzo = indirizzo.replace("LocalitÃ ", "");
		    if(indirizzo.contains("Contrada"))
		      indirizzo = indirizzo.replace("Contrada", "");


		    if(sigl != null || comune != null || indirizzo != null)
		      address += "Italy ";

		    address += sigl + " " + comune + " " + loco + " " + indirizzo + " " + civico;
        %>
        <input type="hidden" name="address" id="address" value="<%=address %>" />

      <table id="currentnext">
        <tr>
          <td id="next2" class="navLblScheda">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
              <a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda1.jsp?provincia="+sigl+"&comune="+c+"&nome=" + d)%>">
                <b><fmt:message key="msg.caratteristiche_e_servizi_della_struttura"/></b>
              </a>
            </div>
          </td>
          <td id="current" class="navLblScheda">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-pink.png"></img>
              <a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda2.jsp?provincia="+sigl+"&comune="+c+"&nome=" + d)%>">
                <b><fmt:message key="msg.descrizione_della_struttura"/></b>
              </a>
            </div>
          </td>
          <td id="next1" class="navLblScheda">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
              <a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda3.jsp?provincia="+sigl+"&comune="+c+"&nome=" + d)%>">
                <b><fmt:message key="msg.disponibilita_della_struttura"/></b>
              </a>
            </div>
          </td>
        </tr>
      </table>

		<%
		String userId =  hashbean.get("id");
		boolean isPresentImage01 = JspServiceImpl.getInstance().imagePresent(userId, "01");
	    if( isPresentImage01 )
	    {
			boolean isPresentImage02 = JspServiceImpl.getInstance().imagePresent(userId, "02");
			boolean isPresentImage03 = JspServiceImpl.getInstance().imagePresent(userId, "03");
			boolean isPresentImage04 = JspServiceImpl.getInstance().imagePresent(userId, "04");
			boolean isPresentImage05 = JspServiceImpl.getInstance().imagePresent(userId, "05");
			boolean isPresentImage06 = JspServiceImpl.getInstance().imagePresent(userId, "06");
			boolean isPresentImage07 = JspServiceImpl.getInstance().imagePresent(userId, "07");
			boolean isPresentImage08 = JspServiceImpl.getInstance().imagePresent(userId, "08");
			boolean isPresentImage09 = JspServiceImpl.getInstance().imagePresent(userId, "09");
			boolean isPresentImage10 = JspServiceImpl.getInstance().imagePresent(userId, "10");
	    	%>
			<form name="slide" id="slide">
			<div style="text-align:center;font-size:9pt">
			<br/><br/>
			  <input type="hidden" name="image0" value="01" />
			  <%
			  if( isPresentImage02 )
			  {
			  %>
			    <input type="hidden" name="image1" value="<%=context%>/View/image.jsp?image=02&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage03 )
			  {
			  %>
			    <input type="hidden" name="image2" value="<%=context%>/View/image.jsp?image=03&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage04 )
			  {
			  %>
			    <input type="hidden" name="image4" value="<%=context%>/View/image.jsp?image=04&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage05 )
			  {
			  %>
			    <input type="hidden" name="image5" value="<%=context%>/View/image.jsp?image=05&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage06 )
			  {
			  %>
			    <input type="hidden" name="image6" value="<%=context%>/View/image.jsp?image=06&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage07 )
			  {
			  %>
			    <input type="hidden" name="image7" value="<%=context%>/View/image.jsp?image=07&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage08 )
			  {
			  %>
			    <input type="hidden" name="image8" value="<%=context%>/View/image.jsp?image=08&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage09 )
			  {
			  %>
			    <input type="hidden" name="image9" value="<%=context%>/View/image.jsp?image=09&id_azienda=<%= userId %>" />
			  <%
			  }

			  if( isPresentImage10 )
			  {
			  %>
			    <input type="hidden" name="image10" value="<%=context%>/View/image.jsp?image=10&id_azienda=<%= userId %>" />
			  <%
			  }
			  %>
			  <div id="slide">
			      <input type="hidden" name="num" id="num" value="1" />
			      <img name="q0" class="galleria" src="<%=context%>/View/image.jsp?image=01&id_azienda=<%= userId %>"  />
			  </div>

			  <br />

			  <div class="arrow1">
			  	<img class="arrow" title="immagine precedente"
			  	 	src="${pageContext.request.contextPath}/View/img/left_arrow_2.png" onclick="changeSlide('back', <%=userId %>, '<%=context %>')" />
			  </div>
			  <div class="arrow2">
			  	<img class="arrow" title="immagine successiva"
			  		src="${pageContext.request.contextPath}/View/img/right_arrow_2.png" onclick="changeSlide('back', <%=userId %>, '<%=context %>')" />
			  </div>

			  <br/><br/>
			</div>
			</form>
	    <%
	    }
	    %>

			  <div id="forDescr">
			  <br/><br/>
			    <%
			    String descrizione_ita = hashbean.get("descrizione_ita");
			    String descrizione_eng = hashbean.get("descrizione_eng");
			    if(descrizione_ita != null && locale.equals("it"))
			    {
			      out.print(descrizione_ita);
			    }
			    else if(descrizione_eng != null && locale.equals("en"))
			    {
			      out.print(descrizione_eng);
			    }
			    else
			    {
			      out.print("");
			    }
			    %>
              </div>


<br/><br/>

		    <div class="parent_pane">
		     <div class="left_pane_scheda">
			  <div id="cartina" style="width:360px; height:260px"></div>
			  <div id="nomap" style="color:red"></div>
			  <br/><br/>
			 </div>

		     <div class="right_pane_scheda">

			  <p class="forButton" style="font-size:9pt">
			  <%if(StringUtils.isNotEmpty(hashbean.get("latitudine")))
			  {
			  %>
			    &nbsp;&nbsp;<b><fmt:message key="msg.Latitudine_nord_"/></b>&nbsp;<%= hashbean.get("latitudine")%>
			  <%
			  }
			  if(StringUtils.isNotEmpty(hashbean.get("longitudine")))
			  {
			  %>
			    <br/>
			    &nbsp;&nbsp;<b><fmt:message key="msg.Longitudine_est_"/></b>&nbsp;<%= hashbean.get("longitudine")%>
			  <%
			  }
			  %>
			    <br/><br/><br/>
			    <button type="submit"
			      <%= (hashbean.get("wwwilmeteo") != null) ? " onclick=\"window.open('http://" + hashbean.get("wwwilmeteo") + "/previsioni-sperimentali');\"" : "" %> >
			      <span style="width:150px" class="round"><span> <fmt:message key="btn.meteo_locale"/> </span></span>
			    </button>
			    <br/><br/>
			    <button type="submit"
			      <%= (hashbean.get("sito") != null) ? " onclick=\"window.open('http://" + hashbean.get("sito") + "');\"" : "" %> >
			      <span style="width:150px" class="round"><span> <fmt:message key="btn.sito_web_regione"/> </span></span>
			    </button>
			    <br/><br/>
			    <button type="submit"
			      <%= (hashbean.get("sitoprovincia") != null) ? " onclick=\"window.open('http://" + hashbean.get("sitoprovincia") + "');\"" : "" %> >
			      <span style="width:150px" class="round"><span> <fmt:message key="btn.sito_web_provincia"/> </span></span>
			    </button>
			    <br/><br/>
			    <button type="submit"
			      <%= (hashbean.get("webistituzionale") != null) ? " onclick=\"window.open('http://" + hashbean.get("webistituzionale") + "');\"" : "" %> >
			      <span style="width:150px" class="round"> <span> <fmt:message key="btn.sito_web_comune"/> </span> </span>
			    </button>
			  </p>
			  </div>
			</div>



 			   <div style="clear:both">
 			   <br/><br/>
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
               </div>

             <br/>
             <br/>
			 <div class="bannerContainer">
			 <%--
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
			 </div> --%>
		     </div>

            <div style="clear:both"></div>


		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.scheda2" />
       <jsp:param name="header_text" value="hdr.scheda2" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp">
       <jsp:param name="no_link" value="true" />
     </jsp:include>

  </div>
</div>
</div>
</body>
</html>