<%--
Stampa il menu di navigazione
per includere la pagina utilizzare:

  <jsp:include page="snippets/navigation.jsp" />

--%>
<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>

  <%
  String context = request.getContextPath();
  Object idL =  session.getAttribute("idLoggato");
  String user = (String)session.getAttribute("username");
  String dateTime = (String)session.getAttribute("dateTime");
  String abbonato = "false";
  if(session.getAttribute("abbonato") != null && session.getAttribute("abbonato").equals("true"))
  {
    abbonato = "true";
  }

  %>

    <%String url; %>
    <ul>
<%--        <% url =  context + response.encodeURL("/View/home.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.home"/>
          </a>
        </li> --%>
        <% url =  context + response.encodeURL("/View/home.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.cerca_alloggio"/>
          </a>
        </li>

<%--
        <% url =  context + response.encodeURL("/View/corsiPercorsi.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.corsi_percorsi"/>
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/mostreMusei.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.mostre_musei"/>
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/eventiSpettacoli.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.eventi_spettacoli"/>
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/festeFiere.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.feste_fiere"/>
          </a>
        </li>
--%>
        <% url =  context + response.encodeURL("/View/eventiSpettacoli.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.eventi_zona"/>
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/Registrazione1.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <%
            if(idL == null)
            {
              %> <fmt:message key="lnk.registrazione_struttura"/> <%
            }
            else
            {
              %> <fmt:message key="lnk.modifica_struttura"/> <%
            }
            %>
          </a>
        </li>


          <%
          if (idL == null)
          {
            url =  context + response.encodeURL("/View/doLog.jsp");
            %>
            <li onclick="location.href='<%= url %>'" >
              <a href="<%= url %>" >
                <fmt:message key="lnk.login"/>
              </a>
            </li>
            <%
          }
          else
          {
            url =  context + response.encodeURL("/View/logged.jsp");
            %>
            <li onclick="location.href='<%= url %>'" >
              <a href="<%= url %>" >
                <fmt:message key="lnk.funzioni_utente"/>
              </a>
            </li>
            <%
          }
          %>

<%--
        <% url =  context + response.encodeURL("/View/pubblicitaesterna.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.pubblicita"/>
          </a>
        </li>
 --%>

        <% url =  context + response.encodeURL("/View/mailForm.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.contattaci"/>
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/presentazione.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.presentazione"/>
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/logo.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="lnk.logo"/>
          </a>
        </li>



        <%if(idL != null)
        {
        %>

         <% url =  context + response.encodeURL("/View/Registrazione3.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            <fmt:message key="btn.modificate_descrizione_struttura"/>
          </a>
        </li>

        <%
        url =  context + response.encodeURL("/View/Registrazione2.jsp");
        if(abbonato.equals("true"))
		{
          %>
           <li onclick="location.href='<%=url%>'"><a href="<%=url%>"><fmt:message key="btn.modificate_servizi_struttura"/></a></li>
          <%
		}
        else
        {
		%>
           <li onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><a href="#"><fmt:message key="btn.modificate_servizi_struttura"/></a></li>
        <%
        }
        %>

        <%
        url =  context + response.encodeURL("/View/Registrazione4.jsp");
        if(abbonato.equals("true"))
		{
          %>
           <li onclick="location.href='<%=url%>'"><a href="<%=url%>"><fmt:message key="btn.modificate_disponibilita_struttura"/></a></li>
          <%
		}
        else
        {
		%>
           <li onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><a href="#"><fmt:message key="btn.modificate_disponibilita_struttura"/></a></li>
        <%
        }
        %>


        <% url =  context + response.encodeURL("/View/abbonamenti.jsp"); %>
        <li onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            sottoscrivete<br/>abbonamento<br/>annuale
          </a>
        </li>

<%--
        <%
        url =  context + response.encodeURL("/View/festeFiereForm.jsp");
        if(abbonato.equals("true"))
		{
          %>
           <li onclick="location.href='<%=url%>'"><a href="<%=url%>"><fmt:message key="btn.segnalate_feste_o_fiere"/></a></li>
          <%
		}
        else
        {
		%>
           <li onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><a href="#"><fmt:message key="btn.segnalate_feste_o_fiere"/></a></li>
        <%
        }
        %>
--%>

        <%
        url =  context + response.encodeURL("/View/eventiSpettacoliForm.jsp");
		%>
        <li onclick="location.href='<%=url%>'"><a href="<%=url%>"><fmt:message key="btn.segnalate_eventi_o_spettacoli"/></a></li>

<!--
        < %
        url =  context + response.encodeURL("/View/eventiSpettacoliForm.jsp");
        if(abbonato.equals("true"))
		{
          --%>
           <li onclick="location.href='< %=url%>'"><a href="< %=url%>"><fmt:message key="btn.segnalate_eventi_o_spettacoli"/></a></li>
          < %
		}
        else
        {
		% >
           <li onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><a href="#"><fmt:message key="btn.segnalate_eventi_o_spettacoli"/></a></li>
        < %
        }
        % >
-->
<%--

        <%
        url =  context + response.encodeURL("/View/mostreMuseiForm.jsp");
        if(abbonato.equals("true"))
		{
          %>
           <li onclick="location.href='<%=url%>'"><a href="<%=url%>"><fmt:message key="btn.segnalate_mostre_o_musei"/></a></li>
          <%
		}
        else
        {
		%>
           <li onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><a href="#"><fmt:message key="btn.segnalate_mostre_o_musei"/></a></li>
        <%
        }
        %>
--%>

<%--

        <%
        url =  context + response.encodeURL("/View/corsiPercorsiForm.jsp");
        if(abbonato.equals("true"))
		{
          %>
           <li onclick="location.href='<%=url%>'"><a href="<%=url%>"><fmt:message key="btn.segnalate_corsi_o_percorsi"/></a></li>
          <%
		}
        else
        {
		%>
           <li onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><a href="#"><fmt:message key="btn.segnalate_corsi_o_percorsi"/></a></li>
        <%
        }
        %>

--%>
        <%
        }
        %>


    </ul>

