<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="locale_resolver.jsp" %>
<%
	String title = request.getParameter("title");
	String header_text = request.getParameter("header_text");

	String tit = "tit."+title;
	String dsc = "dsc."+title;
	String kws = "kws."+title;
%>

  <script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-20226083-1']);
  _gaq.push(['_trackPageview']);
  (function()
  {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  </script>
  <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
  <meta name="google-site-verification" content="La26X-zQeZnmovge6HfJCa1yjQrzC8GLW2WrQZ7U6ww" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta http-equiv=reply-to content="an5tash@gmail.com" />
  <meta name="author" content="Anna Amidani" />
  <meta name="description" content="<fmt:message key="<%=dsc%>"/>" />
  <meta name="keywords" content="<fmt:message key="<%=kws%>"/>" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/css-ai/style_new.css" media="screen" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/View/img/AlloggioItaliano.ico" />
  <title><fmt:message key="<%=tit%>"/></title>
