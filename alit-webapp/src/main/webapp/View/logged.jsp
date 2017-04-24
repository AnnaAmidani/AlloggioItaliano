<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% String context = request.getContextPath(); %>
<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  response.sendRedirect(request.getContextPath() + response.encodeURL("doLog.jsp"));
}
String abbonato = "false";
if(session.getAttribute("abbonato") != null && session.getAttribute("abbonato").equals("true"))
{
  abbonato = "true";
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<!--   <link rel="stylesheet" href="${pageContext.request.contextPath}/View/css-ai/logged.css" type="text/css" media="all" /> -->

  <script language="javascript">
    function ChargeScheda(url)
    {
       var context = "${pageContext.request.contextPath}/View/";
       var turl = context + url;
       var w = open(turl,"ChargeScheda");
    }
  </script>
  <script language="javascript">
    function action( value )
    {
      value = '<input type="hidden" name="action" id="action" value="' + value + '"/>';
      document.getElementById('actionDrop').innerHTML = value;
    }
  </script>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.logged" />
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
               <fmt:message key="ttl.logged"/>
			   </a>
			 </h2>
			</div>

		      <form name="navform" action="${pageContext.request.contextPath}/Action">
		        <div id="actionDrop"></div>
		        <%
		        Integer id = (Integer) session.getAttribute("idLoggato");
		        if(id == null)
		          id = new Integer(0);

		        int idLoggato = id.intValue();
		        %>
		        <p class="logged">
		          <%
		          if(request.getAttribute("username") != null)
		          {
		            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		            String dateTime = sdf.format(new Date());//.getCalendar().getTime().toString();//.toLocaleString();
		          	session.setAttribute("username", request.getAttribute("username"));
		          	session.setAttribute("dateTime", dateTime);
		            %>data e ora di accesso: <i><%= dateTime%></i><br/>
		            utente:&nbsp;<b><%= request.getAttribute("username")%></b>
		          <%
		          }
		          %>

		        </p>

		      </form>

		      <div id="contentTasto">
		        <div id="tasto1" class="color5">
		          <div id="intasto1">
		            <a style="text-decoration:none;" href="<%= context + response.encodeURL("/View/Registrazione1.jsp")%>">
		              &nbsp;<br/>
		              <fmt:message key="btn.modificate_caratteristiche_struttura"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div id="tasto2" class="color16">
		          <div id="intasto2">
		             <a href="<%= context + response.encodeURL("/View/Registrazione3.jsp")%>">
		              &nbsp;<br/>
		              <fmt:message key="btn.modificate_descrizione_struttura"/>
		              <br/>&nbsp;
		             </a>
		          </div>
		        </div>
		        <div id="tasto3" class="color4">
		          <div id="intasto3">
		          <%
		          if(abbonato.equals("false"))
		          {%>
		            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')">
		              &nbsp;<br/>
		              <fmt:message key="btn.modificate_servizi_struttura"/>
		              <br/>&nbsp;
		          </a>
		          <%
		          }
		          else
		          {%>
		            <a href="<%= context + response.encodeURL("/View/Registrazione2.jsp")%>">
		              &nbsp;<br/>
		              <fmt:message key="btn.modificate_servizi_struttura"/>
		              <br/>&nbsp;
		          </a>
		          <%
		          }
		          %>
		          </div>
		        </div>
		        <div id="tasto4" class="color2">
		          <div id="intasto4">
		          <%
		          if(abbonato.equals("false"))
		          {%>
		            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')">
		              &nbsp;<br/>
		              <fmt:message key="btn.modificate_disponibilita_struttura"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          else
		          {%>
		            <a href="<%= context + response.encodeURL("/View/Registrazione4.jsp")%>">
		              &nbsp;<br/>
		              <fmt:message key="btn.modificate_disponibilita_struttura"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          %>
		          </div>
		        </div>

		        <div id="tasto5" class="color3">
		          <div id="intasto5">
		            <a href="<%= context + response.encodeURL("/View/abbonamenti.jsp")%>">
		              &nbsp;<br/>
		              sottoscrivete<br/>abbonamento<br/>annuale
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>

		        <div id="tasto6" class="color6">
		          <div id="intasto6">
		            <a href="#" onclick="ChargeScheda('scheda1.jsp?id=<%= id %>')">
		              &nbsp;<br/>
		              <fmt:message key="btn.vedete_profilo_struttura"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>

<%--
		        <div id="tasto7" class="color1">
		          <div id="intasto7">
		          <%
		          if(abbonato.equals("false"))
		          {%>
		            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')">
    				  &nbsp;<br/>
		              <fmt:message key="btn.segnalate_feste_o_fiere"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          else
		          {%>
		            <a href="<%= context + response.encodeURL("/View/festeFiereForm.jsp") %>">
                      &nbsp;<br/>
		              <fmt:message key="btn.segnalate_feste_o_fiere"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          %>
		          </div>
		        </div>
 --%>
		        <div id="tasto8" class="color13">
		          <div id="intasto8">
		          <%
		          /**
		          if(abbonato.equals("false"))
		          {%>
		            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalate_eventi_o_spettacoli"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          else
		          **/
		          {%>
		            <a href="<%= context + response.encodeURL("/View/eventiSpettacoliForm.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalate_eventi_o_spettacoli"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          %>
		          </div>
		        </div>
<%--
		        <div id="tasto9" class="color14">
		          <div id="intasto9">
		          <%
		          if(abbonato.equals("false"))
		          {%>
		            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalate_mostre_o_musei"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          else
		          {%>
		            <a href="<%= context + response.encodeURL("/View/mostreMuseiForm.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalate_mostre_o_musei"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          %>
		          </div>
		        </div>

--%>
<%--
		        <div id="tasto10" class="color15">
		          <div id="intasto10">
		          <%
		          if(abbonato.equals("false"))
		          {%>
		            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalate_corsi_o_percorsi"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          else
		          {%>
		            <a href="<%= context + response.encodeURL("/View/corsiPercorsiForm.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalate_corsi_o_percorsi"/>
		              <br/>&nbsp;
		            </a>
		          <%
		          }
		          %>
		          </div>
		        </div>
 --%>
                <div id="tasto11" class="color15">
		          <div id="intasto11">
		            <a href="<%= context + response.encodeURL("/View/doLogChange.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.reset_password"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>

		        <div id="tasto12" class="color16">
		          <div id="intasto12">
		            <a href="<%= context + response.encodeURL("/View/logo.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.prendete_il_logo_alloggio_italiano"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>

		        <div id="tasto13" class="color18">
		          <div id="intasto13">
		            <a href="<%= context + response.encodeURL("/View/mailForm.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.segnalateci_una_nuova_struttura"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div id="tasto14" class="color19">
		          <div id="intasto14">
		            <a href="<%= context + response.encodeURL("/View/cancellazioneForm.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.cancellate_la_vostra_struttura"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div id="tasto15" class="color7">
		          <div id="intasto15">
		            <a href="<%= context + response.encodeURL("/View/mailForm.jsp") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.scriveteci_e-mail_per_info"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div id="tasto16" class="color2">
		          <div id="intasto16">
		            <a href="<%= context + response.encodeURL("/docs/InformativaPrivacy.pdf") %>">
		              &nbsp;<br/>
		              informativa<br/>sulla<br/>privacy
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div id="tasto17" class="color17">
		          <div id="intasto17">
		            <a href="<%= context + response.encodeURL("/docs/RegolamentoAlloggioItaliano.pdf") %>">
		              &nbsp;<br/>
		              <fmt:message key="btn.leggete_le_condizioni_del_servizio"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div id="tasto18" class="color21">
		          <div id="intasto18">
		            <a href="#" onclick="alert('disponibile a breve!');">
		              &nbsp;<br/>
		              <fmt:message key="btn.create_il_vostro_sito_web"/>
		              <br/>&nbsp;
		            </a>
		          </div>
		        </div>
		        <div class="small_space">
		        </div>
		      </div>

		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.logged" />
       <jsp:param name="header_text" value="hdr.logged" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>





