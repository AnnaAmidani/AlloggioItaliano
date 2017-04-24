<%@ page language = "java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="snippets/locale_resolver.jsp" %>
<%@ page import="
  java.sql.*,
  java.io.*,
  java.util.*,
  org.apache.commons.io.IOUtils,
  anna.alit.servicebb.DbmsImpl,
  anna.alit.utilities.Breakpoint"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
  <%
  String posizione = (String)request.getParameter("posizione");
  String regione = (String)request.getParameter("regione");
  String tipologia = (String)request.getParameter("tipologia");

  String sql = "select " + posizione + ", link, filename from banners where regione='" + regione
                + "' and tipologia='" + tipologia + "' and "+posizione+" is not null";

  String link = "";
  try
  {
    InputStream inputStream;
    String filename;
    ResultSet rs;
    rs = DbmsImpl.getInstance().executeQuery(sql);

    if( rs == null ||  ! rs.next() )
      return;

    inputStream = rs.getBinaryStream(posizione);
    filename = rs.getString("filename");
    link = rs.getString("link");

    if(posizione.equals("bannerdx"))
      session.setAttribute("link", link);
    if(posizione.equals("bannersx"))
      session.setAttribute("linksx", link);

    if(inputStream == null)
      return;
    if(filename != null)
      filename = filename.substring(filename.lastIndexOf('.')+1);

    response.setContentType("image/"+filename);
    ServletOutputStream output = response.getOutputStream();
    response.reset();

    IOUtils.copy(inputStream, output);

  }
  catch (SQLException e)
  {
    e.printStackTrace();
  }
  %>
</body>
</html>