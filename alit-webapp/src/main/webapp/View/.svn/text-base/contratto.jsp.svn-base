<%@ page language = "java" contentType="text/html; charset=utf-8" %>
<%@ include file="snippets/locale_resolver.jsp" %>
<% String context = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<jsp:include page="snippets/head.jsp" >
    <jsp:param name="title" value="ttl.contratto" />
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
               <fmt:message key="ttl.contratto"/>
			   </a>
			 </h2>
			</div>

			<div>
			<br/>
			Gentile utente, <br/>
			per poter utilizzare il tuo account di Alloggio Italiano &egrave; necessario accettarne il regolamento e dare il consenso all'informativa sulla privacy.
			</div>

          <form name="check" action="${pageContext.request.contextPath}/Action" method="post">
            <input type="hidden" name="actiontype" value="checklogin" />
            <div style="font-size:9pt">
            <br/>
              <a href="${pageContext.request.contextPath}/docs/RegolamentoAlloggioItaliano.pdf">
               <b>condizioni del contratto</b>
              </a>
              &nbsp;&nbsp;<b>accetto<input type="radio" name="contratto" value="si"/></b>
              &nbsp;&nbsp;<b>non accetto<input type="radio"  name="contratto" checked="checked" value="no"/></b>
			</div>

            <div style="font-size:9pt">
              <br/><br/>
              <%@ include file="../View/text/privacy.html" %>
            </div>

           <br/><br/>
            <img class="mail" src="${pageContext.request.contextPath}/kaptcha.jpg" />
            <br/><br/>
            <fmt:message key="prm.digitare_i_caratteri_nell_immagine_"/>&nbsp;
            <input type="text" class="smusso" size="12" name="kaptcha" value="" />
            <br/><br/>

            <br/><br/>
                <button id="Subn" type="submit" value="Enter">
                  <span class="round_170"><span>Invio</span></span>
                </button>

		</form>

     </div>
	</div>
	 </div>
	 <jsp:include page="snippets/new_right.jsp">
       <jsp:param name="title" value="ttl.contratto" />
       <jsp:param name="header_text" value="hdr.contratto" />
     </jsp:include>
     <jsp:include page="snippets/new_footer.jsp" />
  </div>
</div>
</div>
</body>
</html>