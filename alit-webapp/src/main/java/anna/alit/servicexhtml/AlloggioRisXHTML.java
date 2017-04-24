package anna.alit.servicexhtml;

import java.io.File;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.servicebb.JspServiceImpl;

public class AlloggioRisXHTML {

  public static String getTableRow(
          String ctx, String folder, String[] denominazione, String[] id, String[] tipoesteso, String[] regione, String[] comune, String[] sigla,
          String[] numcamere, String[] numlettitot, String[] prezzomedio, String[] scontodel,  int index)
  {
      String s = File.separator;
      if(!folder.endsWith(s))
          folder += s;

      String imm = "";

      if(JspServiceImpl.getInstance().imagePresent(id[index], "01"))
      {
          imm = "<img src=\""+ctx+"/View/image.jsp?image=01&id_azienda=" + id[index]
                + "\" class=\"xxx\" onclick=\"ChargeScheda('scheda1.jsp?id="
                + id[index] + "');\" />";
      }
      else
      {
          imm = "";
      }


      String c = comune[index].replaceAll(" ", "-").replaceAll("\\`", "-").replaceAll("--", "-");
      String d = denominazione[index].replaceAll(" / ", "/").replaceAll(" ", "-").replaceAll("\\`", "-").replaceAll("--", "-");

      String tableRow = ""
          + "<div class=\"foto_text_left\">"
          + "<div class=\"foto_text_ev\"><img src=\""+ctx+"/View/img/li.gif\" width=\"10px\"/>&nbsp;<strong><a href=\""+ctx+"/descrizione-alloggio/"+id[index]+"/"+sigla[index]+"/"+c+"/" +d+ ".html\">"
    	  + ""
          + denominazione[index] + "</a></strong></div>"
          + "<div class=\"foto\">"
          + imm + "</div><span>&nbsp;&nbsp;<i><strong>" + tipoesteso[index]
          + "</strong></i></span><br/><span>&nbsp;&nbsp;" + comune[index] + " (" + sigla[index] + ")</span><br/> "
          + "<span style=\"font-size:9pt\">"
          + (numcamere[index].length() > 0 ? "&nbsp;&nbsp;camere " + numcamere[index] : "")
          + (numlettitot[index].length() > 0 ? " / letti " + numlettitot[index] : "")
          + (prezzomedio[index].length() > 0 ? "<br/>&nbsp;&nbsp;prezzo medio " + prezzomedio[index] : "")
          + "</span><br/><span style=\"text-align:right; display:block; font-size:9pt; padding-right:40px\">" +
          (scontodel[index].length() > 0 ? "&nbsp;&nbsp;<img src=\"" + folder + "View/img/offerta.gif\" width=\"14px\" height=\"14px\"/>&nbsp;-"
          + scontodel[index] + "%" : "")
          + "</span></div>";

      return tableRow;
  }

  public static String getTableRow3_old(HashBeanVector esito, int index)
  {
      String testoXhtml = "";
      int size = esito.length("nome");

      String periodo = "", nome = "", id = "";

      for(int counter = 0; counter < 6 && index < size && index >= 0; ++counter)
      {
          if(esito.get("dal", index).length() > 0 && esito.get("al", index).length() > 0)
          {
            periodo = "dal&nbsp;" + esito.get("dal", index) + "&nbsp;al&nbsp;" + esito.get("al", index);
          }
          else if(esito.get("dal", index).length() > 0 && ! (esito.get("al", index).length() > 0))
          {
            periodo = "il&nbsp;" + esito.get("dal", index);
          }
          else{
            periodo = "";
          }

          nome = esito.get("nome", index);
          id = esito.get("id", index);
          String prov = esito.get("prov", index);
          String comu = esito.get("comu", index);
          String settore = esito.get("settore", index);
          String categoria = esito.get("categoria", index);
          String lineOne = "";

          if( (settore != null && !settore.equals("")) && (categoria != null && !categoria.equals("")))
            lineOne = settore +"/"+ categoria;
          else
            lineOne = settore + " " + categoria;

          testoXhtml += "<table class=\"esitoResults\" width=\"275px\" cellspacing=\"1\" class=\"res\"><tr><td><strong>"
              + nome + "</strong></td></tr>"
              + "<tr><td>" + lineOne + "</td></tr>"
              + "<tr><td>" + esito.get("comu", index) + " (" + esito.get("prov", index) + ")<td></tr>"
              + "<tr><td>" + periodo + "</td></tr>"
              + "<tr><td align=\"right\">"
              + "<a href=\"javascript:ChargeScheda('.jsp?id=" + id + "&prov=" + prov + "&comu="+ comu +"&nome=" + nome + "');\">"
              + "[vedi il profilo]</a>"
              + "</td></tr></table>";

          index++;
      }

      return testoXhtml;
  }

  public static String getTableRow3(HashBeanVector esito, int index)
  {
      String testoXhtml = "";
      int size = esito.length("nome");

      String periodo = "", nome = "", id = "";

      for(int counter = 0; counter < 6 && index < size && index >= 0; ++counter)
      {
          if(esito.get("dal", index).length() > 0 && esito.get("al", index).length() > 0)
          {
            periodo = "dal&nbsp;" + esito.get("dal", index) + "&nbsp;al&nbsp;" + esito.get("al", index);
          }
          else if(esito.get("dal", index).length() > 0 && ! (esito.get("al", index).length() > 0))
          {
            periodo = "il&nbsp;" + esito.get("dal", index);
          }
          else{
            periodo = "";
          }

          nome = esito.get("nome", index);
          id = esito.get("id", index);
          String prov = esito.get("prov", index);
          String comu = esito.get("comu", index);
          String settore = esito.get("settore", index);
          String categoria = esito.get("categoria", index);
          String lineOne = "";

          if( (settore != null && !settore.equals("")) && (categoria != null && !categoria.equals("")))
            lineOne = settore +"/"+ categoria;
          else
            lineOne = settore + " " + categoria;

          testoXhtml += "<div class=\"foto_text_left\"><div class=\"foto_text_ev\">"
        	  + "<span style=\"padding-top:5px;padding-right:5px;padding-bottom:5px\"><strong><a href=\"javascript:ChargeScheda('.jsp?id=" + id + "&prov=" + prov + "&comu="+ comu +"&nome=" + nome + "');\">"
        	  + "<img src=\"View/img/li.gif\" width=\"10px\"/>&nbsp;"
              + nome + "</a></strong></span></div>"
              + "<span>" + lineOne + "</span><br/>"
              + "<span>" + esito.get("comu", index) + " (" + esito.get("prov", index) + ")</span><br/>"
              + "<span>" + periodo + "</span><br/>"
              + "<span style=\"display:block;text-align:right;padding-right:60px;padding-top:8px\">"
              + "<a href=\"javascript:ChargeScheda('.jsp?id=" + id + "&prov=" + prov + "&comu="+ comu +"&nome=" + nome + "');\">"
              + "[vedi il profilo]</a></span>"
              + "</div>";

          index++;
      }

      return testoXhtml;
  }

}