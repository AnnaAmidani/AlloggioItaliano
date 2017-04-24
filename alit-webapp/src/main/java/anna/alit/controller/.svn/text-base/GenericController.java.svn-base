package anna.alit.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.mvc.AbstractController;

public class GenericController extends AbstractController
{

  protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception
  {
    Map<String, Object> map = new HashMap<String, Object>();
    HttpSession session = request.getSession();
    SessionLocaleResolver slr = new SessionLocaleResolver();

    if (slr != null)
    {

      Locale locale = slr.resolveLocale(request);
      map.put("oldLocale", locale);

      String newLocaleName = ServletRequestUtils.getStringParameter(request, "locale");

      if (newLocaleName != null)
      {
        LocaleEditor localeEditor = new LocaleEditor();
        localeEditor.setAsText(newLocaleName);
        slr.setLocale(request, response, (Locale) localeEditor.getValue());
        session.setAttribute("locale", newLocaleName);
      }
      else
      {
        session.setAttribute("locale", "it");
      }
    }

    map.put("date", new Date());
    ModelAndView mav = new ModelAndView( response.encodeURL("/View/home.jsp"), map);

    return mav;
  }
}
