<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<%
if(session.getAttribute("logged_user") == null || !session.getAttribute("logged_user").equals("true"))
{
  response.sendRedirect(request.getContextPath() + response.encodeURL("View/doLog.jsp"));
}
%>
<% String context = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp" >
    <jsp:param name="title" value="ttl.abbonamento" />
  </jsp:include>
</head>
<body>
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
               <fmt:message key="ttl.abbonamento"/>
			   </a>
			 </h2>
			</div>


      <div class="pay_left">
      <br/>
        <table class="pay_1">
         <tr>
          <td>
          L'abbonamento annuale ad Alloggio Italiano costa soltanto 12,10 euro (iva inclusa) e vi permette
          l'accesso totale alle funzioni avanzate dei servizi aggiuntivi:
          </td>
          </tr>
          <tr>
          <td>&nbsp;</td>
          </tr>
          <tr>
          <td>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;compilazione dei campi relativi ai servizi offerti</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;caricamento di un allegato in pdf</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;collegamenti a youtube, facebook, myspace, flickr</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;inserimento informazioni in inglese oltre all'italiano</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;compilazione del listino prezzi della struttura</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;gestione del calendario di disponibilit&agrave; della struttura</b><br/>
            <!-- <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;inserimento di banners pubblicitari a libera scelta</b><br/> -->
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;pubblicazione di segnalazioni relative a feste o fiere</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;pubblicazione di segnalazioni relative a eventi o spettacoli</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;pubblicazione di segnalazioni relative a corsi o percorsi</b><br/>
            <b><img src="${pageContext.request.contextPath}/View/img/li.gif" width="10px"/>&nbsp;&nbsp;pubblicazione di segnalazioni relative a mostre o musei</b><br/>
          </td>
          </tr>
          <tr>
          <td>&nbsp;</td>
          </tr>
          <tr>
          <td>
          potrete quindi usufruire di notevoli vantaggi, comparendo nei risultati delle ricerche avanzate effettuate
          dagli utenti, con un conseguente aumento del punteggio e un avanzamento di posizione nella ricerca ordinata
          per tale criterio.
          </td>
         </tr>
        </table>
      </div>

      <div class="pay_right">
        <table border="0">
        <tr>
        <td>
        Di seguito le diverse modalit&agrave; per effettuare il pagamento. Si invita a inviare una <a href="mailto:postmaster@alloggioitaliano.it">mail</a> per accelerare i tempi di attivazione.
        </td>
        </tr>
        </table>
        <br/>
        <table class="pay_3">
        <!-- <tr>
         <td class="colorViolet">
          <b><img src="${pageContext.request.contextPath}/View//img/li.gif" width="10px"/>&nbsp;&nbsp;bollettino postale:</b>
         </td>
        </tr>
        <tr>
         <td>
          <div id="bollettino" style="display:block" class="sub_payments">
          su c/c postale numero 98974561<br/>
          intestato a goldberg sas<br/>
          via vajo, 17 - 37022 fumane (VR)<br/>
          scrivere nella causale a quale tipologia appartiene la vostra<br/>
          struttura / la sua denominazione / il comune / la provincia<br/>
          </div>
         </td>
        </tr> -->
        </table>
        <table class="pay_3">
        <tr>
         <td class="colorViolet">
          <b><img src="${pageContext.request.contextPath}/View//img/li.gif" width="10px"/>&nbsp;&nbsp;bonifico bancario:</b>
         </td>
        </tr>
        <tr>
         <td>
          <div id="bonifico" style="display:block" class="sub_payments">
          IBAN IT71 C030 6234 2100 0000 0493 647<br/>
          intestato a Anna Amidani<br/>
          scrivere nella causale a quale tipologia appartiene la vostra<br/>
          struttura / la sua denominazione / il comune / la provincia<br/>
          </div>
         </td>
        </tr>
        </table>
        <table class="pay_3">
        <tr>
         <td class="colorViolet">
          <b><img src="${pageContext.request.contextPath}/View//img/li.gif" width="10px"/>&nbsp;&nbsp;paypal:</b><br/>
         </td>
        </tr>
        <tr>
         <td>
          <div id="paypal" style="display:block" class="sub_payments">
          Visa, MasterCard, PostePay, AmericanExpress, Aura<br/>
          scrivere nella causale a quale tipologia appartiene la vostra<br/>
          struttura / la sua denominazione / il comune / la provincia<br/><br/>

          <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
          <input type="hidden" name="cmd" value="_s-xclick"/>
          <input type="hidden" name="business" value="anna.amidani@hotmail.it"/>
		  <input type="hidden" name="hosted_button_id" value="7X46K3MXZFWGJ">
          <input type="hidden" name="lc" value="IT"/>
          <input type="hidden" name="item_name" value="abbonamento"/>
          <input type="hidden" name="amount" value="12.10"/>
          <input type="hidden" name="currency_code" value="EUR"/>
          <input type="hidden" name="button_subtype" value="services"/>
          <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest"/>
          <input type="image" src="https://www.paypal.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!"/>
          <img alt="" border="0" src="https://www.paypal.com/it_IT/i/scr/pixel.gif" width="10" height="10"/><br/>
          <input type="hidden" name="on0" value="Causale:"/>
          <input type="text" name="os0" maxlength="60"/>&nbsp;Causale
          </form>
          </div>
         </td>
        </tr>
        </table>
      </div>


     </div>
	</div>
	 </div>
	 <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.abbonamento" />
       <jsp:param name="header_text" value="hdr.abbonamento" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>