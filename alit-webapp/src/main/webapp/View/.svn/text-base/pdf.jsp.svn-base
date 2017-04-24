<%@ page language = "java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="
  java.sql.*,
  java.io.*,
  java.util.*,
  org.apache.commons.io.IOUtils,
  anna.alit.servicebb.DbmsImpl,
  anna.alit.utilities.Breakpoint"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
  <%
  String id = (String)request.getParameter("id_azienda");

  String sql = "select brochure, file_title from brochure where id_aziende=" + id;

  try
  {
    InputStream inputStream;
    ResultSet rs;
    rs = DbmsImpl.getInstance().executeQuery(sql);
    String filename;

    if( rs == null ||  ! rs.next() )
      return;

    inputStream = rs.getBinaryStream("brochure");
    filename = rs.getString("file_title");

    if(inputStream == null || filename == null)
      return;

    byte[] buffer = new byte[ inputStream.available() ];

    int byteLetti=inputStream.read(buffer, 0, buffer.length);

    ServletOutputStream output = response.getOutputStream();

    response.reset();

    response.setHeader("Content-disposition", "attachment; filename=" + filename);
    response.setContentType("application/pdf");
    output.write(buffer, 0, buffer.length);
    output.flush();

  }
  catch (SQLException e)
  {
    e.printStackTrace();
  }
  %>
</body>
</html>