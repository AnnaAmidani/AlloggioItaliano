<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="
  javax.servlet.http.HttpSession,
  anna.alit.servicebb.DbmsImpl,
  javax.servlet.RequestDispatcher,
  anna.alit.utilities.UtilService,
  anna.alit.beanbb.HashBeanVector"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
</head>
<body>
<%
   String r = (String) request.getParameter("regione");
   String s = (String) request.getParameter("sigla");
   String c = (String) request.getParameter("comune");

   if(r != null) r = r.replaceAll("-", " ").replaceAll("_", "\\`");
   if(c != null) c = c.replaceAll("-", " ").replaceAll("_", "\\`");

   HashBeanVector esito;

   String[] campiOutput = new String[] { "id", "denominazione", "tipoesteso", "regione", "comune", "sigla", "numcamere", "numlettitot", "prezzomedio", "scontodel" };

   String query = (String)session.getAttribute("query");
   esito = DbmsImpl.getInstance().executeQuery(query, campiOutput);

   session.setAttribute("query", query);

   String[] idArray = new String[0];
   String[] denominazioneArray = new String[0];
   String[] tipoestesoArray = new String[0];
   String[] regioneArray = new String[0];
   String[] comuneArray = new String[0];
   String[] siglaArray = new String[0];
   String[] numcamereArray = new String[0];
   String[] numlettitotArray = new String[0];
   String[] prezzomedioArray = new String[0];
   String[] scontodelArray = new String[0];

   if( esito != null && esito.size() != 0 )
   {
     idArray = esito.getAsArray("id");
     denominazioneArray = esito.getAsArray("denominazione");
     tipoestesoArray = esito.getAsArray("tipoesteso");
     regioneArray = esito.getAsArray("regione");
     comuneArray = esito.getAsArray("comune");
     siglaArray = esito.getAsArray("sigla");
     numcamereArray = esito.getAsArray("numcamere");
     numlettitotArray = esito.getAsArray("numlettitot");
     prezzomedioArray = esito.getAsArray("prezzomedio");
     scontodelArray = esito.getAsArray("scontodel");
   }

   session.setAttribute("id", idArray);
   session.setAttribute("denominazione", denominazioneArray);
   session.setAttribute("tipoesteso", tipoestesoArray);
   session.setAttribute("regione", regioneArray);
   session.setAttribute("comune", comuneArray);
   session.setAttribute("sigla", siglaArray);
   session.setAttribute("numcamere", numcamereArray);
   session.setAttribute("numlettitot", numlettitotArray);
   session.setAttribute("prezzomedio", prezzomedioArray);
   session.setAttribute("scontodel", scontodelArray);

   String re = (String) request.getParameter("regione");
   String si = (String) request.getParameter("sigla");
   String co = (String) request.getParameter("comune");

   String url = "/View/alloggioRis.jsp";
   if(re != null) re = re.replaceAll(" ", "-").replaceAll("\\`", "-");
   if(si != null) si = si.replaceAll(" ", "-").replaceAll("\\`", "-");
   if(co != null) co = co.replaceAll(" ", "-").replaceAll("\\`", "-");
   if( re != null )
   {
     url += "?";
     url += "regione="+re;
   if(si != null) url += "&sigla="+si;
   if(co != null) url += "&comune="+co;
   }

   RequestDispatcher dispatcher = request.getRequestDispatcher(response.encodeURL(url));
   dispatcher.forward(request, response);

%>
</body>
</html>