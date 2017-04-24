package anna.alit.servicexhtml;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;

import anna.alit.beanbb.HashBean;
import anna.alit.servicebb.TitolareServiceImpl;

public class TableXhtml {


  public static String getPricesTable(String ctx, HashBean beanLoggato) {

      String tab = beanLoggato.get("tab");
      if(tab == null)
          return "";

      String oneNightLow = "<img src=\""+ctx+"/View/img/pricesLabels/1-notte-bassa.gif\" />";
      String oneWeekLow = "<img src=\""+ctx+"/View/img/pricesLabels/1-settimana-bassa.gif\" />";
      String oneNightHigh = "<img src=\""+ctx+"/View/img/pricesLabels/1-notte-alta.gif\" />";
      String oneWeekHigh = "<img src=\""+ctx+"/View/img/pricesLabels/1-settimana-alta.gif\" />";
      String low = "<img src=\""+ctx+"/View/img/pricesLabels/bassa.gif\" />";
      String high = "<img src=\""+ctx+"/View/img/pricesLabels/alta.gif\" />";

      String[] cells = tab.split(TitolareServiceImpl.TAB_SPLIT);
      String result = "\n<table width=\"670px\" id=\"prices\">"
      +  "\n<thead><tr>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/stagione.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/durata-soggiorno.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/posto-letto.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/singola-bc-1px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/singola-bp-1px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/doppia-bc-1px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/doppia-bp-1px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/doppia-bc-2px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/doppia-bp-2px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/tripla-bc-3px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/tripla-bp-3px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/quadrupla-bc-4px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/quadrupla-bp-4px.gif\"/></th>"
      +  "<th><img src=\""+ctx+"/View/img/pricesLabels/appartamento.gif\"/></th>"
      +  "</tr>"
      +  "</thead>"
      +  "\n<tbody class=\"tbod1\">\n<tr>"
      +  "<td rowspan=\"2\" >"
      +  ""+low+"</td>"
      +  "<td><font color=\"white\"><strong>"+oneNightLow+"</strong></font></td>";

      result += getXhtmlCells(cells, 0, 11);

      result +=  "</tr>\n<tr> <td><font color=\"white\"><strong>"+oneWeekLow+"</strong></font></td>";

      result += getXhtmlCellsX(cells, 12, 23);

      result +=  "</tr></tbody> \n <tbody class=\"tbod2\"><tr>"
          +  "<td rowspan=\"2\" >"+high+"</td>"
          +  "<td><font color=\"white\"><strong>"+oneNightHigh+"</strong></font></td>";

      result += getXhtmlCells(cells, 24, 35);

      result += "</tr>\n<tr> <td><font color=\"white\"><strong>"+oneWeekHigh+"</strong></font></td>";

      result += getXhtmlCellsXX(cells, 36, 47);

      result += "</tr>\n</table>";


      return result;
  }


  private static String getXhtmlCells(String[] cells, int startIndex, int endIndex) {
      String xhtmlCells = "", value;

      for(int i=startIndex; i <= endIndex && i < cells.length ; i++) {

          value = cells[i];

          xhtmlCells += "<td><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"";
          xhtmlCells += value + "\"/></td>";
      }

      return xhtmlCells;
  }

     private static String getXhtmlCellsX(String[] cells, int startIndex, int endIndex) {
          String xhtmlCells = "", value;

          for(int i=startIndex; i <= endIndex && i < cells.length ; i++) {

              value = cells[i];

              xhtmlCells = "" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(12, 0)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(13, 1)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(14, 2)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(15, 3)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(16, 4)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(17, 5)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(18, 6)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(19, 7)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(20, 8)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(21, 9)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(22, 10)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
//              "<td class=\"td1\"><input name=\"tab\" onchange=\"controllaValore(23, 11)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>";

              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
              "<td class=\"td1\"><input name=\"tab\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>";


          }

          return xhtmlCells;
      }

     private static String getXhtmlCellsXX(String[] cells, int startIndex, int endIndex) {
       String xhtmlCells = "", value;

       for(int i=startIndex; i <= endIndex && i < cells.length ; i++) {

           value = cells[i];

           xhtmlCells = "" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(36, 24)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(37, 25)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(38, 26)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(39, 27)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(40, 28)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(41, 29)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(42, 30)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(43, 31)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(44, 32)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(45, 33)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(46, 34)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>" +
                     "<td class=\"td2\"><input name=\"tab\" onchange=\"controllaValore(47, 35)\" type=\"text\" class=\"table\" size=\"3\" value=\"" + value + "\"/></td>";
       }

       return xhtmlCells;

    }


  public static String getCalendarTable(HashBean beanLoggato, String contextPath) {

      String calendar = "<table id=\"cal\" name=\"cal\" class=\"tab\" cellspacing=\"1\" width=\"630px\">\n<tr>";

      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
      String mese = sdf.format(new Date()).substring(3, 5);
      String anno = sdf.format(new Date()).substring(6, 10);
      int numMese = Integer.parseInt(mese);
      int annoint = Integer.parseInt(anno);
      int annoint2 = annoint +1;

      String[] perCalendar = new String[12];

      String path;
      if(! contextPath.endsWith("/"))
          contextPath += "/";

      path = contextPath + "View/img/";


      for(int i=0; i < 9; i++)
          calendar += "<td class=\"quadratino\">" + (i+1) + "&nbsp;&nbsp;</td>";

      for(int i=9; i < 31; i++)
          calendar +=  "<td class=\"quadratino\">" + (i+1) + "</td>";

      calendar +=  "</tr>\n<tr>";


      perCalendar[0] = getRowMese(beanLoggato, path, "gennaio", 31) + "<td style=\"border-top: 1pt solid red;\" colspan=\"30\">gennaio</td>"
          + "<td id=\"0\" style=\"color:red; border-top: 1pt solid red; font-weight:bold; text-align: center\">" + annoint2 + "</td>"
          +  "</tr>\n<tr>";

      perCalendar[1] = getRowMese(beanLoggato, path, "febbraio", 29) + "<td class=\"quadratiniTR\"></td>"
          + "<td class=\"quadratiniTR\"></td>"
          + "<td colspan=\"30\">febbraio</td>"
          + "<td id=\"1\"></td>"
          + "</tr>\n<tr>";

      perCalendar[2] = getRowMese(beanLoggato, path, "marzo", 31) + "<td colspan=\"30\">marzo</td>"
          + "<td id =\"2\" ></td>"
          + "</tr>\n<tr>";


      perCalendar[3] = getRowMese(beanLoggato, path, "aprile", 30) + "<td class=\"quadratiniTR\"></td>"
          + "<td colspan=\"30\">aprile</td>"
          + "<td id=\"3\"></td>"
          +  "</tr>\n<tr>";


      perCalendar[4] = getRowMese(beanLoggato, path, "maggio", 31) + "<td colspan=\"30\">maggio</td>"
          + "<td id=\"4\"></td>"
          + "</tr>\n<tr>";


      perCalendar[5] = getRowMese(beanLoggato, path, "giugno", 30) + "<td class=\"quadratiniTR\"></td>"
          + "<td colspan=\"30\">giugno</td>"
          + "<td id=\"5\"></td>"
          + "</tr>\n<tr>";

      perCalendar[6] = getRowMese(beanLoggato, path, "luglio", 31) + "<td colspan=\"30\">luglio</td>"
          + "<td id=\"6\"></td>"
          + "</tr>\n<tr>";


      perCalendar[7] = getRowMese(beanLoggato, path, "agosto", 31) + "<td colspan=\"30\">agosto</td>"
          + "<td id=\"7\"></td>"
          + "</tr>\n<tr>";

      perCalendar[8] = getRowMese(beanLoggato, path, "settembre", 30) + "<td class=\"quadratiniTR\"></td>"
          + "<td colspan=\"30\">settembre</td>"
          + "<td id=\"8\"></td>"
          + "</tr>\n<tr>";


      perCalendar[9] = getRowMese(beanLoggato, path, "ottobre", 31) + "<td colspan=\"30\">ottobre</td>"
          + "<td id=\"9\"></td>"
          + "</tr>\n<tr>";


      perCalendar[10] = getRowMese(beanLoggato, path, "novembre", 30) + "<td class=\"quadratiniTR\"></td>"
          + "<td colspan=\"30\">novembre</td>"
          + "<td id=\"10\"></td>"
          + "</tr>\n<tr>";


      perCalendar[11] = getRowMese(beanLoggato, path, "dicembre", 31) + "<td colspan=\"30\">dicembre</td>"
          + "<td id=\"11\" style=\"color:red; font-weight:bold; text-align: center;\">" + annoint + "</td>"
          + "</tr>\n<tr>";

      int index = numMese -1;
      for(int i = 0; i < perCalendar.length; i++) {
          calendar += perCalendar[index];
          if(++index == 12)
              index = 0;
      }
      calendar += "</tr></table>";
      return calendar;
  }

  private static String getRowMese(HashBean beanLoggato, String path, String mese, int giorni) {
      String rowMese = "";
      String values[];
      String mesi = beanLoggato.get(mese);
      if(mesi == null)
      {
        values = null;
      }
      else
      {
        values = mesi.replace("{", "").replace("}", "").split(",");
        if(values.length < giorni)
          values = null;
      }


      for(int i=0; i < giorni; i++)
      {
        rowMese += "<td id=\"" + mese + i + "\""
          + " onclick=\"setImgValues('" + path + "', '" + mese + i + "img')\" class=\"quadratini\">";

        if( values == null || values[i].equals("0") )
          rowMese += " <img id=\"" + mese + i + "img\" src=\"" + path + "cal0.gif\"/>" + "</td>\n";
        else
          rowMese += " <img id=\"" + mese + i + "img\" src=\"" + path + "cal" + values[i] + ".gif\"/>" + "</td>\n";
      }

      return rowMese;
  }

  public static String getTableOutput(String ctx, String locale, String[] tab){

      if(tab == null || tab.length < 48)
      {
        tab = new String[48];
        for(int i = 0; i < 48; i++)
          tab[i] = "";
      }

      String oneNightLow = "<img src=\""+ctx+"/View/img/pricesLabels/1-notte-bassa.gif\" />";
      String oneWeekLow = "<img src=\""+ctx+"/View/img/pricesLabels/1-settimana-bassa.gif\" />";
      String oneNightHigh = "<img src=\""+ctx+"/View/img/pricesLabels/1-notte-alta.gif\" />";
      String oneWeekHigh = "<img src=\""+ctx+"/View/img/pricesLabels/1-settimana-alta.gif\" />";
      String low = "<img src=\""+ctx+"/View/img/pricesLabels/bassa.gif\" />";
      String high = "<img src=\""+ctx+"/View/img/pricesLabels/alta.gif\" />";

      if(StringUtils.isNotEmpty(locale) && StringUtils.equals(locale, "en"))
      {
    	  oneNightLow = "<img src=\""+ctx+"/View/img/pricesLabels/1-night-low.gif\" />";
    	  oneWeekLow = "<img src=\""+ctx+"/View/img/pricesLabels/1-week-low.gif\" />";
    	  oneNightHigh = "<img src=\""+ctx+"/View/img/pricesLabels/1-night-high.gif\" />";
    	  oneWeekHigh = "<img src=\""+ctx+"/View/img/pricesLabels/1-week-high.gif\" />";
          low = "<img src=\""+ctx+"/View/img/pricesLabels/low.gif\" />";
          high = "<img src=\""+ctx+"/View/img/pricesLabels/high.gif\" />";
      }

       return "<tbody class=\"tbod1\"><tr>"
       +  "<td rowspan=\"2\" >"
       +  ""+low+"</td>"
       +  "<td><font color=\"white\"><strong>"+oneNightLow+"</strong></font></td>"
       +  " <td class=\"td1\">" + tab[0] + "</td>"
       +  " <td class=\"td1\">" + tab[1] + "</td>"
       +  " <td class=\"td1\">" + tab[2] + "</td>"
       +  " <td class=\"td1\">" + tab[3] + "</td>"
       +  " <td class=\"td1\">" + tab[4] + "</td>"
       +  " <td class=\"td1\">" + tab[5] + "</td>"
       +  " <td class=\"td1\">" + tab[6] + "</td>"
       +  " <td class=\"td1\">" + tab[7] + "</td>"
       +  " <td class=\"td1\">" + tab[8] + "</td>"
       +  " <td class=\"td1\">" + tab[9] + "</td>"
       +  " <td class=\"td1\">" + tab[10] + "</td>"
       +  " <td class=\"td1\">" + tab[11] + "</td>"
       +  "</tr>\n<tr>"
       +  "<td><font color=\"white\"><strong>"+oneWeekLow+"</strong></font></td>"
       +  " <td class=\"td2\">" + tab[12] + "</td>"
       +  " <td class=\"td2\">" + tab[13] + "</td>"
       +  " <td class=\"td2\">" + tab[14] + "</td>"
       +  " <td class=\"td2\">" + tab[15] + "</td>"
       +  " <td class=\"td2\">" + tab[16] + "</td>"
       +  " <td class=\"td2\">" + tab[17] + "</td>"
       +  " <td class=\"td2\">" + tab[18] + "</td>"
       +  " <td class=\"td2\">" + tab[19] + "</td>"
       +  " <td class=\"td2\">" + tab[20] + "</td>"
       +  " <td class=\"td2\">" + tab[21] + "</td>"
       +  " <td class=\"td2\">" + tab[22] + "</td>"
       +  " <td class=\"td2\">" + tab[23] + "</td>"
       +  "</tr>\n</tbody>"
       +  "<tbody class=\"tbod2\"><tr>"
       +  "<td rowspan=\"2\" >"+high+"</td>"
       +  "<td><font color=\"white\"><strong>"+oneNightHigh+"</strong></font></td>"
       +  " <td class=\"td1\">" + tab[24] + "</td>"
       +  " <td class=\"td1\">" + tab[25] + "</td>"
       +  " <td class=\"td1\">" + tab[26] + "</td>"
       +  " <td class=\"td1\">" + tab[27] + "</td>"
       +  " <td class=\"td1\">" + tab[28] + "</td>"
       +  " <td class=\"td1\">" + tab[29] + "</td>"
       +  " <td class=\"td1\">" + tab[30] + "</td>"
       +  " <td class=\"td1\">" + tab[31] + "</td>"
       +  " <td class=\"td1\">" + tab[32] + "</td>"
       +  " <td class=\"td1\">" + tab[33] + "</td>"
       +  " <td class=\"td1\">" + tab[34] + "</td>"
       +  " <td class=\"td1\">" + tab[35] + "</td>"
       +  "</tr>\n<tr>"
       +  "<td><font color=\"white\"><strong>"+oneWeekHigh+"</strong></font></td>"
       +  " <td class=\"td2\">" + tab[36] + "</td>"
       +  " <td class=\"td2\">" + tab[37] + "</td>"
       +  " <td class=\"td2\">" + tab[38] + "</td>"
       +  " <td class=\"td2\">" + tab[39] + "</td>"
       +  " <td class=\"td2\">" + tab[40] + "</td>"
       +  " <td class=\"td2\">" + tab[41] + "</td>"
       +  " <td class=\"td2\">" + tab[42] + "</td>"
       +  " <td class=\"td2\">" + tab[43] + "</td>"
       +  " <td class=\"td2\">" + tab[44] + "</td>"
       +  " <td class=\"td2\">" + tab[45] + "</td>"
       +  " <td class=\"td2\">" + tab[46] + "</td>"
       +  " <td class=\"td2\">" + tab[47] + "</td>"
       +  "</tr>\n</tbody>";
      }
}
