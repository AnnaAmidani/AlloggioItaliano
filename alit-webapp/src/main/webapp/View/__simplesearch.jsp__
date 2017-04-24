<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="
  javax.servlet.http.HttpSession,
  anna.alit.servicebb.DbmsImpl,
  javax.servlet.RequestDispatcher,
  anna.alit.beanbb.HashBeanVector"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
//   HttpSession session = request.getSession();
   String value = (String) request.getParameter("regione");
   if(value != null) value = value.replaceAll("-", " ").replaceAll("_", "\\`");


   HashBeanVector esito;

   String[] campiOutput = new String[] { "id", "denominazione", "tipoesteso", "regione", "comune", "sigla", "numcamere", "numlettitot", "prezzomedio", "scontodel" };

   String select = " SELECT distinct provincia.regione, datiaziende.id, denominazione, datiaziende.tipoesteso, datiaziende.comune, datiaziende.sigla, annofondazione, kmcapoluogo, numcamere, numlettitot, prezzomedio, scontodel, punteggio, random() \n";
   String from = " FROM datiaziende, caratteristiche, provincia \n";
   String orderby = " ORDER BY random()";
   String where = "WHERE datiaziende.id = caratteristiche.id_azienda_est AND datiaziende.sigla = provincia.sigla AND provincia.regione='" + value + "'  "; //non rimuovere lo spazio in più!!!!!! workaround :-)

   String query = select + from + where + orderby;
   esito = DbmsImpl.getInstance().executeQuery(query, campiOutput);

   session.setAttribute("query", select + from + where);

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

   String value2 = (String) request.getParameter("regione");
   if(value2 != null) value2 = value2.replaceAll(" ", "-").replaceAll("\\`", "_");

   RequestDispatcher dispatcher = request.getRequestDispatcher(response.encodeURL("numeroRisultati.jsp?regione="+value2+""));
   dispatcher.forward(request, response);
%>
</body>
</html>