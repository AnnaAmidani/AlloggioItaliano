/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Locale;
import javax.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import anna.alit.beanbb.ParamsMap;


import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;


/**
 *
 * @author mic
 * @created May 20, 2009
 */
@Service("emailMessageProducer")
public class FreemarkerEmailMessageProducer
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired private FreeMarkerConfig freeMarkerConfiguer;

  private TemplateLoader templateLoader;


  /**
   *
   *
   * @author mic
   * @created May 20, 2009
   */
  static interface TemplateLoader
  {
    Template load(final String name, final Locale locale, final MailFormat format) throws IOException;
  }


  /**
   *
   *
   * @author mic
   * @created May 20, 2009
   */
  static class DefaultTemplateLoader implements TemplateLoader
  {
    private FreeMarkerConfig config;
    private String prefix;
    private String suffix;


    /*
     *
     */
    public DefaultTemplateLoader(final String prefix, final String suffix, final FreeMarkerConfig config)
    {
      this.config = config;
      this.prefix = prefix;
      this.suffix = suffix;
    }


    /*
     *
     */
    private String resolveTemplateName(final String name, final Locale locale, final MailFormat format)
    {
      StringBuilder result = new StringBuilder(50);
      result.append(prefix);
      result.append(locale.getLanguage());
      result.append("_");
      result.append(locale.getCountry());
      result.append("/");
      result.append(name);
      result.append("_");
      result.append(format.toString());
      result.append(suffix);
      return result.toString();
    }


    /*
     * @see mic.contacta.webapp.FreemarkerEmailMessageProducer.TemplateLoader#load(String, Locale, MailFormat)
     */
    @Override
    public Template load(final String name, final Locale locale, final MailFormat format) throws IOException
    {
      Configuration configuration = config.getConfiguration();
      return configuration.getTemplate(resolveTemplateName(name, locale, format));
    }
  }


  /*
   *
   */
  public FreemarkerEmailMessageProducer()
  {
  }


  /*
   *
   */
  @PostConstruct
  public void setup() throws Exception
  {
    this.templateLoader = new DefaultTemplateLoader("", ".ftl", freeMarkerConfiguer);
  }


  /*
   *
   */
  private Template attemptLoad(final String templateName, final Locale locale, final MailFormat format)
  {
    try
    {
      return this.templateLoader.load(templateName, locale, format);
    }
    catch (IOException e)
    {
      log().warn(e.getMessage());
      return null;
    }
  }


  public EmailMessage produce(String emailTemplateCode, Locale locale, MailFormat format, ParamsMap arguments)
  {
    EmailMessage message = new EmailMessage();
    Template template = attemptLoad(emailTemplateCode, locale, format);
    if (template == null)
    {
      throw new RuntimeException("Cannot load email template.");
    }

    try
    {
      StringWriter body = new StringWriter();
      template.process(arguments, body);
      message.setBody(body.toString());
    }
    catch (TemplateException e)
    {
      log().warn(e.getMessage(), e);
      // handle it
      return null;
    }
    catch (IOException e)
    {
      // impossible!
    }
    return message;
  }


}
