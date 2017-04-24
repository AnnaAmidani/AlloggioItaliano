<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- $Revision: 284 $ -->
<#-- :encoding=UTF-8: -->
<#-- ====================================================================== -->
<#--      macros                                                            -->
<#-- ====================================================================== -->
<#include "../../tabs/macro.ftl"/>

<html>
<#-- ====================================================================== -->
<#--    head                                                                -->
<#-- ====================================================================== -->
<head>
<title>organic: ${title}</title>
<#--meta http-equiv="Content-Type" content="text/html; charset=UTF-8"-->
<link rel="icon" type="image/png" href="${base}/r/static/favicon.png"/>
<link rel="stylesheet" type="text/css" href="${base}/res/css_page.action" media="all"/>
<style>
@import url('${base}${dojoBase}/dijit/themes/tundra/tundra.css');
@import url('${base}${dojoBase}/dojox/grid/resources/tundraGrid.css');
</style>

<script type="text/javascript">
djConfig = {
 //isDebug: ${debug?string},
 //extraLocale: ['it-it', 'en-us'],
 usePlainJson: true,
 parseOnLoad: true,
 /*<#--
 //baseUrl: '${base}${dojoBase}/dojo',
 //dojoBlankHtmlUrl: '${base}${dojoBase}/dojo/resources/blank.html',
 //dojoIframeHistoryUrl: '${base}${dojoBase}/resources/iframe_history.html',
 //preventBackButtonFix: false,
 //bindEncoding: '$ {encoding}',
 //dojoRichTextFrameUrl: "../../../src/widget/templates/richtextframe.html" //for xdomain
 //debugAtAllCosts: ${debug?string}, // not needed, but allows the Venkman debugger to work with the includes
 --> */
};
</script>
<script type="text/javascript" src="${base}${dojoBase}/dojo/dojo.js"></script>
<script type="text/javascript" src="${base}${dojoBase}/dojo/micdojo.js"></script>
<script type="text/javascript" src="${base}${dojoBase}/dojo/back.js"></script>
<script type="text/javascript">
dojo.require('dijit.dijit');
dojo.require('dijit.Dialog');
dojo.require('dijit.Menu');
dojo.require('dijit.ProgressBar');
dojo.require('dijit.layout.ContentPane');
dojo.require('dijit.layout.TabContainer');
dojo.require('dijit.layout.StackContainer');
dojo.require('dijit.layout.BorderContainer');
dojo.require('dijit.Tree');
dojo.require("dijit.TitlePane");
dojo.require('dojox.grid.DataGrid');
//dojo.require('dojox.grid.cells.dijit');
dojo.require("dijit.form.SimpleTextarea");
dojo.require("dijit.form.Form");
dojo.require("dijit.form.ValidationTextBox");
dojo.require("dijit.form.Button");
dojo.require("dijit.Tooltip");

dojo.require('dojo.parser');
dojo.require("dojo.date.locale");
dojo.require('dojo.data.ItemFileReadStore');
dojo.require('dojo.data.ItemFileWriteStore');
/*<#--
dojo.require('dijit.TitlePane');
dojo.require("dijit.Tooltip");
dojo.require('dijit.form.Form');
dojo.require('dijit.form.Button');
dojo.require('dijit.form.TextBox');
dojo.require('dijit.form.ComboBox');
dojo.require('dijit.form.FilteringSelect');
dojo.require('dijit.form.CheckBox');
dojo.require('dijit.form.NumberTextBox');
dojo.require('dijit.form.CurrencyTextBox');
dojo.require("dojox.form.RangeSlider");
//dojo.require("dojo.io.iframe");
//dojo.require("dojo.rpc.JsonpService");
--> */
dojo.require("dojo.rpc.RpcService");
dojo.require("dojo.rpc.JsonService");
dojo.require("dojo.back");

//dojo.require("organic.ui");
</script>

${head}

</head>
<#-- ====================================================================== -->
<#--    body                                                                -->
<#-- ====================================================================== -->
<body class="tundra organic">
<script type="text/javascript">dojo.back.init();</script>

<#-- ====================================================================== -->
<#--    common widgets                                                      -->
<#-- ====================================================================== -->
<div id="organicLoadingPanel">
 <div style="width:420px;height:70px;margin:auto;margin-top:20%;border:1px solid silver;padding-top:5px;">
  <div style="margin:auto;">
   <table cellspacing="10" style="margin:auto;"><tr><td><div class="ico02"></div></td><td><div>${m.t("label.wait")}</div></td></tr></table>
  </div>
  <div style="margin:auto;margin-top:3px;width:400px" id="ui.progressBar" jsId="ui.progressBar" dojoType="dijit.ProgressBar" onChange="organic.ui.checkProgress()"></div>
 </div>
</div>


${body}


<#-- ====================================================================== -->
<#--   dialogs                                                              -->
<#-- ====================================================================== -->
<div id="dialogs" style="display:none;">
 <#include "../../tabs/dialogs.ftl"/>

 <div jsId="ui.waitDialog" dojoType="dijit.Dialog" title="${m.t("title.wait")}">
  <div class="dijitContentPaneLoading" style="width:20em;">${m.t("short.wait")}</div>
  <div jsId="ui.waitMessagePane" dojoType="dijit.layout.ContentPane"></div>
 </div>

 <#-- alert -->
 <div dojoType="dijit.Dialog" jsId="ui.dojoAlert" title="${m.t("attention")}" duration="200">
  <div dojoType="dijit.layout.ContentPane" style="padding:5px 5px 5px 5px;">
   <div dojoType="dijit.layout.ContentPane" style="margin-bottom:20px;">
    <table>
     <tr>
      <td align="left"><div class="errorImgPane" dojoType="dijit.layout.ContentPane" style="margin-right:10px;"></div></td>
      <td align="right" style="width:300px;"><div dojoType="dijit.layout.ContentPane" jsId="ui.dojoAlertText" style="text-align:left;"></div></td>
     </tr>
    </table>
   </div>
   <center><div dojoType="dijit.form.Button" onclick="organic.ui.dojoAlertHide();" style="margin:auto;"><span>${m.t("label.ok")}</span></div></center>
  </div>
 </div>
</div>

</body>
</html>

