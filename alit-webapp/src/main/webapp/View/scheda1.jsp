<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  anna.alit.servicebb.JspServiceImpl,
  anna.alit.beanbb.HashBean,
  anna.alit.servicebb.GetAlloggioDataImpl,
  org.apache.commons.lang.StringUtils"
%>

<%!
String zeroToNull(String value) {
	if (value != null && value.equals(0))
		return null;
	return value;
}
%>

<%
	String context = request.getContextPath();

	String id = request.getParameter("id");
	HashBean hashbean = null;

	if(id != null)
	{
	  hashbean = GetAlloggioDataImpl.getInstance().getData(id);
	  session.setAttribute("hashbean", hashbean);
	}
	else
	{
	  hashbean = (HashBean) session.getAttribute("hashbean");
	}

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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <title>scheda caratteristiche: <%=tipoesteso %> <%=denominazione %> <%=comune %>  <%=prov %> <%=regione %></title>
  <meta http-equiv="content-type" content="text/html" />
  <meta name="autore" content="Anna Amidani" />
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
  <script language="JavaScript">
    function salva()
    {
      if (document.all)
      {
        document.execCommand("SaveAs");
      }
      else
      {
        alert('<fmt:message key="msg.Funzione_non_supportata_dal_browser_che_state_usando"/>');
      }
    }
  </script>
  <meta name="description" content="scheda di descrizione delle caratteristiche de <%=tipoesteso %> <%=denominazione %> <%=comune %>  <%=prov %> <%=regione %>" />
  <meta name="keywords" content="<%=tipoesteso %>, <%=denominazione %>, <%= comune%>, <%=prov %>, <%=regione %>, descrizione, mappa, immagini, foto" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/slide.js"></script>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.scheda1" />
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
               <fmt:message key="ttl.scheda1"/>
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


<!--  -->
			<table id="currentnext">
				<tr>
					<td id="current" class="navLblScheda">
						<div class="tab">
							<img src="${pageContext.request.contextPath}/View/img/tab-pink.png"></img>
							<a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda1.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
			  				<b><fmt:message key="msg.caratteristiche_e_servizi_della_struttura"/></b>
							</a>
						</div>
					</td>
<!--
					<td id="next1" class="navLblScheda">
						<div class="tab">
							<img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
							<a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda2.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
 			  				<b><fmt:message key="msg.descrizione_della_struttura"/></b>
							</a>
						</div>
					</td>

					 -->
					<td id="next2" class="navLblScheda">
						<div class="tab">
							<img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
 							<a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda3.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
			  				<b><fmt:message key="msg.disponibilita_della_struttura"/></b>
							</a>
						</div>
					</td>

				</tr>
			</table>

		<div style="margin-top:-10px;margin-bottom:30px">
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

		</div>
               <div style="clear:both; margin-bottom:20px"></div>

<%--Anna --%>

              <div id="PerLink">


                <div class="fotoL fucsiaButton">
                <div id="intastoLink1">
                <a href="#" onclick="<%
                  String web = hashbean.get("web");
                  if(web == null || web.contentEquals("-") || web.contentEquals(""))
                  {
                    %> alert('<fmt:message key="msg.nessun_sito_web_inserito_dal_gestore_"/>') <%
                  }
                  else
                  {
                    if(! web.contains("http") )
                      out.print("window.open('http://" + web + "')");
                    else
                      out.print("window.open('" + web + "')");
                  }
                  %>">
                    <br/>
                  <fmt:message key="btn.vedi_il_sito_web"/>
                  </a>
                </div>
              </div>
                <div class="fotoL aquaButton">
                 <div id="intastoLink">
                 <a href="#" onclick="<%
                    String mail = hashbean.get("mail");
                    if(mail != null)
                    {
                      mail = mail.trim();
                      if(mail.indexOf('/') != -1)
                      {
	                    String[] justOneMail = mail.split("/");
	                    mail = justOneMail[1].trim();
                      }
                    }
                    if(mail == null || mail.equals("") || mail.equals("-"))
                    {
                      %> alert('<fmt:message key="msg.spiacenti_nessun_indirizzo_mail_presente_"/>') <%
                    }
                    else
                      out.print("location.href='" + request.getContextPath() + "/View/MailtoStruttura.jsp'");
                    %>">
                    <br/>
                    <fmt:message key="btn.mail_al_gestore"/>
                    </a>
                  </div>
                </div>


              <div class="fotoL orangeButton" >
                <div id="intastoLink2">
                    <br/>
                  <a href="#" onclick="salva()"><fmt:message key="btn.salva_questa_pagina"/></a>
                </div>
              </div>


              <div class="fotoL violetButton">
               <div id="intastoLink3">
               <a href="#" onclick="<%
                  String youtube = hashbean.get("youtube");
                  if( youtube == null || youtube.contentEquals("-") || youtube.contentEquals(""))
                  {
                    %> alert('<fmt:message key="msg.nessun_collegamento_a_youtube_inserito_dal_gestore_"/>') <%
                  }
                  else
                  {
                    if(! youtube.contains("http") )
                      out.print("window.open('http://" + youtube + "')");
                    else
                      out.print("window.open('" + youtube + "')");
                  }
                  %>">
                    <br/>
                  <fmt:message key="btn.vedi_su_youtube"/>
                  </a>
                </div>
              </div>

              <%--
              <div class="fotoL">
                 <img src="${pageContext.request.contextPath}/View/img/back_06.png" width="80px" height="80px" title="frecce" border="no-border"/>
              </div>
               --%>

              <div class="fotoL electricButton">
                <div id="intastoLink5">
                <a href="#" onclick="<%
                  String myspace = hashbean.get("myspace");
                  if( myspace == null || myspace.contentEquals("-") || myspace.contentEquals("") )
                  {
                    %> alert('<fmt:message key="msg.nessun_collegamento_a_myspace_inserito_dal_gestore_"/>') <%
                  }
                  else
                  {
                    if(! myspace.contains("http") )
                      out.print("window.open('http://" + myspace + "')");
                    else
                      out.print("window.open('" + myspace + "')");
                  }
                  %>">
                    <br/>
                  <fmt:message key="btn.vedi_su_myspace"/>
                  </a>
                </div>
              </div>


              <div class="fotoL redButton">
                <div id="intastoLink6">
                <a href="#" onclick="<%
                  String facebook = hashbean.get("facebook");
                  if(facebook == null || facebook.contentEquals("-") || facebook.contentEquals(""))
                  {
                    %> alert('<fmt:message key="msg.nessun_collegamento_a_facebook_inserito_dal_gestore_"/>') <%
                  }
                  else
                  {
                    if(! facebook.contains("http") )
                      out.print("window.open('http://" + facebook + "')");
                    else
                      out.print("window.open('" + facebook + "')");
                  }
                  %>">
                    <br/>
                  <fmt:message key="btn.vedi_su_facebook"/>
                  </a>
                </div>
              </div>
              <div class="fotoL yellowButton">
                <div id="intastoLink7">
                <a href="#" onclick="<%
                  String flickr = hashbean.get("flickr");
                  if(flickr == null || flickr.contentEquals("-") || flickr.contentEquals(""))
                  {
                    %> alert('<fmt:message key="msg.nessun_collegamento_a_flickr_inserito_dal_gestore_"/>') <%
                  }
                  else
                  {
                    if(! flickr.contains("http") )
                      out.print("window.open('http://" + flickr + "')");
                    else
                      out.print("window.open('" + flickr + "')");
                  }
                  %>">
                    <br/>
                  <fmt:message key="btn.vedi_su_flickr"/>
                  </a>
                </div>
              </div>
              <div class="fotoL pinkButton">
                <div id="intastoLink8">
                <a href="#" onclick="<%
                  if(!JspServiceImpl.getInstance().imagePresent(userId, "20"))
                  {
                    %>
                    alert('<fmt:message key="msg.nessuna_brochure_inserita_dal_gestore_"/>')
                    <%
                  }
                  else
                  {
                  %>
                    location.href='<%=request.getContextPath()%>/View/pdf.jsp?id_azienda=<%=userId %>'
                  <%
                  }
                  %>">
                    <br/>
                  <fmt:message key="btn.scarica_la_brochure"/>
                  </a>
                </div>
              </div>

          </div>




<%-- Anna --%>


			<div style="clear:both; margin-bottom:25px"></div>

                 <% String telefono = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("telefono")); %>
                 <% if (!telefono.equals("")) { %>
			  	     <div class="box_text">
		                <b><fmt:message key="msg.telefono_"/></b>
		                &nbsp;&nbsp;
		                <%= "+39-[0]" + telefono %>
		                &nbsp;
		                <% String telefono2 = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("telefono2")); %>
		                <%= ( telefono2.equals("") ? "" : " / +39-[0]" + telefono2 ) %>
		            </div>
	            <% } %>

                <% String cellulare = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("cellulare")); %>
                <% if (!cellulare.equals("")) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.cellulare_"/></b>
		                &nbsp;&nbsp;
		                <%= "+39-" + cellulare %>
		                &nbsp;
		                <% String cellulare2 = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("cellulare2")); %>
		                <%= ( cellulare2.equals("") ? "" : " / +39-" + cellulare2 ) %>
		            </div>
	            <% } %>

                <% String fax = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("fax")); %>
                <% if (!fax.equals("")) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.fax_"/></b>
		                &nbsp;&nbsp;
		                <%= "+39-[0]" + fax %>
		                &nbsp;
		                <% String fax2 = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("fax2")); %>
		                <%= ( fax2.trim().equals("") ? "" : " / +39-[0]" + fax2 ) %>
		            </div>
				<% } %>

				<% String value = StringUtils.trimToNull(hashbean.get("skype")); %>
				<% if (value != null) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.skype_"/></b>&nbsp;&nbsp;
		                <%= value %>
		            </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("appartamenti")); %>
				<% if (value != null) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.appartamenti_indipendenti_"/></b>&nbsp;&nbsp;
		                <%= value %>
		            </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("numcamere")); %>
				<% if (value != null) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.numero_di_camere_totali"/>:</b>&nbsp;&nbsp;
		                <%= value %>
		            </div>
		        <% } %>

				<% String numlettimin = StringUtils.trimToNull(hashbean.get("numlettimin")); %>
				<% String numlettimax = StringUtils.trimToNull(hashbean.get("numlettimax")); %>
				<% if (numlettimin != null || numlettimax != null) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.numero_di_letti_per_camera_"/></b>&nbsp;&nbsp;
		                <%
		                if( numlettimin != null)
		                {
		                  %> <fmt:message key="msg.da"/> <%= numlettimin %> <%
		                }
		                %>
		                <%
		                if( numlettimax != null)
		                {
		                  %> <fmt:message key="msg.a"/>  <%= numlettimax %> <%
		                }
		                %>
		            </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("numlettitot")); %>
				<% if (value != null) { %>
		            <div class="box_text">
		                <b><fmt:message key="msg.numero_di_letti_totali_"/></b>&nbsp;&nbsp;
		                <%= value %>
		            </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("prezzomedio")); %>
				<% if (value != null) { %>
					<div class="box_text">
			          <b><fmt:message key="msg.tariffa_media_giornaliera_a_persona_"/>&nbsp;&nbsp;</b>
			          <%= "Euro " + value %>
					</div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("prenotazione")); %>
				<% if (value != null) { %>
					<div class="box_text">
			          <b><fmt:message key="msg.prenotazione_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "")  %>
			        </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("pagamento")); %>
				<% if (value != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.pagamento_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "; ") %>
			        </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("posizione")); %>
				<% if (value != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.posizione_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "; ") %>
			        </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("costruzione")); %>
				<% if (value != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.costruzione_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "")  %>
			        </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("camera")); %>
				<% if (value != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.camera_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "; ") %>
			        </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("bagno")); %>
				<% if (value != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.bagno_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "; ") %>
			        </div>
		        <% } %>

				<% value = StringUtils.trimToNull(hashbean.get("tavola")); %>
				<% if (value != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.tavola_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(value, locale, "; ") %>
			        </div>
		        <% } %>

				<% String struttura = StringUtils.trimToNull(hashbean.get("struttura")); %>
				<% String entrokm = StringUtils.trimToNull(hashbean.get("entrokm")); %>
				<% if (struttura != null || entrokm != null) { %>
			        <div class="box_text">
			          <b><fmt:message key="msg.struttura_"/>&nbsp;&nbsp;</b>
			          <%= GetAlloggioDataImpl.getInstance().internationalize(struttura, locale, "; ") %>
			          <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(entrokm) %>
			        </div>
		        <% } %>

				<%
				String kmcapoluogo = zeroToNull(StringUtils.trimToNull(hashbean.get("kmcapoluogo")));
				String nomeesteso = zeroToNull(StringUtils.trimToNull(hashbean.get("nomeesteso")));
				String kmcasello = zeroToNull(StringUtils.trimToNull(hashbean.get("kmcasello")));
				String autostrade = zeroToNull(StringUtils.trimToNull(hashbean.get("autostrade")));
				String kmaeroporto = zeroToNull(StringUtils.trimToNull(hashbean.get("kmaeroporto")));
				String aeroporti = zeroToNull(StringUtils.trimToNull(hashbean.get("aeroporti")));
				String kmstazione = zeroToNull(StringUtils.trimToNull(hashbean.get("kmstazione")));
				String stazioni = zeroToNull(StringUtils.trimToNull(hashbean.get("stazioni")));
				String mtmezzipubblici = zeroToNull(StringUtils.trimToNull(hashbean.get("mtmezzipubblici")));
				%>
				<%
				if (   ( kmcapoluogo != null && nomeesteso != null )
					|| ( kmcasello != null && autostrade != null )
					|| ( kmaeroporto != null && aeroporti != null )
					|| ( kmstazione != null && stazioni != null )
					|| mtmezzipubblici != null	)
				{
				%>
			        <div class="box_text">
			          <b><fmt:message key="msg.distanze_massime_"/>&nbsp;&nbsp;</b>
			          <%
			          if ( kmcapoluogo != null && nomeesteso != null )
			          {
			            %>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(kmcapoluogo) %>
			             <fmt:message key="msg.km_da"/>
			            <%= nomeesteso %>;
			            <%
			          }

			          if ( kmcasello != null && autostrade != null )
			          {
			            %>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(kmcasello) %>
			            <fmt:message key="msg.km_dal_casello_autostradale_della"/>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(autostrade) + ";" %>
			            <%
			          }

			          if ( kmaeroporto != null && aeroporti != null )
			          {
			            %>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(kmaeroporto) %>
			            <fmt:message key="msg.km_dall_aeroporto_di"/>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(aeroporti) + ";" %>
			            <%
			          }

			          if ( kmstazione != null && stazioni != null )
			          {
			            %>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(kmstazione) %>
			            <fmt:message key="msg.km_dalla_stazione_ferroviaria_di"/>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(stazioni) + ";" %>
			            <%
			          }

			          if ( mtmezzipubblici != null )
			          {
			            %>
			            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(mtmezzipubblici) %>
			            <fmt:message key="msg.mt_dai_mezzi_pubblici_"/>
			            <%
			          }
			          %>
			        </div>
		        <% } %>

				<div class="box_text">
				      <%if(StringUtils.isNotEmpty(hashbean.get("latitudine")))
					  {
					  %>
					    <b><fmt:message key="msg.Latitudine_nord_"/></b>&nbsp;<%= hashbean.get("latitudine")%>
					  <%
					  }
					  if(StringUtils.isNotEmpty(hashbean.get("longitudine")))
					  {
					  %>
					    <br/>
					    <br/>
					    <b><fmt:message key="msg.Longitudine_est_"/></b>&nbsp;<%= hashbean.get("longitudine")%>
					  <%
					  }
					  %>

				</div>


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
				<br/><br/>
              </div>


		     <div style="margin: 0 auto; width: 100%; text-align: center">
			  <div id="cartina" style="width:480px; height:360px; display:inline-block"></div>
			  <div id="nomap" style="color:red"></div>
			 </div>

		     <div style="margin: 0 auto; width: 100%; text-align: center">

			  <p class="forButton" style="font-size:9pt">
			    <br/><br/><br/>
			    <button type="submit"
			      <%= (hashbean.get("wwwilmeteo") != null) ? " onclick=\"window.open('http://" + hashbean.get("wwwilmeteo") + "/previsioni-sperimentali');\"" : "" %> >
			      <span class="round"><span> <fmt:message key="btn.meteo_locale"/> </span></span>
			    </button>
			    &nbsp;&nbsp;
			    <button type="submit"
			      <%= (hashbean.get("sito") != null) ? " onclick=\"window.open('http://" + hashbean.get("sito") + "');\"" : "" %> >
			      <span class="round"><span> <fmt:message key="btn.sito_web_regione"/> </span></span>
			    </button>
			    &nbsp;&nbsp;
			    <button type="submit"
			      <%= (hashbean.get("sitoprovincia") != null) ? " onclick=\"window.open('http://" + hashbean.get("sitoprovincia") + "');\"" : "" %> >
			      <span class="round"><span> <fmt:message key="btn.sito_web_provincia"/> </span></span>
			    </button>
			    &nbsp;&nbsp;
			    <button type="submit"
			      <%= (hashbean.get("webistituzionale") != null) ? " onclick=\"window.open('http://" + hashbean.get("webistituzionale") + "');\"" : "" %> >
			      <span class="round"> <span> <fmt:message key="btn.sito_web_comune"/> </span> </span>
			    </button>
			  </p>
			  </div>

		      <div style="margin-top:30px">
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

<div style="margin: 0 auto; width: 305px">
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



		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.scheda1" />
       <jsp:param name="header_text" value="hdr.scheda1" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>