<%--
Stampa il menu laterale destro.
Per includere la pagina utilizzare:
  <jsp:include page="snippets/right_navigation.jsp" />
--%>

<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>

  <%
  String context = request.getContextPath();
  %>

    <ul>
    <%String url; %>

        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Abruzzo"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Abruzzo
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Basilicata"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Basilicata
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Calabria"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Calabria
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Campania"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Campania
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Emilia-Romagna"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Emilia Romagna
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Friuli-Venezia-Giulia"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Friuli
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Lazio"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Lazio
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Liguria"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Liguria
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Lombardia"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Lombardia
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Marche"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Marche
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Molise"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Molise
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Piemonte"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Piemonte
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Puglia"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Puglia
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Sardegna"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Sardegna
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Sicilia"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Sicilia
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Toscana"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Toscana
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Trentino-Alto-Adige"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Trentino Alto Adige
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Umbria"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Umbria
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Valle-d_Aosta"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Valle Aosta
          </a>
        </li>


        <% url =  context + response.encodeURL("/View/simplesearch.jsp?regione=Veneto"); %>
        <li class="nav-off" onmouseover="this.className='nav-on'" onmouseout="this.className='nav-off'"
          onclick="location.href='<%= url %>'" >
          <a href="<%= url %>" >
            Veneto
          </a>
        </li>

    </ul>

