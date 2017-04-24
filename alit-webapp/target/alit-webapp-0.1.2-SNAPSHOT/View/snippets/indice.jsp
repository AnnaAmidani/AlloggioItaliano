<%--
Stampa l'indice delle pagine-risultato di una ricerca:

per includere la pagina utilizzare:

  <jsp:include page="snippets/indice.jsp" >
    <jsp:param name="url" value="/View/xxxXxxx.jsp?pagina=" />
    <jsp:param name="pagina" value="<%= pagina %>" />
    <jsp:param name="maxpagine" value="<%= maxpagine %>" />
  </jsp:include>

--%>

  <%
  String context = request.getContextPath();
  String url = request.getParameter("url");
  String pagina_str = request.getParameter("pagina");
  String maxpagine_str = request.getParameter("maxpagine");
  int pagina = (pagina_str == null) ? 0 : Integer.parseInt( pagina_str );
  int maxpagine = (maxpagine_str == null) ? 0 : Integer.parseInt( maxpagine_str );
  %>

  <!-- start indice -->
  <b> <a href="<%= context + response.encodeURL( url + "1") %>"> first </a> </b> &nbsp;
  <%
  if( pagina > 1 )
      { %> <b><i> <a href="<%= context + response.encodeURL( url + (pagina -1) ) %>"> prev </a> </i></b> &nbsp; <% }
  for(int i = 4; i >= 1; i--)
  {
    if(pagina > i)
      { %> <b><i> <a href="<%= context + response.encodeURL( url + (pagina - i) ) %>"> <%= (pagina-i) %> </a> </i></b> &nbsp; <% }
  }
  %> <b> <%=pagina %> &nbsp; </b> <%
  for(int i = 1; i <= 4; i++)
  {
    if(pagina+i <= maxpagine)
      { %> <b><i> <a href="<%= context + response.encodeURL( url + (pagina + i) ) %>"> <%= (pagina+i) %> </a> </i></b> &nbsp; <% }
  }
  if(pagina < maxpagine)
      { %> <b><i> <a href="<%= context + response.encodeURL( url + (pagina + 1) ) %>"> next </a> </i></b> &nbsp; <% }
  %>
  <b> <a href="<%= context + response.encodeURL( url + maxpagine ) %>">last</a> </b> &nbsp;
  <!-- end indice -->
