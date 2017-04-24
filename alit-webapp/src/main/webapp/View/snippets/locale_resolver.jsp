<%--
  <%@ include file="snippets/locale_resolver.jsp" %>
--%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <%
  String locale = (String) session.getAttribute("locale");
  if(locale == null)
  {
    locale = "it";
    session.setAttribute("locale", "it");
  }
  %>
  <fmt:setLocale value="<%=locale%>"/>
  <fmt:bundle basename="messages"></fmt:bundle>
