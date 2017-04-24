<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  response.sendRedirect(request.getContextPath() + response.encodeURL("doLog.jsp"));
}
String abbonato = "false";
if(session.getAttribute("abbonato") != null && session.getAttribute("abbonato").equals("true"))
{
  abbonato = "true";
}
%>
<%@ page import="
  java.util.ArrayList,
  anna.alit.servicebb.JspServiceImpl,
  anna.alit.servicexhtml.TendineXHTML,
  anna.alit.beanbb.HashBean,
  anna.alit.beanbb.HashBeanVector,
  anna.alit.servicebb.FormServiceImpl"
%>



<%!
public String getStyle(int[] imageDimension)
{
  int width = 0, height = 0, left = 0, top = 0;
  double scale;

  width = imageDimension[0];
  height = imageDimension[1];
  if(width > height)
  {
    scale = 103.0 / width;
    width = 103;
    height = (int) (height * scale);
    top = (103 - height) / 2;
  }
  else
  {
    scale = 103.0 / height;
    height = 103;
    width = (int) (width * scale);
  }

  return "position: relative; " +
         "top: " + top + "px; " +
         "left: " + left + "px; " +
         "width: " + width + "px; " +
         "height: " + height + "px; " +
         "display: block; " +
         "margin-left: auto; " +
         "margin-right: auto; ";
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/View/css-ai/gallery.css" type="text/css" media="all" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/gallery.js"></script>
  <script language="javascript">
  function abbonato(id)
  {
    if(document.getElementById('abbonato').value == 'false')
    {
      document.getElementById(id).disabled=true;
      alert('L`inserimento di questo dato è riservato agli utenti abbonati');
    }
  }
  </script>
  <script language="javascript">
  function showBox()
  {
    var lang = document.getElementById('linguadesc').value;
    if(lang == "en")
    {
    document.getElementById('descrizione_ita').style.display="none";
    document.getElementById('descrizione_eng').style.display="inline";
    }
    else
    {
    document.getElementById('descrizione_ita').style.display="inline";
    document.getElementById('descrizione_eng').style.display="none";
    }
  }
  </script>
<jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.Registrazione3" />
  </jsp:include>
</head>
<body>

<% String context = request.getContextPath(); %>
<% Integer idLoggato = (Integer) session.getAttribute("idLoggato"); %>

<div id="wrapper">
<div id="wrapper_inner">
  <jsp:include page="snippets/new_header.jsp"/>
  <div id="main">
	<div class="left" id="content">
		<div id="content_inner">
		  <div class="post">

			<div class="post_title">
			 <h2>
			   <a href="#">
               <fmt:message key="ttl.Registrazione3"/>
			   </a>
			 </h2>
			</div>
          <br/><br/>
	     <jsp:include page="snippets/navmenu_registrazione.jsp">
	        <jsp:param name="idLoggato" value="<%= idLoggato %>" />
	        <jsp:param name="registrazione" value="3" />
	      </jsp:include>


       <input type="hidden" name="abbonato" id="abbonato" value="<%=abbonato%>" />

      <%
      HashBean beanLoggato = FormServiceImpl.getInstance().updateBeanLoggato(request);
      String id = "" + (Integer)session.getAttribute("idLoggato");
      %><!-- iso-8859-1 -->
      <form name="insertdati" id="insertdati" class="general" accept-charset="" action="" method="post">
      <br/><br/>
              <div id="tasto1" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=01")%>'">
                <div id="user">
                  <%
                  int[] imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "01");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=01&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=01")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[copertina] <%
                  }
                  %>
                </div>
               </div>
              <div id="tasto2" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=02")%>'">
                <div id="user1">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "02");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=02&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=02")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[2] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto3" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=03")%>'">
                <div id="user2">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "03");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=03&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=03")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[3] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto4" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=04")%>'">
                <div id="user3">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "04");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=04&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=04")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[4] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto5" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=05")%>'">
                <div id="user4">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "05");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=05&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=05")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[5] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto6" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=06")%>'">
                <div id="user5">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "06");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=06&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=06")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[6] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto7" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=07")%>'">
                <div id="user6">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "07");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=07&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=07")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[7] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto8" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=08")%>'">
                <div id="user7">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "08");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=08&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=08")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[8] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto9" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=09")%>'">
               <div id="user8">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "09");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=09&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=09")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[9] <%
                  }
                  %>
                </div>
              </div>
              <div id="tasto10" class="color0" onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=10")%>'">
                <div id="user9">
                  <%
                  imageDimension = JspServiceImpl.getInstance().imageDimensions(id, "10");
                  if( imageDimension[0] != 0 && imageDimension[1] != 0)
                  {
                    %>
                    <div class="adatta">
                      <img src="<%=request.getContextPath()%>/View/image.jsp?image=10&id_azienda=<%= id %>" style="<%= getStyle(imageDimension) %>"
                        onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=10")%>'"/>
                    </div>
                    <%
                  }
                  else
                  {
                    %> <br/>Allegate immagine <br/>[10] <%
                  }
                  %>
                </div>
              </div>

          <div style="clear:both;">&nbsp;</div>

          <table>
          <tr>
            <td class="geo" rowspan="4">
              <div id="perAcrobat"
              <%
              if(abbonato.equals("false"))
              {%>
                onclick="alert('L`inserimento della brocure è riservato agli utenti abbonati')">
              <%
              }
              else
              {%>
                onclick="location.href='<%= context + response.encodeURL("/View/carica.jsp?imagename=20")%>'">
              <%
              }
              %>
                Allegate brochure in pdf
              </div>
              <br/><br/>
              <p><u>COLLEGAMENTI WEB ESTERNI</u></p>
              <b>youtube:</b>
              <br/>
              <input onclick="abbonato('youtube')" type="text" name="youtube" id="youtube" size="27" class="smusso"
                <%
                String youtube = beanLoggato.get("youtube");
                if(youtube != null)
                {
                  out.println("value=\"" + youtube + "\"");
                }
                %>
              />
              <br/><br/>
              <b>myspace:</b>
              <br/>
              <input onclick="abbonato('myspace')" type="text" name="myspace"  id="myspace" size="27" class="smusso"
                <%
                String myspace = beanLoggato.get("myspace");
                if(myspace != null)
                {
                  out.println("value=\"" + myspace + "\"");
                }
                %>
              />
              <br/><br/>
              <b>flickr:</b>
              <br/>
              <input onclick="abbonato('flickr')" type="text" name="flickr" id="flickr" size="27" class="smusso"
                <%
                String flickr = beanLoggato.get("flickr");
                if(flickr != null)
                {
                  out.println("value=\"" + flickr + "\"");
                }
                %>
              />
              <br/><br/>
              <b>facebook:</b>
              <br/>
              <input onclick="abbonato('facebook')" type="text" name="facebook" id="facebook" size="27" class="smusso"
                <%
                String facebook = beanLoggato.get("facebook");
                if(facebook != null)
                {
                  out.println("value=\"" + facebook + "\"");
                }
                %>
              />
              <br/><br/><br/><br/>
              <p><u>COORDINATE SATELLITARI</u></p>
              <b>latitudine nord:</b>
              <br/>
              <input onclick="abbonato('latitudine')" name="latitudine" id="latitudine" type="text" class="smusso" size="16"
                <%
                String latitudine = beanLoggato.get("latitudine");
                if(latitudine != null)
                {
                  out.println("value=\"" + latitudine + "\"");
                }
                %>
              />
              <br/><br/>
              <b>longitudine est:</b>
              <br/>
              <input onclick="abbonato('longitudine')" name="longitudine" id="longitudine" type="text" class="smusso" size="16"
                <%
                String longitudine = beanLoggato.get("longitudine");
                if(longitudine != null)
                {
                  out.println("value=\"" + longitudine + "\"");
                }
                %>
              />
              <br/>
            </td>

          </tr>
          </table>
          <br/><br/>
          <table>
          <tr>
            <td align="center">
              <br/>
              <font color="black">
                <i>Inserisci nella la textarea un testo descrittivo della tua struttura</i>
              </font>
            </td>
          </tr>
          <tr>
            <td id="it" align="center" style="height: 200px; background-color:white; -moz-border-radius:10px; border:1.5pt outset;">
              <%
              String descrizione = beanLoggato.get("descrizione_ita");
              if(descrizione == null)
                descrizione = " ";
              %>
              <textarea id="descrizione_ita" class="descrReset" name="descrizione_ita"><%=descrizione%></textarea>
              <%
              String descrizione_eng = beanLoggato.get("descrizione_eng");
              if(descrizione_eng == null)
                descrizione_eng = " ";
              %>
              <textarea id="descrizione_eng" style="display:none;" class="descrReset" name="descrizione_eng"><%=descrizione_eng%></textarea>
            </td>
          </tr>
          <tr>
            <td align="left" ><br/><b>lingua descrizione:</b>
            <%
            if(abbonato.equals("true"))
            {
            %>
              <select class="smusso" onchange="showBox()" id="linguadesc">
                <option value="it">italiano</option>
                <option value="en">inglese</option>
              </select>
            <%
            }
            else
            {
            %>
              <select class="smusso" id="linguadesc">
                <option value="it">italiano</option>
              </select>
            <%
            }
            %>
            </td>
          </tr>
        </table>

        <!-- setto il parametro 'pagina' per prossimo aggiornamento del beanLoggato dalla request -->
        <input type="hidden" id="pagina" name="pagina" value="Registrazione3.jsp" />
        <input type="hidden" name="actiontype" value="insert3"/>

        <p align="center"><br/><br/>
          <button type="submit" onclick="document.insertdati.action='${pageContext.request.contextPath}/Action'; write_divmesi(); document.insertdati.submit()">
            <span class="round_270"><span>registrate la descrizione</span></span>
          </button>
          &nbsp;&nbsp;
        </p>
      </form>



		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.Registrazione3" />
       <jsp:param name="header_text" value="hdr.registrazione_3" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>