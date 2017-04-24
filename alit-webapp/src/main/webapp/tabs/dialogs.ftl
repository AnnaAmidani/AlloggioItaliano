[#ftl][#-- $Id: dialogs.ftl 285 2010-03-17 17:00:32Z michele.bianchi $ --]
[#-- ====================================================================== --]
[#--   dialogs                                                              --]
[#-- ====================================================================== --]
<div id="dialogs" style="display:none;">
 [#-- ui.waitDialog  duration="100" open="false" style="display:none;" --]
 <div jsId="ui.waitDialog" dojoType="dijit.Dialog" title="Please wait..." closable="false">
  <div class="dijitContentPaneLoading" style="width:20em;">Please wait....</div>
  <div jsId="ui.waitMessagePane" dojoType="dijit.layout.ContentPane"></div>
 </div>

 [#-- ui.messageDialog --]
 <div jsId="ui.messageDialog" dojoType="dijit.Dialog" title="Info">
  Please wait....
 </div>
</div>

