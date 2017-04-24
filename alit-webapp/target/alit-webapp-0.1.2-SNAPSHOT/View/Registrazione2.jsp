<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  response.sendRedirect(request.getContextPath() + response.encodeURL("doLog.jsp"));
}
%>
<%@ page import="
  java.util.ArrayList,
  anna.alit.beanbb.HashBean,
  anna.alit.beanbb.HashBeanVector,
  anna.alit.servicebb.FormServiceImpl"
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/View/css-ai/spot.css" type="text/css" media="all" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/View/javascript/calendario/skins/aqua/theme.css" type="text/css" media="all" title="Aqua" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/custominput.js"></script>  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/forCheckBoxes.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/calendario/calendar.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/calendario/calendar-it.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/calendario/cal.js"></script>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.Registrazione2" />
  </jsp:include>
</head>
<body>
<% String context = request.getContextPath(); %>
<% Integer idLoggato = (Integer) session.getAttribute("idLoggato"); %>
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
               <fmt:message key="ttl.Registrazione2"/>
			   </a>
			 </h2>
			</div>
          <br/><br/>
	     <jsp:include page="snippets/navmenu_registrazione.jsp">
	        <jsp:param name="idLoggato" value="<%= idLoggato %>" />
	        <jsp:param name="registrazione" value="2" />
	      </jsp:include>

        <%
        HashBean beanLoggato = FormServiceImpl.getInstance().updateBeanLoggato(request);
        %>
        <form name="insertdati" id="insertdati" class="reg1" action="" method="post">

          <div id="sel1" class="hr_top">
          <br/>
            <table class="last_" id="ccc" class="controls">
              <tr>
                <td width="68px"><b>camera</b></td>
                <td>
                  <%
                  String camera = beanLoggato.get("camera");
                  if(camera == null)
                    camera = "";
                  %>
                  <input name="camera"  type="checkbox" class="styled"  value="aria condizionata"
                    <% if (camera.contains("aria condizionata")) out.print("checked=\"checked\""); %>/>
                  aria condizionata
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="riscaldamento autonomo"
                    <% if (camera.contains("riscaldamento autonomo")) out.print("checked=\"checked\""); %>/>
                  riscaldamento autonomo
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="letto matrimoniale"
                    <% if (camera.contains("letto matrimoniale")) out.print("checked=\"checked\""); %>/>
                  letto matrimoniale
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="fornitura biancheria"
                    <% if (camera.contains("fornitura biancheria")) out.print("checked=\"checked\""); %>/>
                  fornitura biancheria
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="aggiunta letto-divano"
                    <% if (camera.contains("aggiunta letto-divano")) out.print("checked=\"checked\""); %>/>
                  aggiunta letto-divano
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="angolo cottura"
                    <% if (camera.contains("angolo cottura")) out.print("checked=\"checked\""); %>/>
                  angolo cottura
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="bar in camera"
                    <% if (camera.contains("bar in camera")) out.print("checked=\"checked\""); %>/>
                  bar in camera
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="frigo in camera"
                    <% if (camera.contains("frigo in camera")) out.print("checked=\"checked\""); %>/>
                  frigo in camera
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="cassaforte in camera"
                    <% if (camera.contains("cassaforte in camera")) out.print("checked=\"checked\""); %>/>
                  cassaforte in camera
                </td>
                </tr><tr>
                <td></td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="telefono in camera"
                    <% if (camera.contains("telefono in camera")) out.print("checked=\"checked\""); %>/>
                  telefono in camera
                </td>
                <td colspan="2">
                  <input name="camera"  type="checkbox" class="styled"  value="camera con soggiorno"
                    <% if (camera.contains("camera con soggiorno")) out.print("checked=\"checked\""); %>/>
                  camera con soggiorno
                </td>
                </tr><tr>
                <td></td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="balcone"
                    <% if (camera.contains("balcone")) out.print("checked=\"checked\""); %>/>
                  balcone
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="terrazza"
                    <% if (camera.contains("terrazza")) out.print("checked=\"checked\""); %>/>
                  terrazza
                </td>
                <td>
                  <input name="camera"  type="checkbox" class="styled"  value="vista panoramica"
                    <% if (camera.contains("vista panoramica")) out.print("checked=\"checked\""); %>/>
                  vista panoramica
                </td>
              </tr>
              <tr>
                <td></td>
                <td onclick="check();">
                  <input name="camera"  type="checkbox" class="styled" value="tv in camera"
                    <% if (camera.contains("tv in camera")) out.print("checked=\"checked\""); %>/>
                  tv in camera:
                </td>
                <td>
                  <div id="x1" style="visibility:hidden" >
                    <input name="camera"  type="checkbox" class="styled" value="con vhs"
                      <% if (camera.contains("con vhs")) out.print("checked=\"checked\""); %>/>
                    con vhs
                  </div>
                </td>
                <td>
                  <div id="x2" style="visibility:hidden">
                    <input name="camera"  type="checkbox" class="styled" value="con dvd"
                      <% if (camera.contains("con dvd")) out.print("checked=\"checked\""); %>/>
                    con dvd
                  </div>
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <div id="x3" style="visibility:hidden">
                    <input name="camera"  type="checkbox" class="styled" value="con satellitare"
                      <% if (camera.contains("con satellitare")) out.print("checked=\"checked\""); %>/>
                    con satellitare
                  </div>
                </td>
                <td colspan="2">
                </td>
              </tr>
              <tr>
                <td></td>
                <td onclick="check2();">
                  <input name="camera"  type="checkbox" class="styled"  value="internet in camera"
                    <% if (camera.contains("internet in camera")) out.print("checked=\"checked\""); %>/>
                  internet in camera:
                </td>
                <td>
                  <div id="x4" style="visibility:hidden">
                    <input name="camera"  type="checkbox" class="styled"  value="analogico"
                      <% if (camera.contains("analogico")) out.print("checked=\"checked\""); %>/>
                    analogico
                  </div>
                </td>
                <td>
                  <div id="x5" style="visibility:hidden" >
                    <input name="camera"  type="checkbox" class="styled"  value="isdn"
                      <% if (camera.contains("isdn")) out.print("checked=\"checked\""); %>/>
                    isdn
                  </div>
                </td>
                </tr><tr>
                <td></td>
                <td>
                  <div id="x6" style="visibility:hidden" >
                    <input name="camera"  type="checkbox" class="styled"  value="adsl"
                      <% if (camera.contains("adsl")) out.print("checked=\"checked\""); %>/>
                    adsl
                  </div>
                </td>
                <td>
                  <div id="x7" style="visibility:hidden" >
                    <input name="camera"  type="checkbox" class="styled"  value="fibra ottica"
                      <% if (camera.contains("fibra ottica")) out.print("checked=\"checked\""); %>/>
                    fibra ottica
                  </div>
                </td>
                <td>
                  <div id="x8" style="visibility:hidden" >
                    <input name="camera"  type="checkbox" class="styled"  value="wifi"
                      <% if (camera.contains("wifi")) out.print("checked=\"checked\""); %>/>
                    wifi
                  </div>
                </td>
              </tr>
            </table>
          </div>

          <div id="sel2" class="hr_top">
            <table class="last_" class="controls">
              <tr>
                <td width="68px"><b>bagno</b></td>
                <%
                String bagno = beanLoggato.get("bagno");
                if(bagno == null)
                  bagno = "";
                %>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="in comune"
                    <% if (bagno.contains("in comune")) out.print("checked=\"checked\""); %>/>
                  in comune
                </td>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="in camera"
                    <% if (bagno.contains("in camera")) out.print("checked=\"checked\""); %>/>
                  in camera
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="con doccia"
                    <% if (bagno.contains("con doccia")) out.print("checked=\"checked\""); %>/>
                  con doccia
                </td>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="con vasca"
                    <% if (bagno.contains("con vasca")) out.print("checked=\"checked\""); %>/>
                  con vasca
                </td>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="con idromassaggio"
                    <% if (bagno.contains("con idromassaggio")) out.print("checked=\"checked\""); %>/>
                  con idromassaggio
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="fornitura asciugamani"
                    <% if (bagno.contains("fornitura asciugamani")) out.print("checked=\"checked\""); %>/>
                  fornitura asciugamani
                </td>
                <td>
                  <input name="bagno"  type="checkbox" class="styled"  value="phon in bagno"
                    <% if (bagno.contains("phon in bagno")) out.print("checked=\"checked\""); %>/>
                  phon in bagno
                </td>
              </tr>
            </table>
          </div>

          <div id="sel3" class="hr_top">
            <table class="last_" class="controls">
              <tr>
                <td><b>tavola</b></td>
                <%
                String tavola = beanLoggato.get("tavola");
                if(tavola == null)
                  tavola = "";
                %>
                <td colspan="2">
                  <input name="tavola"  type="checkbox" class="styled"  value="colazione al tavolo"
                    <% if (tavola.contains("colazione al tavolo")) out.print("checked=\"checked\""); %>/>
                  colazione al tavolo
                </td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="colazione a buffet"
                    <% if (tavola.contains("colazione a buffet")) out.print("checked=\"checked\""); %>/>
                  colazione a buffet
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="colazione in camera"
                    <% if (tavola.contains("colazione in camera")) out.print("checked=\"checked\""); %>/>
                  colazione in camera
                </td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="tradizionale"
                    <% if (tavola.contains("tradizionale")) out.print("checked=\"checked\""); %>/>
                  tradizionale
                </td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="continentale"
                    <% if (tavola.contains("continentale")) out.print("checked=\"checked\""); %>/>
                  continentale
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="biologica"
                    <% if (tavola.contains("biologica")) out.print("checked=\"checked\""); %>/>
                  biologica
                </td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="kasher"
                    <% if (tavola.contains("kasher")) out.print("checked=\"checked\""); %>/>
                  kasher
                </td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="vegetariana"
                    <% if (tavola.contains("vegetariana")) out.print("checked=\"checked\""); %>/>
                  vegetariana
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="tavola"  type="checkbox" class="styled"  value="vegan"
                    <% if (tavola.contains("vegan")) out.print("checked=\"checked\""); %>/>
                  vegan
                </td>
                <td colspan="2">
                  <input name="tavola"  type="checkbox" class="styled"  value="celiaci"
                    <% if (tavola.contains("celiaci")) out.print("checked=\"checked\""); %>/>
                  celiaci
                </td>
              </tr>
            </table>
          </div>

          <div id="sel4" class="hr_top">
            <table class="last_" class="controls">
              <tr>
                <td><b>struttura</b></td>
                <%
                String struttura = beanLoggato.get("struttura");
                if(struttura == null)
                  struttura = "";
                %>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="ingresso indipendente"
                    <% if (struttura.contains("ingresso indipendente")) out.print("checked=\"checked\""); %>/>
                  ingresso indipendente
                </td>
                <td onclick="check3();">
                  <input name="struttura"  type="checkbox" class="styled"  value="parcheggio privato"
                    <% if (struttura.contains("parcheggio privato")) out.print("checked=\"checked\""); %>/>
                  parcheggio privato:
                </td>
                <td>
                  <div id="x9" style="visibility:hidden">
                    <input name="struttura"  type="checkbox" class="styled"  value="coperto"
                      <% if (struttura.contains("coperto")) out.print("checked=\"checked\""); %>/>
                    coperto
                  </div>
                </td>
                <td>
                  <div id="x11" style="visibility:hidden">
                    <input name="struttura"  type="checkbox" class="styled"  value="scoperto"
                      <% if (struttura.contains("scoperto")) out.print("checked=\"checked\""); %>/>
                    scoperto
                  </div>
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <div id="xGa" style="visibility:hidden">
                    <input name="struttura"  type="checkbox" class="styled"  value="garage"
                      <% if (struttura.contains("garage")) out.print("checked=\"checked\""); %>/>
                    garage
                  </div>
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio fax"
                    <% if (struttura.contains("servizio fax")) out.print("checked=\"checked\""); %>/>
                  servizio fax
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio computer"
                    <% if (struttura.contains("servizio computer")) out.print("checked=\"checked\""); %>/>
                  servizio computer
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio telefonico"
                    <% if (struttura.contains("servizio telefonico")) out.print("checked=\"checked\""); %>/>
                  servizio telefonico
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="con ascensore"
                    <% if (struttura.contains("con ascensore")) out.print("checked=\"checked\""); %>/>
                  con ascensore
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="attrezzato disabili"
                    <% if (struttura.contains("attrezzato disabili")) out.print("checked=\"checked\""); %>/>
                  attrezzato disabili
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio babysitter"
                    <% if (struttura.contains("servizio babysitter")) out.print("checked=\"checked\""); %>/>
                  servizio babysitter
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio ristorazione"
                    <% if (struttura.contains("servizio ristorazione")) out.print("checked=\"checked\""); %>/>
                  servizio ristorazione
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio lavanderia"
                    <% if (struttura.contains("servizio lavanderia")) out.print("checked=\"checked\""); %>/>
                  servizio lavanderia
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="animali accettati"
                    <% if (struttura.contains("animali accettati")) out.print("checked=\"checked\""); %>/>
                  animali accettati
                </td>
              </tr>
              <tr>
                <td></td>
                <td onclick="check4();">
                  <input name="struttura"  type="checkbox" class="styled"  value="noleggio mezzi"
                    <% if (struttura.contains("noleggio mezzi")) out.print("checked=\"checked\""); %>/>
                  noleggio mezzi:
                </td>
                <td>
                  <div id="x12" style="visibility:hidden">
                    <input name="struttura"  type="checkbox" class="styled"  value="bici"
                      <% if (struttura.contains("bici")) out.print("checked=\"checked\""); %>/>
                    bici
                  </div>
                </td>
                <td>
                  <div id="x13" style="visibility:hidden">
                    <input name="struttura"  type="checkbox" class="styled"  value="moto"
                      <% if (struttura.contains("moto")) out.print("checked=\"checked\""); %>/>
                    moto
                  </div>
                </td>
                <td>
                  <div id="x14" style="visibility:hidden">
                    <input name="struttura"  type="checkbox" class="styled"  value="auto"
                      <% if (struttura.contains("auto")) out.print("checked=\"checked\""); %>/>
                    auto
                  </div>
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="giardino"
                    <% if (struttura.contains("giardino")) out.print("checked=\"checked\""); %>/>
                  giardino
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="parco"
                    <% if (struttura.contains("parco")) out.print("checked=\"checked\""); %>/>
                  parco
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="piscina"
                    <% if (struttura.contains("piscina")) out.print("checked=\"checked\""); %>/>
                  piscina
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="sauna"
                    <% if (struttura.contains("sauna")) out.print("checked=\"checked\""); %>/>
                  sauna
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="bagno turco"
                    <% if (struttura.contains("bagno turco")) out.print("checked=\"checked\""); %>/>
                  bagno turco
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="palestra"
                    <% if (struttura.contains("palestra")) out.print("checked=\"checked\""); %>/>
                  palestra
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="tennis"
                    <% if (struttura.contains("tennis")) out.print("checked=\"checked\""); %>/>
                  tennis
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="ping pong"
                    <% if (struttura.contains("ping pong")) out.print("checked=\"checked\""); %>/>
                  ping pong
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="biliardo"
                    <% if (struttura.contains("biliardo")) out.print("checked=\"checked\""); %>/>
                  biliardo
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="maneggio"
                    <% if (struttura.contains("maneggio")) out.print("checked=\"checked\""); %>/>
                  maneggio
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="informazioni turistiche"
                    <% if (struttura.contains("informazioni turistiche")) out.print("checked=\"checked\""); %>/>
                  informazioni turistiche
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio visite culturali"
                    <% if (struttura.contains("servizio visite culturali")) out.print("checked=\"checked\""); %>/>
                  servizio visite culturali
                </td>
                <td>
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio escursioni"
                    <% if (struttura.contains("servizio escursioni")) out.print("checked=\"checked\""); %>/>
                  servizio escursioni
                </td>
                <td colspan="2">
                  <input name="struttura"  type="checkbox" class="styled"  value="servizio navetta gratuita entro km"
                    <% if (struttura.contains("servizio navetta gratuita entro km")) out.print("checked=\"checked\""); %>/>
                  servizio navetta gratuita entro km:
                  <input id="entrokm" name="entrokm" title="km" type="text" class="smusso" size="4"
                    <%
                    String entrokm = beanLoggato.get("entrokm");
                    if(entrokm != null){
                      out.println("value=\"" + entrokm + "\"");
                    }
                    %>
                  />
                </td>
              </tr>
            </table>
          </div>

          <div id="sela" class="hr_top">
            <table class="last_" class="controls">
              <tr>
                <td><b>durata minima</b></td>
                <td>
                  <input id="duratamin" name="duratamin" title="durata minima in notti" type="text" class="smusso" size="4"
                    <%
                    String duratamin = beanLoggato.get("duratamin");
                    if(duratamin != null){
                      out.println("value=\"" + duratamin + "\"");
                    }
                    %>
                  />
                  notti
                </td>
              </tr>
              <tr>
                <td><b>il prezzo include</b></td>
                <td>
                  <%
                  String include = beanLoggato.get("include");
                  if(include == null)
                    include = "";
                  %>
                  <input id="include" name="include" type="radio" class="styled" value="solo pernottamento"
                    <% if (include.equals("solo pernottamento")) out.print("checked=\"checked\""); %>/>
                  solo pernottamento
                </td>
                <td>
                  <input id="include" name="include"  type="radio" class="styled" value="prima colazione"
                    <% if (include.equals("prima colazione")) out.print("checked=\"checked\""); %>/>
                  prima colazione
                </td>
              </tr>
              <tr>
                <td><b>prenotazione</b></td>
                <td>
                  <%
                  String prenotazione = beanLoggato.get("prenotazione");
                  if(prenotazione == null)
                    prenotazione = "";
                  %>
                  <input id="prenotazione" name="prenotazione" type="radio" class="styled" value="con caparra"
                    <% if (prenotazione.equals("con caparra")) out.print("checked=\"checked\""); %>/>
                  con caparra
                </td>
                <td>
                  <input id="prenotazione" name="prenotazione" type="radio" class="styled" value="senza caparra"
                    <% if (prenotazione.equals("senza caparra")) out.print("checked=\"checked\""); %>/>
                  senza caparra
                </td>
              </tr>
              <tr>
                <td><b>pagamento</b></td>
                <%
                String pagamento = beanLoggato.get("pagamento");
                if(pagamento == null)
                  pagamento = "";
                %>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="contanti"
                    <% if (pagamento.contains("contanti")) out.print("checked=\"checked\""); %>/>
                  contanti
                </td>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="assegno"
                    <% if (pagamento.contains("assegno")) out.print("checked=\"checked\""); %>/>
                  assegno</td>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="bancomat"
                    <% if (pagamento.contains("bancomat")) out.print("checked=\"checked\""); %>/>
                  bancomat
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="carta di credito"
                    <% if (pagamento.contains("carta di credito")) out.print("checked=\"checked\""); %>/>
                  carta di credito
                </td>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="bonifico"
                    <% if (pagamento.contains("bonifico")) out.print("checked=\"checked\""); %>/>
                  bonifico
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="paypal"
                    <% if (pagamento.contains("paypal")) out.print("checked=\"checked\""); %>/>
                  paypal
                </td>
                <td>
                  <input id="pagamento" name="pagamento" type="checkbox" class="styled" value="postepay"
                    <% if (pagamento.contains("postepay")) out.print("checked=\"checked\""); %>/>
                  postepay
                </td>
              </tr>
              <tr>
                <td><b>offerta</b></td>
                <td colspan="3">
                  <%
                  String scontodel = beanLoggato.get("scontodel");
                  String offerta = beanLoggato.get("offerta");
                  if(offerta == null)
                    offerta = "";
                  %>
                  <input id="offerta" name="offerta" type="checkbox" class="styled"
                    <% if (! offerta.equals("") && offerta != null) out.print("checked=\"checked\""); %>/>
                  sconto del
                  <input id="scontodel" name="scontodel" type="text" class="smusso" size="4"
                    <%
                    if(scontodel != null)
                    {
                      out.println("value=\"" + scontodel + "\"");
                    }
                    %>
                  />
                  %
				 <br/><br/>
                  dal
                  <input type="text" class="smusso" name="dal" id="dal" size="9" title="gg/mm/aaaa"
                    <%
                    String dal = beanLoggato.get("dal");
                    if(dal != null)
                    {
                      out.println("value=\"" + dal + "\"");
                    }
                    %>
                  /><input type="reset" class="cal" value=" ... " onclick="return showCalendar('dal', '%Y-%m-%d');"/>

                  al
                  <input type="text" class="smusso" name="al" id="al" size="9" title="gg/mm/aaaa"
                    <%
                    String al = beanLoggato.get("al");
                    if(al != null)
                    {
                      out.println("value=\"" + al + "\"");
                    }
                    %>
                  /><input type="reset" class="cal" value=" ... " onclick="return showCalendar('al', '%Y-%m-%d');"/>
                </td>
              </tr>
            </table>
                  <input type="hidden" id="pagina" name="pagina" value="Registrazione2.jsp" />
                  <input type="hidden" name="actiontype" value="insert2"/>



            <p align="center">
            <br/>
              <button type="submit" onclick="document.insertdati.action='${pageContext.request.contextPath}/Action'; write_divmesi(); document.insertdati.submit()">
                <span class="round_270"><span>registrate i servizi</span></span>
              </button>
            </p>
          </div>

        </form>


		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.Registrazione2" />
       <jsp:param name="header_text" value="hdr.registrazione_2" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>