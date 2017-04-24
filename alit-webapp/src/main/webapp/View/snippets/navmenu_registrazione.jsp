<%--
per includere la pagina utilizzare:

      <% Integer idLoggato = (Integer) session.getAttribute("idLoggato"); %>
      <jsp:include page="snippets/navmenu_registrazione.jsp">
        <jsp:param name="idLoggato" value="<%= idLoggato %>" />
        <jsp:param name="registrazione" value="2" />
      </jsp:include>

--%>
<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>

<%--
<html>
  <head>
--%>
  <%
  String context = request.getContextPath();
  String abbonato = "false";
  if(session.getAttribute("abbonato") != null && session.getAttribute("abbonato").equals("true"))
  {
    abbonato = "true";
  }

  %>

  <script type="text/javascript">
    function storeAndGoTo( page )
    {
      document.insertdati.action=page;
      document.insertdati.submit();
    }
  </script>


<%--
  </head>
  <body>
--%>
    <%
    int registrazione = Integer.parseInt( request.getParameter("registrazione") );
    String idLoggato = request.getParameter("idLoggato");

    long id = -1;
    if( idLoggato != null && ! idLoggato.equals("null") )
      id = Integer.parseInt(idLoggato);

    %>

      <table id="currentnext">
        <tr>
        <%
        if(id == -1 && registrazione == 1)
        {
        %>
          <td id="current" class="navLblSchedaReg">
            <div class="tab">
              <img src="${pageContext.request.contextPath}/View/img/tab-pink.png"></img>
              <a href="#">
                <fmt:message key="lnk.caratteristiche_della_struttura"/></a>
              </a>
            </div>
          </td>
          <td id="next1" class="navLblSchedaReg">
            <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
          </td>
          <td id="next2" class="navLblSchedaReg">
            <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
          </td>
          <td id="next3" class="navLblSchedaReg">
            <img src="${pageContext.request.contextPath}/View/img/tab-violet.png"></img>
          </td>
        <%
        }
        else
        {
          %>
          <td id="<%= (registrazione == 1) ? "current" : "next1" %>" class="navLblSchedaReg">
			      <div class="tab">
			       <img src="${pageContext.request.contextPath}/View/img/<%=(registrazione == 1) ? "tab-pink.png":"tab-violet.png"%>"></img>
			       <a href="#" onclick="storeAndGoTo('<%= context + response.encodeURL("/View/Registrazione1.jsp")%>')">
              <fmt:message key="lnk.caratteristiche_della_struttura"/>
             </a>
             </div>
          </td>
          <td id="<%= (registrazione == 3) ? "current" : "next2" %>" class="navLblSchedaReg">
           <div class="tab">
             <img src="${pageContext.request.contextPath}/View/img/<%=(registrazione == 3) ? "tab-pink.png":"tab-violet.png"%>"></img>
             <a href="#" onclick="storeAndGoTo('<%= context + response.encodeURL("/View/Registrazione3.jsp")%>')">
              <fmt:message key="lnk.descrizione_della_struttura"/>
             </a>
            </div>
          </td>
          <td id="<%= (registrazione == 2) ? "current" : "next3" %>" class="navLblSchedaReg">
          <div class="tab">
             <img src="${pageContext.request.contextPath}/View/img/<%=(registrazione == 2) ? "tab-pink.png":"tab-violet.png"%>"></img>
          <%
          if(abbonato.equals("false"))
          {
          %>
            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><fmt:message key="lnk.servizi_della_struttura"/></a>
          <%
          }
          else
          {%>
            <a href="#" onclick="storeAndGoTo('<%= context + response.encodeURL("/View/Registrazione2.jsp")%>')"><fmt:message key="lnk.servizi_della_struttura"/></a>
          <%
          }
          %>
          </div>

          </td>
          <td id="<%= (registrazione == 4) ? "current" : "next4" %>" class="navLblSchedaReg">
          <div class="tab">
             <img src="${pageContext.request.contextPath}/View/img/<%=(registrazione == 4) ? "tab-pink.png":"tab-violet.png"%>"></img>
          <%
          if(abbonato.equals("false"))
          {%>
            <a href="#" onclick="alert('l`accesso a questa pagina è riservato agli utenti abbonati')"><fmt:message key="lnk.disponibilita_della_struttura"/>
            </a>
          <%
          }
          else
          {%>
            <a href="#" onclick="storeAndGoTo('<%= context + response.encodeURL("/View/Registrazione4.jsp")%>')"><fmt:message key="lnk.disponibilita_della_struttura"/>
            </a>
          <%
          }
          %>
		  </div>
          </td>
          <%
        }
        %>
      </tr>
     </table>

<%--
  </body>
</html>
--%>
