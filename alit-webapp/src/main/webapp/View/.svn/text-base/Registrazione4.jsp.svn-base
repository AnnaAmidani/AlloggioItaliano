<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  //response.sendRedirect(request.getContextPath() + response.encodeURL("doLog.jsp"));
}
%>
<%@ page import="
  anna.alit.servicebb.JspServiceImpl,
  java.util.ArrayList,
  anna.alit.servicexhtml.TendineXHTML,
  anna.alit.servicexhtml.TableXhtml,
  anna.alit.beanbb.HashBean,
  anna.alit.beanbb.HashBeanVector,
  anna.alit.servicebb.FormServiceImpl"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>

  <style type="text/css">
    body { cursor:default; }
  </style>

  <script type="text/javascript">
    function change(imm)
    {
      if(imm == 1)
        document.body.style.cursor='url(${pageContext.request.contextPath}/View/img/rev_paint1.gif), pointer';
      if(imm == 2)
        document.body.style.cursor='url(${pageContext.request.contextPath}/View/img/rev_paint2.gif), pointer';
      if(imm == 3)
        document.body.style.cursor='url(${pageContext.request.contextPath}/View/img/rev_paint3.gif), pointer';
      if(imm == 4)
        document.body.style.cursor='url(${pageContext.request.contextPath}/View/img/rev_paint4.gif), pointer';
      if(imm == 5)
        document.body.style.cursor='url(${pageContext.request.contextPath}/View/img/rev_paint5.gif), pointer';
      if(imm == 0)
        document.body.style.cursor='url(${pageContext.request.contextPath}/View/img/rev_paint0.gif), pointer';
    }
  </script>
  <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/View/javascript/calendario.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/View/javascript/validazioni.js"></script>
  <jsp:include page="snippets/head.jsp" >
      <jsp:param name="title" value="ttl.Registrazione4" />
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
               <fmt:message key="ttl.Registrazione4"/>
			   </a>
			 </h2>
			</div>
          <br/><br/>
	     <jsp:include page="snippets/navmenu_registrazione.jsp">
	        <jsp:param name="idLoggato" value="<%= idLoggato %>" />
	        <jsp:param name="registrazione" value="4" />
	      </jsp:include>

      <%
      HashBean beanLoggato = FormServiceImpl.getInstance().updateBeanLoggato(request);
      String id = "" + (Integer)session.getAttribute("idLoggato");
      %>
      <form  name="insertdati" class="general" action="" method="post">
       <br/>
        <div>
          Tabella per la gestione del calendario di apertura/chiusura, dei periodi di bassa/alta stagione, delle prenotazioni e della disponibilit&agrave; della struttura. Selezionare lo strumento adeguato e colorare i quadratini con un click.
        </div>
        <br/>


			<div class="calend_bkg">
             <div class="calend_bkg" >
		      <%= TableXhtml.getCalendarTable(beanLoggato, request.getContextPath()) %>
             </div>
            </div>

		<br/>

          <input type="hidden" name="selezionato" id="selezionato" value=""/>

          <table class="tab" frame="above">
            <tr>
              <td>
                <img id="1" src="${pageContext.request.contextPath}/View/img/cal_paint1.gif"
                  alt="colorazione1" onclick="change(1); document.insertdati.selezionato.value='1'" />
              </td>
              <td>
                struttura aperta e completamente libera<br/>con tariffa di bassa stagione</td>
              <td>
                <img id="3" src="${pageContext.request.contextPath}/View/img/cal_paint4.gif"
                  alt="colorazione3" onclick="change(4); document.insertdati.selezionato.value='4'"/>
              </td>
              <td>struttura in parte gi&agrave; prenotata<br/>e in parte disponibile</td>
              <td>
                <img id="6" src="${pageContext.request.contextPath}/View/img/cal_paint3.gif"
                  alt="colorazione5" onclick="change(3); document.insertdati.selezionato.value='3'"/>
              </td>
              <td>periodo di chiusura<br/>della struttura</td>
              <td colspan="2">
              </td>
            </tr><tr>
              <td>
                <img id="2" src="${pageContext.request.contextPath}/View/img/cal_paint2.gif"
                  alt="colorazione2" onclick="change(2); document.insertdati.selezionato.value='2'"/>
              </td>
              <td>struttura aperta e completamente libera<br/>con tariffa di alta stagione</td>
              <td>
                <img id="4" src="${pageContext.request.contextPath}/View/img/cal_paint5.gif"
                  alt="colorazione4" onclick="change(5); document.insertdati.selezionato.value='5'"/>
              </td>
              <td>struttura completamente prenotata<br/>e non pi&ugrave; disponibile</td>
              <td>
                <img id="5" src="${pageContext.request.contextPath}/View/img/cal_paint0.gif"
                  alt="colorazione5" onclick="change(0); document.insertdati.selezionato.value='0'"/>
              </td>
              <td>disponibilit&agrave; non stabilita<br/>della struttura</td>
            </tr>
          </table>
			<br/><br/>

<hr/>
			<br/><br/>
			<div>Tabella per la compilazione del prezziario. Periodi suddivisi in alta e bassa stagione. Prezzo per una giornata di soggiorno e prezzo (totale) per una settimana di soggiorno. La sigla <i>bc</i> indica bagno comune, mentre la sigla <i>bp</i> indica bagno privato. La sigla 1px indica una persona, mentre 2px due persone. Indicare ogni eventuale ulteriore specificazione nel campo <i>note</i></div>
			<br/>

	        <%= TableXhtml.getPricesTable(context, beanLoggato) %>

			<br/>
	        <b>note:</b>
	        <%
	          String note = beanLoggato.get("note");
	          if(note == null || note.length() == 0){
	            note = " ";
	          }
	        %>
	        <input name="note" id="note" type="text" maxlength="60" style="width:90%" value=" <%=note %> "/>

          <script type="javascript">
            initializeArrays();
          </script>
          <div id="divmesi"></div>
          <p align="center"><br/>
            <button type="submit" onclick="document.insertdati.action='${pageContext.request.contextPath}/Action'; write_divmesi(); document.insertdati.submit()">
              <span class="round_270"><span>registrate la disponibilit&agrave;</span></span>
            </button>
            &nbsp;&nbsp;
          </p>
          <input type="hidden" name="pagina" id="pagina" value="Registrazione4.jsp"/>
          <input type="hidden" name="actiontype" id="actiontype" value="insert4"/>
        </form>



		  </div>
		</div>
	 </div>
     <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.Registrazione4" />
       <jsp:param name="header_text" value="hdr.registrazione_4" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>