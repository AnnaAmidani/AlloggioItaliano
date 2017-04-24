<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  anna.alit.servicebb.JspServiceImpl,
  anna.alit.beanbb.HashBean,
  anna.alit.servicebb.GetAlloggioDataImpl"
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
  <meta name="description" content="scheda di descrizione delle caratteristiche de <%=tipoesteso %> <%=denominazione %> <%=comune %>  <%=prov %> <%=regione %>" />
  <meta name="keywords" content="<%=tipoesteso %>, <%=denominazione %>,  <%=comune %>,<%=prov %>, <%=regione %>, caratteristiche, camere, posizione, contatti, distanze" />
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
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.scheda1" />
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
                <iframe src="http://www.facebook.com/plugins/like.php?href=<%=thisUrl%>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font=verdana&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px; text-align:right" allowTransparency="true"></iframe>
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
					<td id="current" class="navLblScheda">
						<div class="tab">
							<img src="${pageContext.request.contextPath}/View/img/tab-pink.png"></img>
							<a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda1.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
			  				<b><fmt:message key="msg.caratteristiche_e_servizi_della_struttura"/></b>
							</a>
						</div>
					</td>
					<td id="next1" class="navLblScheda">
						<div class="tab">
							<img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
							<a href="${pageContext.request.contextPath}<%=response.encodeURL("/View/scheda2.jsp?provincia="+sigla+"&comune="+c+"&nome=" + d)%>">
			  				<b><fmt:message key="msg.descrizione_della_struttura"/></b>
							</a>
						</div>
					</td>
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

			<br/><br/>

		  <div class="parent_pane">
		    <div class="left_pane_scheda">
  			  <div>
                <div class="fotoG">
                  <%
                  String userId =  hashbean.get("id");

                  if( JspServiceImpl.getInstance().imagePresent(userId, "01") )
                  {
                  %>
                    <img src="${pageContext.request.contextPath}/View/image.jsp?image=01&id_azienda=<%= userId %>" class="copertina" />
                  <%
                  }
                  %>
                </div>
              </div>

			<br/><br/>

				<div>
		          <%
		          String scontodel = hashbean.get("scontodel");
		          String offertadal = hashbean.get("dal");
		          String offertaal = hashbean.get("al");

		          if(offertadal == null)
		            offertadal = " ";
		          if(offertaal == null)
		            offertaal = " ";

		          if(scontodel == null || scontodel.equals(""))
		          {
		            out.println(" ");
		          }
		          else
		          {
		          %>
		            <img src="<%= context %>/View/img/offerta.gif"/>&nbsp;
		            <font size="5pt"><b><%= scontodel %>%</b></font>
		            &nbsp;<b>&nbsp;<fmt:message key="msg.in_offerta_dal"/>&nbsp;</b><%= offertadal %><b>
		            &nbsp;<fmt:message key="msg.al"/>&nbsp;</b><%= offertaal %>
		          <%
		          }
		          %>
		        </div>

			<br/><br/>

		    </div>

	    <div class="right_pane_scheda">

          <div id="PerLink">

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
                <div class="fotoL fucsiaButton" >
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
              <div class="fotoL">
                 <img src="${pageContext.request.contextPath}/View/img/back_06.png" width="80px" height="80px" title="frecce" border="no-border"/>
              </div>
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
		 </div>
		</div>

               <div style="clear:both"></div>

		  	     <div class="box_text">
	                <b><fmt:message key="msg.telefono_"/></b>
	                &nbsp;&nbsp;
	                <% String telefono = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("telefono")); %>
	                <%= ( telefono.equals("") ? "" : "+39-[0]" + telefono )%>
	                &nbsp;
	                <% String telefono2 = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("telefono2")); %>
	                <%= ( telefono2.equals("") ? "" : " / +39-[0]" + telefono2 ) %>

	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.cellulare_"/></b>
	                &nbsp;&nbsp;
	                <% String cellulare = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("cellulare")); %>
	                <%= ( cellulare.equals("")) ? "" : "+39-" + cellulare %>
	                &nbsp;
	                <% String cellulare2 = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("cellulare2")); %>
	                <%= ( cellulare2.equals("") ? "" : " / +39-" + cellulare2 ) %>


	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.fax_"/></b>
	                &nbsp;&nbsp;
	                <% String fax = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("fax")); %>
	                <%= ( fax.equals("") ? "" : "+39-[0]" + fax )%>
	                &nbsp;
	                <% String fax2 = GetAlloggioDataImpl.getInstance().cleanTelephoneNumber(hashbean.get("fax2")); %>
	                <%= ( fax2.trim().equals("") ? "" : " / +39-[0]" + fax2 ) %>

	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.skype_"/></b>&nbsp;&nbsp;
	                <%= (hashbean.get("skype") != null) ? hashbean.get("skype") : "" %>

	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.appartamenti_indipendenti_"/></b>&nbsp;&nbsp;
	                <%= (hashbean.get("appartamenti") != null) ? hashbean.get("appartamenti") : "" %>

	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.numero_di_camere_totali"/>:</b>&nbsp;&nbsp;
	                <%= (hashbean.get("numcamere") != null) ? hashbean.get("numcamere") : "" %>

	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.numero_di_letti_per_camera_"/></b>&nbsp;&nbsp;
	                <% String numlettimin = hashbean.get("numlettimin"); %>
	                <%
	                if( numlettimin != null && !numlettimin.equals("") )
	                {
	                  %> <fmt:message key="msg.da"/> <%= numlettimin %> <%
	                }
	                %>
	                <% String numlettimax = hashbean.get("numlettimax"); %>
	                <%
	                if( numlettimax != null && !numlettimax.equals("") )
	                {
	                  %> <fmt:message key="msg.a"/>  <%= numlettimax %> <%
	                }
	                %>

	            </div>
	            <div class="box_text">

	                <b><fmt:message key="msg.numero_di_letti_totali_"/></b>&nbsp;&nbsp;
	                <%= (hashbean.get("numlettitot") != null) ? hashbean.get("numlettitot") : "" %>

	            </div>


		          <div class="box_text">
		          <b><fmt:message key="msg.tariffa_media_giornaliera_a_persona_"/>&nbsp;&nbsp;</b>
		          <% String prezzomedio = hashbean.get("prezzomedio"); %>
		          <%= (prezzomedio == null || prezzomedio.equals("")) ? "" : "Euro " + prezzomedio %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.prenotazione_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("prenotazione"), locale, "")  %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.pagamento_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("pagamento"), locale, "; ") %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.posizione_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("posizione"), locale, "; ") %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.costruzione_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("costruzione"), locale, "")  %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.camera_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("camera"), locale, "; ") %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.bagno_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("bagno"), locale, "; ") %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.tavola_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("tavola"), locale, "; ") %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.struttura_"/>&nbsp;&nbsp;</b>
		          <%= GetAlloggioDataImpl.getInstance().internationalize(hashbean.get("struttura"), locale, "; ") %>
		          <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("entrokm")) %>
		          </div><div class="box_text">
		          <b><fmt:message key="msg.distanze_massime_"/>&nbsp;&nbsp;</b>
		          <%

		          String kmcapoluogo = hashbean.get("kmcapoluogo");
		          String nomeesteso = hashbean.get("nomeesteso");
		          if (kmcapoluogo != null && !kmcapoluogo.equals("") && !kmcapoluogo.equals("0"))
		          {
		            %>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("kmcapoluogo")) %>
		             <fmt:message key="msg.km_da"/>
		            <%= nomeesteso %>;
		            <%
		          }

		          String kmcasello = hashbean.get("kmcasello");
		          String autostrade = hashbean.get("autostrade");
		          if( kmcasello != null && !kmcasello.equals("") && !kmcasello.equals("0") &&
		              autostrade != null && !autostrade.equals("") && !autostrade.equals("0") )
		          {
		            %>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("kmcasello")) %>
		            <fmt:message key="msg.km_dal_casello_autostradale_della"/>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("autostrade")) + ";" %>
		            <%
		          }

		          String kmaeroporto = hashbean.get("kmaeroporto");
		          String aeroporti = hashbean.get("aeroporti");
		          if( kmaeroporto != null && !kmaeroporto.equals("") && !kmaeroporto.equals("0") &&
		              aeroporti != null && !aeroporti.equals("") && !aeroporti.equals("0") )
		          {
		            %>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("kmaeroporto")) %>
		            <fmt:message key="msg.km_dall_aeroporto_di"/>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("aeroporti")) + ";" %>
		            <%
		          }

		          String kmstazione = hashbean.get("kmstazione");
		          String stazioni = hashbean.get("stazioni");
		          if( kmstazione != null && !kmstazione.equals("") && !kmstazione.equals("0") &&
		              stazioni != null && !stazioni.equals("") && !stazioni.equals("0") )
		          {
		            %>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("kmstazione")) %>
		            <fmt:message key="msg.km_dalla_stazione_ferroviaria_di"/>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("stazioni")) + ";" %>
		            <%
		          }

		          String mtmezzipubblici = hashbean.get("mtmezzipubblici");
		          if( mtmezzipubblici != null && !mtmezzipubblici.equals("") && !mtmezzipubblici.equals("0") )
		          {
		            %>
		            <%= GetAlloggioDataImpl.getInstance().cleanTheArraystring(hashbean.get("mtmezzipubblici")) %>
		            <fmt:message key="msg.mt_dai_mezzi_pubblici_"/>
		            <%
		          }
		          %>
		          </div>

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
       <jsp:param name="title" value="ttl.scheda1" />
       <jsp:param name="header_text" value="hdr.scheda1" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>