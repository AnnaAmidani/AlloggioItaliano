package anna.alit.jee;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JSessionFilter implements Filter {

	static private Logger log;

	@SuppressWarnings("static-access")
	protected Logger log()
	{if (this.log == null) this.log = LoggerFactory.getLogger(this.getClass()); return this.log;}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
	{
		if(!(request instanceof HttpServletRequest))
		{
		  chain.doFilter(request, response);
		  return;
		}

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		if (httpRequest.isRequestedSessionIdFromURL())
		{
			log().info("Trovato identificativo di sessione nella url");
			HttpSession session = httpRequest.getSession();
//			if (session != null)
//			{
//			  session.invalidate();
//			  log().info("sessione invalidata");
//			}
		}

		HttpServletResponseWrapper wrappedResponse = new HttpServletResponseWrapper(httpResponse)
		{
			@Override
			public String encodeRedirectUrl(String url)
			{
			  return url;
			}

			@Override
			public String encodeRedirectURL(String url)
			{
			  return url;
			}

			@Override
			public String encodeUrl(String url)
			{
			  return url;
			}

			@Override
			public String encodeURL(String url)
			{
			  return url;
			}
		};

		chain.doFilter(request, wrappedResponse);
	}

	public void init(FilterConfig config) throws ServletException
	{
	}

	public void destroy()
	{
	}
}