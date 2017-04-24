<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  java.util.*,
  java.text.*,
  anna.alit.beanbb.HashBeanVector,
  anna.alit.beanbb.HashBean,
  anna.alit.servicexhtml.TendineXHTML"
%>
<% String context = request.getContextPath(); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/View/javascript/calendario/skins/aqua/theme.css" type="text/css" media="all" title="Aqua" />
  <style type="text/css">
      div#jsDrop
      {
        float: left;
      }
  </style>
  <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/View/javascript/custominput.js"></script>
  <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/View/javascript/3imm.js"></script>
  <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/View/javascript/disableEnable.js"></script>
  <script type="text/javascript">
  function clearpar(){
    document.getElementById('regione').value='regione';
    document.getElementById('sigla').value='0';
    document.getElementById('comune').value='comune';
    document.getElementById('distretto').value='distretto';
    document.getElementById('denominazione').value='';
    document.getElementById('tipologia').value='qualsiasi';
    document.getElementById('descrizione').value='';
    document.getElementById('prezzomedioDa').value='';
    document.getElementById('prezzomedioA').value='';
    document.getElementById('include').value='qualsiasi';
    document.getElementById('posizione').value='qualsiasi';
    document.getElementById('prenotazione').value='qualsiasi';
    document.getElementById('pagamento').value='qualsiasi';
    document.getElementById('lingue').value='qualsiasi';
    document.getElementById('annofondazione').value='';
  }
  function atLeastOne(){
   //document.getElementById('regione').value == 'regione'
	 //   document.getElementById('sigla').value;
	   // document.getElementById('comune').value;
	    //document.getElementById('distretto').value;
	    //document.getElementById('denominazione').value;
	    //document.getElementById('tipologia').value;
	    //document.getElementById('idirizzo').value;

  }
  </script>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.cercaAlloggio" />
  </jsp:include>
</head>
<body onload="disableAll()">

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
               <fmt:message key="ttl.cercaAlloggio"/>
			   </a>
			 </h2>
			</div>
			<br/>
		      <form name="findalloggio" class="find_alloggio" action="${pageContext.request.contextPath}/RicercaAlloggio" method="post">

	              <div class="find_alloggio">
<%-- 	            <p><b><fmt:message key="msg.PARAMETRI_DI_RICERCA"/></b></p>   --%>
	                <input type="hidden" name="actiontype" value="popola3" />
	                <input type="hidden" name="destinationPage" value="View/cercaAlloggio.jsp" />
		              <div class="title_lbl_1"><fmt:message key="msg.PARAMETRI_DI_RICERCA"/>&nbsp;&nbsp;</div>
						<br/><br/>
	                      <select class="smusso" id="regione" name="regione" title="regione"
	                        onchange="this.form.action='${pageContext.request.contextPath}/Action';this.form.submit();">
	                        <%
	                        String regione = (String) request.getAttribute("regione");
	                        if(regione == null)
	                        {
	                          %> <%= TendineXHTML.optionlistregioni(locale) %> <%
	                        }
	                        else
	                        {
	                          %>
	                          <option value="<%= regione %>" selected="selected"><%= regione %></option>
	                          <%= TendineXHTML.optionlistregioni(locale) %>
	                          <%
	                        }
	                        %>
	                      </select>


	                      <select class="smusso" id="sigla" name="sigla" title="provincia"
	                        onchange="this.form.action='${pageContext.request.contextPath}/Action';this.form.submit();">
	                        <%
	                        HashBeanVector hashResult = (HashBeanVector) request.getAttribute("hashResult");
	                        String sigla = (String) request.getAttribute("sigla");
	                        int size = 0;

	                        if(sigla == null || sigla.equals("0"))
	                        { %> <option value="0" selected="selected"><fmt:message key="opt.provincia"/></option> <% }
	                        else
	                        {
	                          %>
	                          <option value="<%= sigla %>" selected="selected"><%= sigla %></option>
	                          <option value="0"><fmt:message key="opt.provincia"/></option>
	                          <%
	                        }

	                        if(hashResult != null)
	                        {
	                          String[] sigle = hashResult.getAsArray("sigla");
	                          String[] nomeesteso = hashResult.getAsArray("nomeesteso");
	                          size = (sigle != null && nomeesteso != null)? sigle.length : 0;
	                          for(int i = 0; i < size; i++)
	                          {
	                            %> <option value="<%= sigle[i] %>"><%= nomeesteso[i] %> </option> <%
	                          }
	                        }
	                        %>
	                      </select>


	                      <select class="smusso" id="comune" name="comune" title="comune" onchange="document.getElementById('distretto').disabled=true;">
	                        <option value="comune" selected="selected" ><fmt:message key="opt.comune"/></option>
	                        <%
	                        if(hashResult != null)
	                        {
	                          String[] comune = hashResult.getAsArray("comune");
	                          size = (comune != null)? comune.length : 0;
	                          for(int i = 0; i < size; i++)
	                          {
	                            %> <option value="<%= comune[i]  %>"><%= comune[i] %></option> <%
	                          }
	                        }
	                        %>
	                      </select>


	                      <select class="smusso" id="distretto" name="distretto" title="distretto" onchange="document.getElementById('comune').disabled=true;" >
	                        <option value="distretto" selected="selected"><fmt:message key="opt.distretto"/></option>
	                        <%
	                        if(hashResult != null)
	                        {
	                          String[] distretto = hashResult.getAsArray("distretto");
	                          size = (distretto != null)? distretto.length : 0;
	                          for(int i = 0; i < size; i++)
	                          {
	                            %> <option value="<%= distretto[i] %>"><%= distretto[i] %></option> <%
	                          }
	                        }
	                        %>
	                      </select>
	                    <br/>
	                  <br/>
<%-- 		              <div class="title_lbl_1"><fmt:message key="prm.parola_chiave"/></div>
		              <hr class="title_under" />		--%>

					  <div class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.indirizzo"/></b></div>
					    <div class="right_pane"><input type="text" size="30" class="smusso" id="indirizzo" name="indirizzo"/></div>
					  </div>
					  <div class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="opt.nelladenominazione"/></b></div>
					    <div class="right_pane"><input type="text" size="30" class="smusso" id="denominazione" name="denominazione"/></div>
					  </div>
<%--					  <div class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="opt.descrizionekey"/></b></div>
					    <div class="right_pane"><input type="text" size="30" class="smusso" id="descrizione" name="descrizione"/></div>
					  </div>
 --%>
<%--					  <div class="title_lbl_1"><fmt:message key="prm.altro"/></div>
		              <hr class="title_under" />

 				  <div class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.tariffa"/></b></div>
					    <div class="right_pane">
	                      <fmt:message key="prm.da"/>&nbsp;<input id="prezzomedioDa" name="prezzomedioDa" size="11" type="text" class="smusso"/>&nbsp;&nbsp;
	                      <fmt:message key="prm.a"/>&nbsp;<input id="prezzomedioA" name="prezzomedioA" size="11" type="text" class="smusso"/>
						</div>
					  </div> --%>
					  <div class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.tipologia"/></b></div>
					    <div class="right_pane"><%= TendineXHTML.selecttipologia(locale) %></div>
					  </div>

<!-- hidden value -->
					  <div style="display:none" class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.trattamento"/></b></div>
					    <div class="right_pane">
	                      <select class="smusso" id="include" name="include" title="trattamento">
	                        <option value="qualsiasi" selected="selected"><fmt:message key="opt.qualsiasi"/></option>
	                        <option value="solo pernottamento"><fmt:message key="opt.solo_pernottamento"/></option>
	                        <option value="prima colazione"><fmt:message key="opt.prima_colazione"/></option>
	                      </select>
					    </div>
					  </div>
<!-- hidden value -->
					  <div style="display:none" class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.posizione"/></b></div>
					    <div class="right_pane">
	                      <select class="smusso" id="posizione" name="posizione" title="posizione">
	                        <option value="qualsiasi" selected="selected"><fmt:message key="opt.qualsiasi"/></option>
	                        <option value="mare"><fmt:message key="opt.mare"/></option>
	                        <option value="collina"><fmt:message key="opt.collina"/></option>
	                        <option value="montagna"><fmt:message key="opt.montagna"/></option>
	                        <option value="pianura"><fmt:message key="opt.pianura"/></option>
	                        <option value="campagna"><fmt:message key="opt.campagna"/></option>
	                        <option value="citta"><fmt:message key="opt.citta"/></option>
	                        <option value="lago"><fmt:message key="opt.lago"/></option>
	                      </select>
					    </div>
					  </div>

<!-- hidden value -->
					  <div style="display:none" class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.prenotazione"/></b></div>
					    <div class="right_pane">
	                      <select class="smusso" id="prenotazione" name="prenotazione" title="prenotazione">
	                        <option value="qualsiasi" selected="selected"><fmt:message key="opt.qualsiasi"/></option>
	                        <option value="con caparra"><fmt:message key="opt.con_caparra"/></option>
	                        <option value="senza caparra"><fmt:message key="opt.senza_caparra"/></option>
	                      </select>
					    </div>
					  </div>

<!-- hidden value -->
					  <div style="display:none" class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.pagamento"/></b></div>
					    <div class="right_pane"><%= TendineXHTML.selectpagamento(locale) %></div>
					  </div>
<!-- hidden value -->
					  <div style="display:none" class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.lingua_compresa"/></b></div>
					    <div class="right_pane"><%= TendineXHTML.selectlingue(locale) %></div>
					  </div>
<!-- hidden value -->
					  <div style="display:none" class="parent_pane">
					    <div class="left_pane"><b><fmt:message key="prm.anno_fondazione"/></b></div>
					    <div class="right_pane"><input id="annofondazione" name="annofondazione" type="text" size="30" class="smusso"/></div>
					  </div>

                    <br/><br/>

		                  <p align="center">
		                    <button id="simplesearch" type="submit">
		                      <span class="round_170"><span><fmt:message key="btn.effettua_la_ricerca"/></span></span>
		                    </button>
<%--		                <button type="button" onclick="clearpar();">
		                      <span class="round_170"><span><fmt:message key="btn.reset_parametri"/></span></span>
		                    </button>   --%>
		                    <span style="display:none;">
		                    <br/><br/><br/>
		                      <b><fmt:message key="btn.ricerca_avanzata"/></b>
	                         <br/><br/>
                     	      <img width="10%" style="cursor:pointer;cursor:hand" onclick="document.getElementById('advanced').style.display='block';" src="${pageContext.request.contextPath}/View/img/down_arrow_2.png"/>
						     <br/><br/>
						     </span>
		                  </p>
		              </div>

<br/><br/>
<br/><br/>

<div style="margin:0 auto; width: 730px">
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- alit_1_2014 -->
<ins class="adsbygoogle"
style="display:inline-block;width:728px;height:90px"
data-ad-client="ca-pub-6541445756952525"
data-ad-slot="2791056958"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>
<%--
		              <div id="advanced" style="display:none">
                       <input type="hidden" name="folder" value="${pageContext.request.contextPath}/View/img/" />
	        	        <p><b><fmt:message key="msg.LEGENDA"/></b><br/>
		                  <img src="${pageContext.request.contextPath}/View/img/indiff.png" alt="indifferente" width="18" height="18"/> = <fmt:message key="msg.Indifferente"/><br/>
		                  <img src="${pageContext.request.contextPath}/View/img/si.png" alt="richiesto" width="18" height="18"/> = <fmt:message key="msg.Richiesto"/><br/>
		                  <img src="${pageContext.request.contextPath}/View/img/no.png" alt="indesiderato" width="18" height="18"/> = <fmt:message key="msg.Indesiderato"/>
		                </p>

						<div class="grandparent_pane">
						  <div class="parent_pane_opt" style="border-top:1pt solid silver">
						    <div class="left_pane_opt">
		                        <img name="q0" onclick="clicktest(0)" src="${pageContext.request.contextPath}/View/img/indiff.png" width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.ingresso_indipendente"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q1" onclick="clicktest(1)" src="${pageContext.request.contextPath}/View/img/indiff.png" width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.ascensore"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q2" onclick="clicktest(2)" src="${pageContext.request.contextPath}/View/img/indiff.png" width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.parcheggio_privato"/><br/>
		                        <select class="smusso" name="parcheggio" id="parcheggio" title="parcheggio">
		                          <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                          <option value="coperto"><fmt:message key="opt.coperto"/></option>
		                          <option value="scoperto"><fmt:message key="opt.scoperto"/></option>
		                          <option value="garage"><fmt:message key="opt.garage"/></option>
		                        </select>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q4" onclick="clicktest(4)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.riscaldamento_autonomo"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q3" onclick="clicktest(3)" src="${pageContext.request.contextPath}/View/img/indiff.png" width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.aria_condizionata"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q5" onclick="clicktest(5)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.appartamento_indipendente"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q6" onclick="clicktest(6)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.camere_totali"/>
		                      <br/>
		                        <input name="numcamere" id="numcamere" type="text" size="2" class="smusso"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q7" onclick="clicktest(7)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.letti_per_camera"/>
		                        <br/>
		                          <fmt:message key="prm.da"/>
		                          <input name="numlettimin" id="numlettimin" type="text" size="2" class="smusso"/>
		                          <fmt:message key="prm.a"/>
		                          <input name="numlettimax" id="numlettimax" type="text" size="2" class="smusso"/>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q8" onclick="clicktest(8)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.letto_matrimoniale"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                          <img name="q9" onclick="clicktest(9)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.aggiunta_letto"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q10" onclick="clicktest(10)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.camera_con_soggiorno"/>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q11" onclick="clicktest(11)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.angolo_cottura"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                          <img name="q12" onclick="clicktest(12)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.bar_in_camera"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q13" onclick="clicktest(13)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.frigo_in_camera"/>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q14" onclick="clicktest(14)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.cassaforte_in_camera"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                          <img name="q15" onclick="clicktest(15)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.telefono_in_camera"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q16" onclick="clicktest(16)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.tv_in_camera"/>
		                          <br/>
		                          <select class="smusso" name="tv" id="tv" title="tv" >
		                            <option selected="selected">qualsiasi</option>
		                            <option value="vhs">con vhs</option>
		                            <option value="dvd">con dvd</option>
		                            <option value="satellitare">con satellitare</option>
		                          </select>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q17" onclick="clicktest(17)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.internet_in_camera"/>
		                        <br/>
		                          <select class="smusso" name="internet" id="internet" title="internet" >
		                            <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                            <option value="analogico"><fmt:message key="opt.analogico"/></option>
		                            <option value="isdn"><fmt:message key="opt.isdn"/></option>
		                            <option value="adsl"><fmt:message key="opt.adsl"/></option>
		                            <option value="fibra ottica"><fmt:message key="opt.fibra_ottica"/></option>
		                            <option value="wifi"><fmt:message key="opt.wifi"/></option>
		                          </select>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                          <img name="q18" onclick="clicktest(18)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.servizio_fax"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q19" onclick="clicktest(19)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.servizio_computer"/>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q20" onclick="clicktest(20)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.bagno"/>
		                        <br/>
		                          <select class="smusso" name="bagno" id="bagno" title="bagno" >
		                            <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                            <option value="in comune"><fmt:message key="opt.in_comune"/></option>
		                            <option value="in stanza"><fmt:message key="opt.in_stanza"/></option>
		                          </select>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                          <img name="q21" onclick="clicktest(21)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.doccia"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q22" onclick="clicktest(22)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.vasca"/>
		                        <br/>
		                          <select class="smusso" name="con vasca" id="con vasca" title="vasca" >
		                            <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                            <option value="normale"><fmt:message key="opt.normale"/></option>
		                            <option value="idromassaggio"><fmt:message key="opt.idromassaggio"/></option>
		                          </select>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q23" onclick="clicktest(23)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.phon_in_bagno"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                          <img name="q24" onclick="clicktest(24)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.fornitura_asciugamani"/>
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q25" onclick="clicktest(25)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.fornitura_biancheria"/>
						    </div>
						    <div class="right_pane_opt">
		                          <img name="q26" onclick="clicktest(26)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.servizio_lavanderia"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
						    </div>
						    <div class="middle_pane_opt">
		                          <img name="q27" onclick="clicktest(27)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                            width="18" height="18" border="0" alt="3options"/>
		                          <fmt:message key="prm.colazione"/>
		                        <br/>
		                           <select class="smusso" name="colazione" id="colazione" title="colazione" >
		                            <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                            <option value="al tavolo"><fmt:message key="opt.al_tavolo"/></option>
		                            <option value="a buffet"><fmt:message key="opt.a_buffet"/></option>
		                            <option value="cam"><fmt:message key="opt.in_camera"/></option>
		                          </select>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q28" onclick="clicktest(28)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.menu"/>
		                      <br/>
		                        <select class="smusso" name="menu" id="menu" title="menu">
		                          <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                          <option value="tradizionale"><fmt:message key="opt.tradizionale"/></option>
		                          <option value="continentale"><fmt:message key="opt.continentale"/></option>
		                          <option value="biologica"><fmt:message key="opt.biologica"/></option>
		                          <option value="kasher"><fmt:message key="opt.kasher"/></option>
		                          <option value="vegetariana"><fmt:message key="opt.vegetariana"/></option>
		                          <option value="vegan"><fmt:message key="opt.vegan"/></option>
		                          <option value="celiaci"><fmt:message key="opt.celiaci"/></option>
		                        </select>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q29" onclick="clicktest(29)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.servizio_telefonico"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q30" onclick="clicktest(30)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.servizio_ristorazione"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q31" onclick="clicktest(31)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.balcone"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q32" onclick="clicktest(32)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.giardino"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q33" onclick="clicktest(33)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.terrazza"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q34" onclick="clicktest(34)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.parco"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q35" onclick="clicktest(35)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.palestra"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q36" onclick="clicktest(36)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.tennis"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q37" onclick="clicktest(37)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.ping_pong"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q38" onclick="clicktest(38)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.biliardo"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q39" onclick="clicktest(39)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.piscina"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q40" onclick="clicktest(40)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.attrezzato_disabili"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q41" onclick="clicktest(41)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.servizio_babysitter"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q42" onclick="clicktest(42)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.animali_accettati"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q43" onclick="clicktest(43)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.vista_panoramica"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q44" onclick="clicktest(44)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.servizio_escursioni"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q45" onclick="clicktest(45)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.servizio_visite_culturali"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q47" onclick="clicktest(47)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.noleggio_mezzi"/>
		                      <br/>
		                        <select class="smusso" name="noleggio" id="noleggio" title="noleggio mezzi">
		                          <option selected="selected"><fmt:message key="opt.qualsiasi"/></option>
		                          <option value="bici"><fmt:message key="opt.bici"/></option>
		                          <option value="moto"><fmt:message key="opt.moto"/></option>
		                          <option value="auto"><fmt:message key="opt.auto"/></option>
		                        </select>
		                      <br/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q48" onclick="clicktest(48)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.sauna"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q49" onclick="clicktest(49)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.bagno_turco"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q50" onclick="clicktest(50)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.maneggio"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q51" onclick="clicktest(51)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.informazioni_turistiche"/>
						    </div>
						    <div class="middle_pane_opt">
		                        <img name="q52" onclick="clicktest(52)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.servizio_navetta_gratuita"/>
						    </div>
						    <div class="right_pane_opt">
		                        <img name="q53" onclick="clicktest(53)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.distanza_dal_capoluogo"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                        <img name="q54" onclick="clicktest(54)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                          width="18" height="18" border="0" alt="3options"/>
		                        <fmt:message key="prm.aeroporto_entro_km"/>
		                      <br/>
		                        <input name="kmaeroporto" id="kmaeroporto" type="text" size="4" class="smusso"/>
						    </div>
						    <div class="middle_pane_opt">
		                      <img name="q55" onclick="clicktest(55)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                        width="18" height="18" border="0" alt="3options"/>
		                      <fmt:message key="prm.stazione_entro_km"/>
		                    <br/>
		                      <input name="kmstazione" id="kmstazione" type="text" size="4" class="smusso"/>
						    </div>
						    <div class="right_pane_opt">
		                      <img name="q56" onclick="clicktest(56)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                        width="18" height="18" border="0" alt="3options"/>
		                      <fmt:message key="prm.casello_entro_km"/>
		                    <br/>
		                      <input name="kmcasello" id="kmcasello" type="text" size="4" class="smusso"/>
						    </div>
						  </div>
						  <div class="parent_pane_opt">
						    <div class="left_pane_opt">
		                      <img name="q57" onclick="clicktest(57)" src="${pageContext.request.contextPath}/View/img/indiff.png"
		                        width="18" height="18" border="0" alt="3options"/>
		                      <fmt:message key="prm.mezzi_pubblici_entro_mt"/>
		                    <br/>
		                      <input name="mtmezzipubblici" id="mtmezzipubblici" type="text" size="4" class="smusso"/>
						    </div>
						    <div class="middle_pane_opt">
		                      <%
		                      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		                      String data = sdf.format(new Date());
		                      %>
		                      <input type="checkbox" id="dal" name="dal" value="<%=data %>"/>
		                      <fmt:message key="prm.in_offerta_speciale_ora"/>
						    </div>
						    <div class="right_pane_opt">
						    </div>
						  </div>

						</div>
		                <div id="jsDrop">
		                </div>
					<p align="center"><br/>
                      <button id="clickandgo" onclick="writeDrop()" type="submit" >
                        <span class="round_170">
                          <span><fmt:message key="btn.effettua_la_ricerca"/></span>
                        </span>
                      </button>
                    <br/><br/>
					<img width="10%" style="cursor:pointer;cursor:hand" onclick="document.getElementById('advanced').style.display='none';" src="${pageContext.request.contextPath}/View/img/up_arrow_2.png"/>
					<br/><br/>
                    </p>
		              </div> --%>
			  <br/>
		     </form>
		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.cercaAlloggio" />
       <jsp:param name="header_text" value="hdr.cerca_alloggio_1" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>


