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
  String image = (String)request.getParameter("image");

  String sql = "select image_file from immagini where id_datiaziende=" + id + " and image_number='" + image + "'";

  try
  {
    InputStream inputStream;
    ResultSet rs;
    rs = DbmsImpl.getInstance().executeQuery(sql);

    if( rs == null ||  ! rs.next() )
      return;

    inputStream = rs.getBinaryStream("image_file");

    if(inputStream == null)
      return;

    response.setContentType("image/jpeg");
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