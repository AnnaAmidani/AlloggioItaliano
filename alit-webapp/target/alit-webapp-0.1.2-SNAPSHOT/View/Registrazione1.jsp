<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  java.util.*,
  anna.alit.beanbb.HashBean,
  anna.alit.beanbb.HashBeanVector,
  anna.alit.servicexhtml.TendineXHTML,
  anna.alit.servicebb.FormServiceImpl"
%>
<% String context = request.getContextPath(); %>
<% Integer idLoggato = (Integer) session.getAttribute("idLoggato"); %>
<%
HashBean beanLoggato = FormServiceImpl.getInstance().updateBeanLoggato(request);
HashBeanVector hashResult;
hashResult = (HashBeanVector) request.getAttribute("hashResult");
if(hashResult == null)
  hashResult = (HashBeanVector) session.getAttribute("hashResult");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/validazioni.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/View/css-ai/spot.css" type="text/css" media="all" />
  <script type="text/javascript">
    function azzera()
    {
      document.getElementById('comune').value = '0';
      document.getElementById('aeroporti').value = '0';
      document.getElementById('autostrade').value = '0';
      document.getElementById('stazioni').value = '0';
    }

    function validaAndInsert()
    {
      if( valida() )
      {
        document.insertdati.secondaction.value='insert1';
        document.insertdati.action='${pageContext.request.contextPath}/Action';
        document.insertdati.submit();
      }
    }

    function validaAndUpdate()
    {
      if( valida() )
      {
        document.insertdati.thirdaction.value='updateReg1';
        document.insertdati.action='${pageContext.request.contextPath}/Action';
        document.insertdati.submit();
      }
    }
  </script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/custominput.js"></script>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.Registrazione1" />
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
               <fmt:message key="ttl.Registrazione1"/>
			   </a>
			 </h2>
			</div>
          <br/><br/>
	     <jsp:include page="snippets/navmenu_registrazione.jsp">
	        <jsp:param name="idLoggato" value="<%= idLoggato %>" />
	        <jsp:param name="registrazione" value="1" />
	      </jsp:include>

	    <form name="insertdati" id="insertdati" class="reg1" action="" method="post" >
          <div class="parent_boxReg">
          <br/>
	      <div class="cmt"><b>[* = questi dati non verranno resi pubblici]</b></div>
          <br/>
              <div class="title_lbl_1">Anagrafica</div>
              <hr class="title_under" />

              <%
              String nome = ( beanLoggato.get("nome") != null ) ? beanLoggato.get("nome") : "";
              String cognome = ( beanLoggato.get("cognome") != null ) ? beanLoggato.get("cognome") : "";
              String denominazione = ( beanLoggato.get("denominazione") != null ) ? beanLoggato.get("denominazione") : "";
              if (denominazione != null) session.setAttribute("denominazione", denominazione);
              %>
              <div class="boxReg">nome*</div>
              <div class="boxReg"><input id="nome" name="nome" type="text" class="smusso" size="20" value="<%= nome %>" /> </div>
              <div class="boxReg">cognome*</div>
              <div class="boxReg"><input name="cognome" id="cognome" type="text" class="smusso" size="20" value="<%= cognome %>" /> </div>
              <br/><div class="boxReg">data di nascita*</div>
              <div class="boxReg">
                <% String giorno = ( beanLoggato.get("giorno") != null ) ? beanLoggato.get("giorno") : ""; %>
                <select class="smusso" id="giorno" name="giorno" title="giorno">
                  <option selected="selected"><%= giorno %></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
              </div>
              <% String mese = ( beanLoggato.get("mese") != null ) ? beanLoggato.get("mese") : ""; %>
              <div class="boxReg">
                <select class="smusso" id="mese" name="mese" title="mese">
                  <option selected="selected"><%= mese %></option>
                  <option value="gennaio">gennaio</option>
                  <option value="febbraio">febbraio</option>
                  <option value="marzo">marzo</option>
                  <option value="aprile">aprile</option>
                  <option value="maggio">maggio</option>
                  <option value="giugno">giugno</option>
                  <option value="luglio">luglio</option>
                  <option value="agosto">agosto</option>
                  <option value="settembre">settembre</option>
                  <option value="ottobre">ottobre</option>
                  <option value="novembre">novembre</option>
                  <option value="dicembre">dicembre</option>
                </select>
              </div>
              <% String anno = ( beanLoggato.get("anno") != null ) ? beanLoggato.get("anno") : ""; %>
              <div class="boxReg"> <input id="anno" name="anno" type="text" class="smusso" size="20" title="anno" value="<%= anno %>" /></div>
              <% String codicefiscale = ( beanLoggato.get("codicefiscale") != null ) ? beanLoggato.get("codicefiscale") : ""; %>
              <div class="boxReg">codice fiscale* </div>
              <div class="boxReg"><input id="codicefiscale" name="codicefiscale" type="text" class="smusso" size="20" value="<%= codicefiscale %>" /></div>
              <div class="boxReg">denominazione struttura: <input id="denominazione" name="denominazione" class="smusso"
              type="text" size="20" title="nome dell'attivit&agrave;" value="<%= denominazione %>" />
          </div>

      </div>

      <div style="clear:both;">
      <br/>
              <div class="title_lbl_1" >Recapiti</div>
              <hr class="title_under" />

          <%
          String telefono = ( beanLoggato.get("telefono") != null ) ? beanLoggato.get("telefono") : "";
          String telefono2 = ( beanLoggato.get("telefono2") != null ) ? beanLoggato.get("telefono2") : "";
          String cellulare = ( beanLoggato.get("cellulare") != null ) ? beanLoggato.get("cellulare") : "";
          String cellulare2 = ( beanLoggato.get("cellulare2") != null ) ? beanLoggato.get("cellulare2") : "";
          String fax = ( beanLoggato.get("fax") != null ) ? beanLoggato.get("fax") : "";
          String fax2 = ( beanLoggato.get("fax2") != null ) ? beanLoggato.get("fax2") : "";
          %>
          <div class="boxReg">telefono <input id="telefono" name="telefono" type="text" class="smusso" size="20" value="<%= telefono %>" /></div>
          <div class="boxReg">telefono(2) <input id="telefono2" name="telefono2" type="text" class="smusso" size="20" value="<%= telefono2 %>" /></div>
          <div class="boxReg">cellulare <input id="cellulare" name="cellulare" type="text" class="smusso" size="20" value="<%= cellulare %>" /></div>
          <div class="boxReg">cellulare(2) <input id="cellulare2" name="cellulare2" type="text" class="smusso" size="20" value="<%= cellulare2 %>"/></div>
          <div class="boxReg">fax <input id="fax" name="fax" type="text" class="smusso" size="20" value="<%= fax %>"/></div>
          <div class="boxReg">fax(2) <input id="fax2" name="fax2" type="text" class="smusso" size="20" value="<%= fax2 %>"/></div>

      </div>

      <div style="clear:both">

          <%
          String mail = ( beanLoggato.get("mail") != null ) ? beanLoggato.get("mail") : "";
          String web = ( beanLoggato.get("web") != null ) ? beanLoggato.get("web") : "";
          String skype = ( beanLoggato.get("skype") != null ) ? beanLoggato.get("skype") : "";
          %>
          <div class="boxReg">indirizzo e-mail*</div>
          <div class="boxReg"> <input id="mail" name="mail" type="text" class="smusso" size="20" value="<%= mail %>" /> </div>
          <div class="boxReg">contatto skype</div>
          <div class="boxReg"> <input id="skype" name="skype" type="text" class="smusso" size="20" value="<%= skype %>" /> </div>
          <div class="boxReg">sito web</div>
          <div class="boxReg"> <input id="web" name="web" type="text" class="smusso" size="20" value="<%= web %>" /> </div>
          <%
          String annofondazione = ( beanLoggato.get("annofondazione") != null ) ? beanLoggato.get("annofondazione") : "";
          %>
          <div class="boxReg">anno di fondazione <input id="annofondazione" name="annofondazione" class="smusso" type="text" size="20" title="anno fondazione" value="<%= annofondazione %>" /></div>
      </div>

      <div style="clear:both">
      <br/>
              <div class="title_lbl_1" >Luogo</div>
              <hr class="title_under" />
            <div style="font-size:8pt">per popolare/ripopolare le liste di comuni/caselli/stazioni/aeroporti &egrave; necessario selezionare regione e provincia</div><br/>

          <div class="boxReg">
            <select class="smusso" id="regione" name="regione" title="regione"
              onchange="document.insertdati.action='${pageContext.request.contextPath}/Action';document.insertdati.submit();">
              <%
                String regione = beanLoggato.get("regione");
                if(regione == null || regione.equals("0")){
                  out.println(TendineXHTML.optionlistregioni(locale));
                }else{
                  out.println("<option value=\"" + regione + "\" selected=\"selected\">" + regione + "</option>" +
                            TendineXHTML.optionlistregioni(locale));
                }
              %>
            </select>
          </div>
          <div class="boxReg">
            <select class="smusso" id="sigla" name="sigla" title="provincia"
              onchange="azzera();document.insertdati.action='${pageContext.request.contextPath}/Action';document.insertdati.submit();">
              <%
              String sigla = beanLoggato.get("sigla");

              if(sigla == null || sigla.equals("0"))
                out.println("<option value=\"0\">provincia</option>");
              else
                out.println("<option value=\"" + sigla + "\" selected=\"selected\">" + sigla + "</option>");

              int size = 0;

              if(hashResult != null)
              {
                String[] sigle = hashResult.getAsArray("sigla");
                String[] nomeesteso = hashResult.getAsArray("nomeesteso");
                size = (sigle != null && nomeesteso != null)? sigle.length : 0;
                for(int i = 0; i < size; i++)
                {
                  out.println("<option value=\"" + sigle[i] + "\">" + nomeesteso[i] + "</option>");
                }
              }
              %>
              </select>
            </div>
            <div class="boxReg">
              <select class="smusso" id="comune" name="comune" title="comune">
                <%
                String comun = beanLoggato.get("comune");
                if(comun == null || comun.equals("0"))
                  out.println("<option value=\"0\" selected=\"selected\">comune</option>");
                else
                  out.println("<option value=\"" + comun + "\" selected=\"selected\">" + comun + "</option>");

                if(hashResult != null){
                  String[] comune = hashResult.getAsArray("comune");
                  size = (comune != null)? comune.length : 0;
                  for(int i = 0; i < size; i++)
                  {
                    out.println("<option value=\"" + comune[i] + "\">" + comune[i] + "</option>");
                  }
                }
                %>
              </select>
            </div>

        </div>

        <div style="clear:both">

            <div class="boxReg">zona</div>
            <div class="boxReg">
              <select class="smusso" id="nzona" name="nzona">
                <%
                String nzona = beanLoggato.get("nzona");
                if(nzona != null)
                {
                  out.println("<option selected=\"selected\">" + nzona + "</option>");
                }
                else
                {
                  out.println("<option selected=\"selected\"></option>");
                }
                %>
                <% out.println(TendineXHTML.optionlistindirizzo()); %>
              </select>
            </div>
            <div class="boxReg">
              <input id="zona" name="zona" type="text" class="smusso" size="20" title="zona"
                <%
                String zona = beanLoggato.get("zona");
                if(zona != null)
                  out.println("value=\"" + zona + "\"");
                %>
              />
            </div>
        </div>

        <div style="clear:both">
            <div class="boxReg">indirizzo</div>
            <div class="boxReg">
              <select class="smusso" id="loco" name="loco">
                <%
                String loco = beanLoggato.get("loco");
                if(loco != null)
                {
                  out.println("<option selected=\"selected\">" + loco + "</option>");
                }
                else
                {
                  out.println("<option selected=\"selected\"></option>");
                }
                %>
                <% out.println(TendineXHTML.optionlistzona()); %>
              </select>
            </div>
            <div class="boxReg">
              <input id="indirizzo" name="indirizzo" type="text" class="smusso" size="20"
                <%
                  String indirizzo = beanLoggato.get("indirizzo");
                  if(indirizzo != null)
                    out.println("value=\"" + indirizzo + "\"");
                %>
              />
            </div>
            <div class="boxReg">civico</div>
            <div class="boxReg">
              <input name="civico" id="civico" type="text" class="smusso" size="6"
                <%
                  String civico = beanLoggato.get("civico");
                  if(civico != null)
                    out.println("value=\"" + civico + "\"");
                %>
              />
            </div>

            <div class="boxReg">cap
              <input name="cap" id="cap" type="text" class="smusso" size="20"
                <%
                  String cap = beanLoggato.get("cap");
                  if(cap != null)
                    out.println("value=\"" + cap + "\"");
                %>
              />
            </div>

        </div>

        <div style="clear:both">
      <br/>

              <div class="title_lbl_1" >Tipologia</div>
              <hr class="title_under" />

              <%
              String tipologia = beanLoggato.get("tipologia");
              if(tipologia == null)
                tipologia = "";
              %>
              <div class="boxReg"><input name="tipologia" id="tipologia" type="radio" class="styled"  value="AC" checked="checked" <% if (tipologia.equals("AC")) out.print("checked=\"checked\""); %> />affittacamere/locanda</div>
              <div class="boxReg"><input name="tipologia" id="tipologia" type="radio" class="styled"  value="AT" <% if (tipologia.equals("AT")) out.print("checked=\"checked\""); %> />agriturismo/countryhouse</div>
              <div class="boxReg"><input name="tipologia" id="tipologia" type="radio" class="styled"  value="BB" <% if (tipologia.equals("BB")) out.print("checked=\"checked\""); %> />bed and breakfast</div>
              <div class="boxReg"><input name="tipologia" id="tipologia" type="radio" class="styled"  value="OG" <% if (tipologia.equals("OG")) out.print("checked=\"checked\""); %> />ostello</div>
              <div class="boxReg"><input name="tipologia" id="tipologia" type="radio" class="styled"  value="RA" <% if (tipologia.equals("RA")) out.print("checked=\"checked\""); %> />rifugio</div>

        </div>

        <div style="clear:both">
      <br/>

              <div class="title_lbl_1" >Costruzione</div>
              <hr class="title_under" />

              <%
              String costruzione = beanLoggato.get("costruzione");
              if(costruzione == null)
                costruzione = "";
              %>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="appartamento" <% if (costruzione.equals("appartamento")) out.print("checked=\"checked\""); %>/>appartamento</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="attico" <% if (costruzione.equals("attico")) out.print("checked=\"checked\""); %>/>attico</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="baita" <% if (costruzione.equals("baita")) out.print("checked=\"checked\""); %>/>baita</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="bungalow" <% if (costruzione.equals("bungalow")) out.print("checked=\"checked\""); %>/>bungalow</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="casa"<% if (costruzione.equals("casa")) out.print("checked=\"checked\""); %>/>casa</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="cascina" <% if (costruzione.equals("cascina")) out.print("checked=\"checked\""); %>/>cascina</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="casolare" <% if (costruzione.equals("casolare")) out.print("checked=\"checked\""); %>/>casolare</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="casotto di caccia" <% if (costruzione.equals("casotto di caccia")) out.print("checked=\"checked\""); %>/>casotto di caccia</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="castello" <% if (costruzione.equals("castello")) out.print("checked=\"checked\""); %>/>castello</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="chalet" <% if (costruzione.equals("chalet")) out.print("checked=\"checked\""); %>/>chalet</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="dammuso" <% if (costruzione.equals("dammuso")) out.print("checked=\"checked\""); %>/>dammuso</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="faro" <% if (costruzione.equals("faro")) out.print("checked=\"checked\""); %>/>faro</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="fattoria" <% if (costruzione.equals("fattoria")) out.print("checked=\"checked\""); %>/>fattoria</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="forte" <% if (costruzione.equals("forte")) out.print("checked=\"checked\""); %>/>forte</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="garni" <% if (costruzione.equals("garni")) out.print("checked=\"checked\""); %>/>garni</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="loft" <% if (costruzione.equals("loft")) out.print("checked=\"checked\""); %>/>loft</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="malga" <% if (costruzione.equals("malga")) out.print("checked=\"checked\""); %>/>malga</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="maso" <% if (costruzione.equals("maso")) out.print("checked=\"checked\""); %>/>maso</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="masseria" <% if (costruzione.equals("masseria")) out.print("checked=\"checked\""); %>/>masseria</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="mulino" <% if (costruzione.equals("mulino")) out.print("checked=\"checked\""); %>/>mulino</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="palazzina" <% if (costruzione.equals("palazzina")) out.print("checked=\"checked\""); %>/>palazzina</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="palazzo" <% if (costruzione.equals("palazzo")) out.print("checked=\"checked\""); %>/>palazzo</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="residence" <% if (costruzione.equals("residence")) out.print("checked=\"checked\""); %>/>residence</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="rustico" <% if (costruzione.equals("rustico")) out.print("checked=\"checked\""); %>/>rustico</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="torre" <% if (costruzione.equals("torre")) out.print("checked=\"checked\""); %>/>torre</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="trullo" <% if (costruzione.equals("trullo")) out.print("checked=\"checked\""); %>/>trullo</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="villa storica" <% if (costruzione.equals("villa storica")) out.print("checked=\"checked\""); %>/>villa storica</div>
              <div class="boxReg"><input name="costruzione" type="radio" class="styled"  value="villina a schiera" <% if (costruzione.equals("villina a schiera")) out.print("checked=\"checked\""); %>/>villina a schiera</div>

        </div>

        <div style="clear:both">
      <br/>
              <div class="title_lbl_1" >Posizione</div>
              <hr class="title_under" />

              <%
              String posizione = beanLoggato.get("posizione");
              if(posizione == null)
                posizione = "";
              %>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="campagna" <% if (posizione.contains("campagna")) out.print("checked=\"checked\""); %>/>campagna</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="citta" <% if (posizione.contains("citta")) out.print("checked=\"checked\""); %>/>citt&agrave;</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="collina" <% if (posizione.contains("collina")) out.print("checked=\"checked\""); %>/>collina</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="lago" <% if (posizione.contains("lago")) out.print("checked=\"checked\""); %>/>lago</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="mare" <% if (posizione.contains("mare")) out.print("checked=\"checked\""); %>/>mare</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="montagna" <% if (posizione.contains("montagna")) out.print("checked=\"checked\""); %>/>montagna</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="paese" <% if (posizione.contains("paese")) out.print("checked=\"checked\""); %>/>paese</div>
              <div class="boxReg"><input name="posizione" type="checkbox" class="styled"  value="pianura" <% if (posizione.contains("pianura")) out.print("checked=\"checked\""); %>/>pianura</div>

        </div>


        <div style="clear:both">
      <br/>
              <div class="title_lbl_1" >Camere</div>
              <hr class="title_under" />

            <div class="boxReg">
              numero di camere totali <input name="numcamere" id="numcamere" onchange="validaTipologia()" type="text" class="smusso" size="6"
                <%
                  String numcamere = beanLoggato.get("numcamere");
                  if(numcamere != null)
                    out.println("value=\"" + numcamere + "\"");
                %>
              />
            </div>
            <div class="boxReg">
              numero di letti per camera:&nbsp;da&nbsp;
              <input id="numlettimin" name="numlettimin" type="text" class="smusso" size="6" title="da"
                <%
                  String numlettimin = beanLoggato.get("numlettimin");
                  if(numlettimin != null)
                    out.println("value=\"" + numlettimin + "\"");
                %>
              />
              &nbsp;a&nbsp;
              <input id="numlettimax" name="numlettimax" type="text" class="smusso" size="6" title="a"
                <%
                  String numlettimax = beanLoggato.get("numlettimax");
                  if(numlettimax != null)
                    out.println("value=\"" + numlettimax + "\"");
                %>
              />
            </div>
            <div class="boxReg">
              numero di letti totale <input id="numlettitot" name="numlettitot" type="text" class="smusso" size="6"
                <%
                  String numlettitot = beanLoggato.get("numlettitot");
                  if(numlettitot != null)
                    out.println("value=\"" + numlettitot + "\"");
                %>
              />
            </div>


            <div class="boxReg">
              numero di appartamenti indipendenti: <input id="appartamenti" name="appartamenti" type="text" class="smusso" size="6"
                <%
                  String appartamenti = beanLoggato.get("appartamenti");
                  if(appartamenti != null)
                    out.println("value=\"" + appartamenti + "\"");
                %>
              />
            </div>

        </div>

        <div style="clear:both">
      <br/>
              <div class="title_lbl_1" >Lingue parlate</div>
              <hr class="title_under" />

              <%

              String lingue = beanLoggato.get("lingue");
              if(lingue == null)
                lingue = "";
              %>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="ita" <% if (lingue.contains("ita")) out.print("checked=\"checked\""); %> />italiano</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="eng" <% if (lingue.contains("eng")) out.print("checked=\"checked\""); %> />english</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="fra" <% if (lingue.contains("fra")) out.print("checked=\"checked\""); %> />francais</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="esp" <% if (lingue.contains("esp")) out.print("checked=\"checked\""); %> />espanol</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="por" <% if (lingue.contains("por")) out.print("checked=\"checked\""); %> />portugues</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="deu" <% if (lingue.contains("deu")) out.print("checked=\"checked\""); %> />deutsch</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="ned" <% if (lingue.contains("ned")) out.print("checked=\"checked\""); %> />nederlands</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="nor" <% if (lingue.contains("nor")) out.print("checked=\"checked\""); %> />norsk</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="dan" <% if (lingue.contains("dan")) out.print("checked=\"checked\""); %> />dansk</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="sve" <% if (lingue.contains("sve")) out.print("checked=\"checked\""); %> />svenska</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="suo" <% if (lingue.contains("suo")) out.print("checked=\"checked\""); %> />suomi</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="pol" <% if (lingue.contains("pol")) out.print("checked=\"checked\""); %> />polski</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="rom" <% if (lingue.contains("rom")) out.print("checked=\"checked\""); %> />roman</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="mag" <% if (lingue.contains("mag")) out.print("checked=\"checked\""); %> />magyar</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="cze" <% if (lingue.contains("cze")) out.print("checked=\"checked\""); %> />czecky</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="hrv" <% if (lingue.contains("hrv")) out.print("checked=\"checked\""); %> />hrvatzi</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="slo" <% if (lingue.contains("slo")) out.print("checked=\"checked\""); %> />slovenskina</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="rus" <% if (lingue.contains("rus")) out.print("checked=\"checked\""); %> />russo</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="jap" <% if (lingue.contains("jap")) out.print("checked=\"checked\""); %> />giapponese</div>
              <div class="boxReg"><input name="lingue" type="checkbox" class="styled"  value="cin" <% if (lingue.contains("cin")) out.print("checked=\"checked\""); %> />cinese</div>
              <div class="boxReg"></div>

          </div>

          <div style="clear:both">
      <br/>
              <div class="title_lbl_1" >Distanze massime</div>
              <hr class="title_under" />

              <div class="boxReg">
                km
                <input id="kmcapoluogo" name="kmcapoluogo" type="text" class="smusso" size="6"
                  <%
                  String kmcapoluogo = beanLoggato.get("kmcapoluogo");
                  if(kmcapoluogo != null)
                    out.println("value=\"" + kmcapoluogo + "\"");
                  %>
                />
                dal capoluogo di provincia
              </div>
          </div>

          <div style="clear:both">

              <div class="boxReg">
                km
                <input id="kmcasello" name="kmcasello" type="text" class="smusso" size="6"
                  <%
                  String kmcasello = beanLoggato.get("kmcasello");
                  if(kmcasello != null)
                    out.println("value=\"" + kmcasello + "\"");
                  %>
                />
                dal casello autostradale di
              </div>
              <div class="boxReg">
                <select id="autostrade" name="autostrade" style="width:200px" class="smusso">
                  <%
                  String autostr = beanLoggato.get("autostrade");
                  if(autostr == null || autostr.equals("0"))
                    out.println("<option value=\"0\" selected=\"selected\"></option>");
                  else
                    out.println("<option value=\"" + autostr + "\" selected=\"selected\">" + autostr + "</option><option value=\"0\"></option>");

                  if(hashResult != null){
                     String[] autostrada = hashResult.getAsArray("autostrada");
                     String[] uscita = hashResult.getAsArray("uscita");
                    size = (autostrada != null && uscita != null)? autostrada.length : 0;
                     for(int i = 0; i < size; i++) {
                      out.println("<option value=\"" + autostrada[i] + " " + uscita[i] + "\">" + uscita[i] + " - " + autostrada[i] + "</option>");
                    }
                  }
                  %>
                </select>
              </div>
          </div>

          <div style="clear:both">
              <div class="boxReg">
                km
                <input id="kmaeroporto" name="kmaeroporto" type="text" class="smusso" size="6"
                  <%
                  String kmaeroporto = beanLoggato.get("kmaeroporto");
                  if(kmaeroporto != null)
                    out.println("value=\"" + kmaeroporto + "\"");
                  %>
                />
                dall'aeroporto di
              </div>
              <div class="boxReg">
                <select id="aeroporti" name="aeroporti" style="width:200px"  class="smusso" >
                  <%
                  String aerop = beanLoggato.get("aeroporti");
                  if(aerop == null || aerop.equals("0"))
                    out.println("<option value=\"0\" selected=\"selected\"></option>");
                  else
                    out.println("<option value=\"" + aerop + "\" selected=\"selected\">" + aerop + "</option><option value=\"0\"></option>");

                  if(hashResult != null)
                  {
                    String[] aeroporto = hashResult.getAsArray("aeroporto");
                    size = (aeroporto != null)? aeroporto.length : 0;
                    for(int i = 0; i < size; i++)
                    {
                      out.println("<option value=\"" + aeroporto[i] + "\">" + aeroporto[i] + "</option>");
                    }
                  }
                  %>
                </select>
              </div>
          </div>

          <div style="clear:both">
              <div class="boxReg">
                km
                <input id="kmstazione" name="kmstazione" type="text" class="smusso" size="6"
                  <%
                  String kmstazione = beanLoggato.get("kmstazione");
                  if(kmstazione != null)
                    out.println("value=\"" + kmstazione + "\"");
                  %>
                />
                dalla stazione ferroviaria di
              </div>
              <div class="boxReg">
                <select id="stazioni" name="stazioni"  style="width:200px" class="smusso">
                  <%
                  String stazioni = beanLoggato.get("stazioni");
                  if(stazioni == null || stazioni.equals("0"))
                    out.println("<option value=\"0\" selected=\"selected\"></option>");
                  else
                    out.println("<option value=\"" + stazioni + "\" selected=\"selected\">" + stazioni + "</option><option value=\"0\"></option>");

                  if(hashResult != null)
                  {
                    String[] stazione = hashResult.getAsArray("nomestazione");
                    size = (stazione != null)? stazione.length : 0;
                    for(int i = 0; i < size; i++)
                    {
                      out.println("<option value=\"" + stazione[i] + "\">" + stazione[i] + "</option>");
                    }
                  }
                  %>
                </select>
              </div>
          </div>

          <div style="clear:both">
              <div class="boxReg">
                mt&nbsp;&nbsp;<input id="mtmezzipubblici" name="mtmezzipubblici" type="text" class="smusso" size="6"
                  <%
                  String mtmezzipubblici = beanLoggato.get("mtmezzipubblici");
                  if(mtmezzipubblici != null)
                    out.println("value=\"" + mtmezzipubblici + "\"");
                  %>
                />
                dalla fermata di mezzi pubblici locali
              </div>

        </div>

		<%
		String firstTimeLogged = (String)session.getAttribute("firstTimeLogged");
		if(firstTimeLogged == null) firstTimeLogged="knownUser";
		if(idLoggato == null || firstTimeLogged.equals("firstTimeLogged"))
		{
		%>
        <div id="contratto" style="clear:both">
        <br/>
             <p style="text-align:right">
              <a href="${pageContext.request.contextPath}/docs/RegolamentoAlloggioItaliano.pdf">
               <b>condizioni del contratto</b>
              </a>
              &nbsp;&nbsp;<b>accetto<input type="radio" name="contratto" value="si"/></b>
              &nbsp;&nbsp;<b>non accetto<input type="radio"  name="contratto" checked="checked" value="no"/></b>
             </p>
        </div>
        <%
        }
		else
		{
        %>
        <div style="clear:both"></div>
        <%
        }
        %>

        <input type="hidden" id="pagina" name="pagina" value="Registrazione1.jsp" />
        <input type="hidden" name="actiontype" value="popola"/>
        <input type="hidden" name="secondaction" value=""/>
        <input type="hidden" name="thirdaction" value=""/>

         <p style="text-align:center">
          <%
          if (idLoggato == null)
          {
            %>
            <button name="sendData" type="button" onclick="validaAndInsert();">
              <span class="round_270"><span>registrate le caratteristiche</span></span>
            </button>
            <%
          }
          else
          {
            %>
            <button name="sendData" type="button" onclick="validaAndUpdate();">
              <span class="round_270"><span>aggiornate le caratteristiche</span></span>
            </button>
            <%
          }
          %>
        </p>

        </form>

		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.Registrazione1" />
       <jsp:param name="header_text" value="hdr.registrazione_1" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>