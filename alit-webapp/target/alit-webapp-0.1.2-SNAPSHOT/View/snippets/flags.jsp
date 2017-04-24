<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


      <c:url var="change_to_it" value="/home.do">
        <c:param name="locale" value="it" />
      </c:url>
      <a href='<c:out value="${change_to_it}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/it.jpg" alt="it" title="it" /></a>

      <c:url var="change_to_en" value="/home.do">
        <c:param name="locale" value="en" />
      </c:url>
      <a href='<c:out value="${change_to_en}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/en.jpg" alt="en" title="en" /></a>

      <c:url var="change_to_de" value="/home.do">
        <c:param name="locale" value="de" />
      </c:url>
      <a href='<c:out value="${change_to_de}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/de.jpg" alt="de" title="de" /></a>

      <c:url var="change_to_fr" value="/home.do">
        <c:param name="locale" value="fr" />
      </c:url>
      <a href='<c:out value="${change_to_fr}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/fr.jpg" alt="fr" title="fr" /></a>

<%--
    <div class="flag">
      <c:url var="change_to_de" value="/home.do">
        <c:param name="locale" value="de" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_de}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/de.jpg" alt="de" title="de" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_fr" value="/home.do">
        <c:param name="locale" value="fr" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_fr}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/fr.jpg" alt="fr" title="fr" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_es" value="/home.do">
        <c:param name="locale" value="es" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_es}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/es.jpg" alt="es" title="es" /></a>
    </div>
 <div class="flag">
      <c:url var="change_to_ja" value="/home.do">
        <c:param name="locale" value="ja" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_ja}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/ja.jpg" alt="ja" title="ja" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_ru" value="/home.do">
        <c:param name="locale" value="ru" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_ru}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/ru.jpg" alt="ru" title="ru" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_nl" value="/home.do">
        <c:param name="locale" value="nl" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_nl}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/nl.jpg" alt="nl" title="nl" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_da" value="/home.do">
        <c:param name="locale" value="da" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_da}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/da.jpg" alt="da" title="da" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_zh" value="/home.do">
        <c:param name="locale" value="zh" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_zh}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/zh.jpg" alt="zh" title="zh" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_sv" value="/home.do">
        <c:param name="locale" value="sv" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_sv}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/sv.jpg" alt="sv" title="sv" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_sl" value="/home.do">
        <c:param name="locale" value="sl" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_sl}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/sl.jpg" alt="sl" title="sl" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_ro" value="/home.do">
        <c:param name="locale" value="ro" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_ro}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/ro.jpg" alt="ro" title="ro" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_pt" value="/home.do">
        <c:param name="locale" value="pt" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_pt}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/pt.jpg" alt="pt" title="pt" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_pl" value="/home.do">
        <c:param name="locale" value="pl" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_pl}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/pl.jpg" alt="pl" title="pl" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_no" value="/home.do">
        <c:param name="locale" value="no" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_no}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/no.jpg" alt="no" title="no" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_hr" value="/home.do">
        <c:param name="locale" value="hr" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_hr}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/hr.jpg" alt="hr" title="hr" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_fi" value="/home.do">
        <c:param name="locale" value="fi" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_fi}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/fi.jpg" alt="fi" title="fi" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_cs" value="/home.do">
        <c:param name="locale" value="cs" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_cs}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/cs.jpg" alt="cs" title="cs" /></a>
    </div>

    <div class="flag">
      <c:url var="change_to_hu" value="/home.do">
        <c:param name="locale" value="hu" />
      </c:url>
      &nbsp;&nbsp;
      <a href='<c:out value="${change_to_hu}"/>'>
      <img class="flags" src="${pageContext.request.contextPath}/View/css-ai/imgs/flags/hu.jpg" alt="hu" title="hu" /></a>
    </div>
--%>
