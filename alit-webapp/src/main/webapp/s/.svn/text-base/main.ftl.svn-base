[#ftl]<!-- $Revision: 341 $  :encoding=UTF-8:-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Pannello amministrativo</title>
  <script type="text/javascript" src="${base}/res/js_common.action"></script>
  <script type="text/javascript" src="${base}/res/js_sample.action"></script>

<script type="text/javascript">
var ApplicationState = function(){};
dojo.extend(ApplicationState, {

 back: function()
 {
   console.log('back');
 },

 forward: function()
 {
   console.log('forward');
 },

 showStateData: function() { },

 showBackForwardMessage: function(message) { }
});

var finderStructure = [
{
 cells: [ [
   { name:'id', field:'id', width:'4em' },
   { name:'tipo', field:'tipologia', width:'4em', editable: true },
   { name:'denominazione', field:'denominazione', width:'10em', editable: true},
   { name:'mail', field:'mail', width:'10em', editable: true},
   { name:'web', field:'web', width:'10em', editable: true},
   { name:'telefono', field:'telefono', width:'7em', editable: true},
   { name:'cellulare', field:'cellulare', width:'7em', editable: true},
   { name:'fax', field:'fax', width:'7em', editable: true},
   { name:'comune', field:'comune', width:'10em', editable: true},
   { name:'prov', field:'sigla', width:'4em', editable: true},
   { name:'indirizzo', field:'indirizzo', width:'10em', editable: true }
  ]]
} ];

var bannerStructure = [
{
 cells: [ [
   { name:'imm dx', width:'10em', field:'bannerdx' },
   { name:'imm sx', field:'bannersx', width:'10em' },
   { name:'regione', field:'regione', width:'10em'},
   { name:'tipologia', field:'tipologia', width:'10em'},
   { name:'filename', field:'filename', width:'10em' },
   { name:'dalla data', field:'fromthe', width:'10em'},
   { name:'alla data', field:'tothe', width:'10em'},
   { name:'link', field:'link', width:'10em'},
   { name:'sponsor', field:'sponsor', width:'10em' }
  ]]
} ];

/*
var insertStructure = [
{
 cells: [ [
   { name:'tipologia', field:'i_tipologia', width:'4em' },
   { name:'denominazione', field:'i_denominazione', width:'16em' },
   { name:'mail', field:'i_mail', width:'16em' },
   { name:'web', field:'i_web', width:'16em' },
   { name:'telefono', field:'i_telefono', width:'8em' },
   { name:'cellulare', field:'i_cellulare', width:'8em' },
   { name:'fax', field:'i_fax', width:'8em' },
   { name:'comune', field:'i_comune', width:'16em' },
   { name:'prov', field:'i_sigla', width:'4em' },
   { name:'indirizzo', field:'i_indirizzo', width:'16em' }
  ]]
} ];

var mailStructure = [
{
 cells: [ [
   { name:'tipologia', field:'m_tipo', width:'4em' },
   { name:'sigla', field:'m_sigla', width:'4em' }
  ]]
} ];
*/

/* =========================
 *    Sample
 * =========================
 */
dojo.declare("sample.Sample", null,
{
  constructor: function(args)
  {
  },

  somevalue:null,

  /*
   *
   */
  init:function()
  {
    var appState = new ApplicationState();
    dojo.back.setInitialState(appState);
    dojo.back.addToHistory(appState);

    ui.progressBar.update({ progress:50 });
    ui.progressBar.update({ progress:100 });
    sample.findBanners();
  },

  formatType:function(value)
  {
    return '<img src="http://www.alloggioitaliano.it/loghi/Alloggio-Italiano-18.png" />';
  },

/*
  formatText:function(value)
  {
    return value+'bau!';
  },
  */


  /*
   *
   */
  find:function()
  {
   var namePattern = ui.namePattern.attr('value');
   var siglaPattern = ui.siglaPattern.attr('value');

   this.store = new dojo.data.ItemFileWriteStore(
   {
     url:'${base}/smd/aziende-store.action?namePattern='+namePattern+'&siglaPattern='+siglaPattern,
     urlPreventCache:true
   });

    this.store.fetch(
     {
     onBegin:function() { console.log('fetch.onBegin'); },
     onComplete:function(items, request) { console.log('fetch.onComplete', items, request); },
     onError:function(errData, request) { console.log('fetch.onError', errData, request); }
     });

    this.store._saveCustom = function(saveComplete, saveFailed)
    {
	    var changeSet = this.store._pending;
	    var changes = {};
	    changes.modified = [];
	    for (var i in changeSet._modifiedItems) {
	        var item = null;
	        if (this.store._itemsByIdentity) {
	            item = this.store._itemsByIdentity[i];
	        } else {
	            item = this.store._arrayOfAllItems[i];
	        }
	        changes.modified.push(itemToJS(this.store, item));
	    }
	    saveComplete();
      };
    ui.finderGrid.setStore(this.store);
    sample.menuItem();
  },

  menuItem:function()
  {
    dojo.connect(ui.finderGrid, 'onRowContextMenu', function(e) {
        var tn = dijit.getEnclosingWidget(e.target);
        var item = ui.finderGrid.getItem(e.rowIndex);
        var type = ui.finderGrid.store.getValue(item, 'typeKey', null);

        sample.currentGridNode = item;

        ui.gridMenuItems.bindDomNode(e.rowNode);
      });
  },

  /*
   *
   */
  findBanners:function()
  {
   var bannerstore = new dojo.data.ItemFileWriteStore({ url:'${base}/smd/banner-store.action', handleAs:'html', urlPreventCache:true });

    bannerstore.fetch(
     {
       onBegin:function() { console.log('fetch.onBegin'); },
       onComplete:function(items, request) { console.log('fetch.onComplete', items, request); },
       onError:function(errData, request) { console.log('fetch.onError', errData, request); }
     });

    bannerstore._saveCustom = function(saveComplete, saveFailed)
    {
	    var changeSet = bannerstore._pending;
	    var changes = {};
	    changes.modified = [];
	    for (var i in changeSet._modifiedItems) {
	        var item = null;
	        if (bannerstore._itemsByIdentity) {
	            item = bannerstore._itemsByIdentity[i];
	        } else {
	            item = bannerstore._arrayOfAllItems[i];
	        }
	        changes.modified.push(itemToJS(bannerstore, item));
	    }
	    saveComplete();
      };
    ui.bannerGrid.setStore(bannerstore);
  },

  /*
   *
   */
  insert:function()
  {
    ui.messageDialog.show();
    var form = ui.newEntryForm.getValues();

      dojo.xhrGet({
      url:'${base}/smd/insert-store.action',
      content: { i_tipologia: form.i_tipologia, i_denominazione: form.i_denominazione, i_mail: form.i_mail, i_web: form.i_web, i_telefono: form.i_telefono, i_cellulare:form.i_cellulare, i_fax: form.i_fax, i_comune: form.i_comune, i_sigla:form.i_sigla, i_indirizzo:form.i_indirizzo  },
      urlPreventCache:true,
      error:function(response, ioArgs) { console.log('insert error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing insert action');
        ui.confirm.show();
      }
    });
  },


  /*
   *
   */
  update:function()
  {
    ui.messageDialog.show();

    var up = sample.currentGridNode;

      dojo.xhrGet({
      url:'${base}/smd/update-store.action',
      content: { id: up.id, tipologia: up.tipologia, denominazione: up.denominazione, mail: up.mail, web: up.web, telefono: up.telefono, cellulare:up.cellulare, fax: up.fax, comune: up.comune, sigla:up.sigla, indirizzo:up.indirizzo  },
      urlPreventCache:true,
      error:function(response, ioArgs) { console.log('update error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing update action');
        ui.confirm.show();
      }
    });
  },

  /*
   *
   */
  deleteStructure:function()
  {
    ui.messageDialog.show();

    var del = sample.currentGridNode;

      dojo.xhrGet({
      url:'${base}/smd/delete-store.action',
      content: { id: del.id },
      error:function(response, ioArgs) { console.log('update error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing update action');
        ui.confirm.show();
      }
    });
  },


  /*
   *
  insertBanner:function()
  {
    ui.messageDialog.show();
    ui.newBannerForm.enctype = "multipart/form-data";
    ui.newBannerForm.method = "post";

    ui.newBannerForm.setAttribute("enctype", "multipart/form-data");
    ui.newBannerForm.setAttribute("method","POST");

    var form = ui.newBannerForm.getValues();

      dojo.xhrPost({
      url:'${base}/BannerServlet',
      method: 'post',
      formNode: ui.newBannerForm,
      timeout:'15000',
      content: { sponsor: form.sponsor, linking: form.linking, regione: form.regione, tipolog: form.tipolog, fromthe: form.fromthe, tillthe:form.tillthe, posizio: form.posizio, items: form.image  },
      file: { name: '05.jpg', contentType: "plain/text", content: form.image },
      error:function(response, ioArgs) { console.log('insert error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing banner insert');
        ui.confirm.show();
      }
    });
  },
   */



  /*
   *
   */
  mailList:function()
  {
    ui.messageDialog.show();

    var mail = ui.mailForm.getValues();

      dojo.xhrGet({
      url:'${base}/smd/mailList-store.action',
      content: { m_sigla: mail.m_sigla, m_tipologia: mail.m_tipologia },
      error:function(response, ioArgs) { console.log('mail error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing mailing list action');
        ui.confirm.show();
      }
    });
  },

  /*
   *
   */
  subscription:function()
  {
    ui.messageDialog.show();

    var sub = sample.currentGridNode;

      dojo.xhrGet({
      url:'${base}/smd/subscription-store.action',
      content: { id: sub.id },
      error:function(response, ioArgs) { console.log('update error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing update action');
        ui.confirm.show();
      }
    });
  },

  /*
   *
   */
  delSubscription:function()
  {
    ui.messageDialog.show();

    var delSub = sample.currentGridNode;

      dojo.xhrGet({
      url:'${base}/smd/delSubscription-store.action',
      content: { id: delSub.id },
      error:function(response, ioArgs) { console.log('update error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing update action');
        ui.confirm.show();
      }
    });
  },

    /*
   *
   */
  insertBanner:function()
  {
    ui.messageDialog.show();

/*    ui.newBannerForm.enctype = "multipart/form-data";
    ui.newBannerForm.method = "post";
    ui.newBannerForm.setAttribute("enctype", "multipart/form-data");
    ui.newBannerForm.setAttribute("method","POST"); */

    var form = ui.formForBanners.getValues();

      dojo.xhrPost({
      url:'${base}/PreBannerServlet',
      method: 'get',
      formNode: ui.formForBanners,
      timeout:'15000',
      content: { sponsor: form.sponsor, linking: form.linking, regione: form.regione, tipolog: form.tipolog, fromthe: form.fromthe, tillthe:form.tillthe, posizio: form.posizio, items: form.image  },
      /*file: { name: '05.jpg', contentType: "plain/text", content: form.image },*/
      error:function(response, ioArgs) { console.log('insert error', response); },
      load:function(response, ioArgs)
      {
        ui.messageDialog.hide();
        console.log('performing banner insert');
        ui.confirm.show();
      }
    });
  },


  sendForm:function()
  {
   dojo.style(dojo.byId('inputField'),"display","none");
   dojo.style(dojo.byId('progressField'),"display","inline");
   dojo.byId('preamble').innerHTML = "Uploading ...";

   dojo.io.iframe.send({
        url: "${base}/BannerServlet",
        method: "post",
        handleAs: "text",
        form: dojo.byId('newBannerForm'),
        handle: function(data,ioArgs)
        {
            var foo = dojo.fromJson(data);
            if (foo.status == "success")
            {
                dojo.style(dojo.byId('inputField'),"display","inline");
                dojo.byId('image').value = '';
                dojo.style(dojo.byId('progressField'),"display","none");
                dojo.byId('uploadedFiles').innerHTML += "success: File: "
                + foo.details.name + " size: " + foo.details.size +"<br>";
                dojo.byId('preamble').innerHTML = "File to Upload: ";
            }
            else
            {
                dojo.style(dojo.byId('inputField'),"display","inline");
                dojo.style(dojo.byId('progressField'),"display","none");
                dojo.byId('preamble').innerHTML = "Error, try again: ";
            }
        }

    });
},


  /*
   *
   */
  xxxi:0,
  xxx03:function()
  {
    console.log('store.newItem');
    var usa = this.store.newItem({name:'us'+(this.xxxi++), owner:'United States of America', state:'Washington DC', description:'description description description'});
  },


  /*
   *
   */
  xxx04:function()
  {
    console.log('store.save');
    this.store.save(
     {
     scope:sample,
     onComplete:function() { console.log('save.onComplete'); },
     onError:function(errData, request) { console.log('fetch.onError', errData, request); }
     });
  },


  /*
   *
   */
  errorDialog:function(arguments)
  {
    // console.log('EEEEEEEEEE', response, ioArgs); ui.messageDialog.hide(); alert('error:(');
    ui.messageDialog.setContent('<span class="">Some error occured...</span>');
    ui.messageDialog.show();
  },


  /*
   *
   */
  formatTitle:function(attr, idx)
  {
    return (attr && idx >= 0) ? '<span class="colHighlight">'+attr+'</span>' : ' ';
  }


});

var organic = { ui:new organic.ui() };
var sample = new sample.Sample();

dojo.addOnLoad(function() { sample.init(); });
</script>
</head>

[#-- ====================================================================== --]
[#--    body                                                                --]
[#-- ====================================================================== --]
<body>

[#-- ====================================================================== --]
[#--   THE PAGE                                                             --]
[#-- ====================================================================== --]
[#-- ui.thePage --]
 <div id="ui.header" style="text-align: center; background-color:#D8D8D8; color:white; border-bottom: 2px solid silver; border-top: 2px solid silver"><h3>Alloggio Italiano - Pannello di Amministrazione</h3></div>

<div id="thePage" jsId="ui.thePage" dojoType="dijit.layout.BorderContainer" gutters="true" style="background-color:#eeeeee; height:80%; display:none;">
 [#-- caption --]
 <div jsId="ui.caption" dojoType="dijit.layout.ContentPane" region="top">
  <table>
  <tr>
   <td>nome:</td><td><input jsId="ui.namePattern" dojoType="dijit.form.TextBox" name="namePattern"/></td>
   <td>sigla:</td><td><input jsId="ui.siglaPattern" dojoType="dijit.form.TextBox" name="siglaPattern"/></td>
   <td><div dojoType="dijit.form.Button" onclick="sample.find();" showLabel="true"><span><strong>esegui la ricerca</strong></span></div></td>
   </tr>
  </table>
</div>

 [#-- dialogs --]
 <div id="dialogs" style="display:none; ">
  <!-- ui.messageDialog -->
  <div jsId="ui.messageDialog" dojoType="dijit.Dialog" title="azione in esecuzione">
   Attendere....
  </div>
  <!-- ui.confirm -->
  <div jsId="ui.confirm" dojoType="dijit.Dialog" title="esito">
   azione eseguita correttamente!
  </div>

  <!-- ui.gridMenu -->
  <div jsId="ui.gridMenuItems" id="gridMenuItems" dojoType="dijit.Menu" style="display:none; font-size:0.9em; font-weight:bold">
    <div dojoType="dijit.MenuItem" jsId="ui.update" onclick="sample.update">1. aggiorna dati</div>
    <div dojoType="dijit.MenuItem" jsId="ui.subscription" onclick="sample.subscription">2. attiva abbonato</div>
    <div dojoType="dijit.MenuItem" jsId="ui.subscription" onclick="sample.delSubscription">3. disattiva abbonato</div>
    <div dojoType="dijit.MenuItem" jsId="ui.delete" onclick="sample.deleteStructure">4. rimuovi struttura</div>
  </div>


 </div>


 [#-- main --]
 <div jsId="ui.stackContainer" dojoType="dijit.layout.TabContainer" gutters="true" style="" region="center">




  [#-- =================== tab: find ==================================  store="globalStore.sample" --]
<!--
  <div jsId="ui.xxxxxx" dojoType="dijit.layout.ContentPane" title="let me see how cool you are">
<div>
        <form id="mainForm" enctype="multipart/form-data" name="fileTest" action="/BannerServlet" method="post">
		<span id="preamble">File to Upload:</span><br>
		<span id="inputField">
		<input type="file" id="fileInput" name="uploadTestFile">
		</span>
		<span id="progressField" style="display:none;">
		<div dojoType="dijit.ProgressBar" style="width:200px" indeterminate="true"></div>
		</span>
        <br>
        <button type="button" value="upload" dojoType="dijit.form.Button" onclick="sample.sendForm()">Upload</button>
        </form>
</div>
  </div>
  -->


  [#-- =================== tab: find ==================================  store="globalStore.sample" --]
  <div jsId="ui.samplePane" dojoType="dijit.layout.ContentPane" title="find and update">
      <table jsId="ui.finderGrid" dojoType="dojox.grid.DataGrid" structure="finderStructure">
      </table>
  </div>

  [#-- =================== tab: new entry ==================================  --]
  <div jsId="ui.insert" dojoType="dijit.layout.ContentPane" title="new entry">
    <div jsId="ui.insertNew" dojoType="dijit.layout.BorderContainer" gutters="true" style=" ">
      <div dojoType="dijit.layout.ContentPane" region="top" gutters="true">
       <span><strong>Nuova struttura</strong></span>
        <div style="font-size:0.9em">Valorizzare opportunamente i dati di tutti i campi per registrare una nuova struttura.<br/></div>
      </div>
    <div dojoType="dijit.layout.ContentPane" region="left" style="width:30%; font-size: 0.8em; padding: 20px">
     Dopo aver popolato i campi cliccare sul bottone a destra per completare l'inserimento. Prestare attenzione al formato di ciascun campo, in caso di dubbi viene mostrato un suggerimento passando con il muose sulla casella d'interesse
    </div>

      <div dojoType="dijit.layout.ContentPane" region="center" style="font-size: 0.8em; padding: 25px;">
      <form jsId="ui.newEntryForm" dojoType="dijit.form.Form">
       <input dojoType="dijit.form.TextBox" name="i_tipologia" title="BB"/><span style="font-weight:bold;"> Tipologia</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_denominazione" title="Tana di Pietro"/><span style="font-weight:bold;"> Denominazione</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_sigla" title="MN"/><span style="font-weight:bold;"> Provincia</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_comune" title="Asola"/><span style="font-weight:bold;"> Comune</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_indirizzo" title="Via Garibaldi, 6"/><span style="font-weight:bold;"> Indirizzo</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_telefono" title="0376/770736"/><span style="font-weight:bold;"> Telefono</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_cellulare" title="3391289587"/><span style="font-weight:bold;"> Cellulare</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_fax" title="0376/770736"/><span style="font-weight:bold;"> Fax</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_mail" title="anna@gmail.com"/><span style="font-weight:bold;"> Mail</span><br/>
       <input dojoType="dijit.form.TextBox" name="i_web" title="www.google.it"/><span style="font-weight:bold;"> Sito web</span><br/>
      </form>
     </div>
     <div dojoType="dijit.layout.ContentPane" region="right" style="width:20%">
     <div dojoType="dijit.form.Button" onclick="sample.insert();"><span><strong>insert nuova struttura</strong></span></div>
    </div>
   </div>
  </div>

  [#-- =================== tab: banners ==================================  store="globalStore.sample" --]
  <div jsId="ui.banners" dojoType="dijit.layout.ContentPane" title="banners table">
      <table jsId="ui.bannerGrid" dojoType="dojox.grid.DataGrid" structure="bannerStructure">
      </table>
  </div>

  [#-- =================== tab: banners ==================================  store="globalStore.sample" --]
  <div jsId="ui.bannersInsert" dojoType="dijit.layout.ContentPane" title="banners insert">
   <div jsId="ui.bannerInsertNew" dojoType="dijit.layout.BorderContainer" gutters="true" style="width:60em; height:10em;">
      <div dojoType="dijit.layout.ContentPane" region="top" gutters="true">
        <span><strong>Nuovo banner</strong><br/></span>
        <div style="font-size:0.9em">Valorizzare opportunamente i dati di tutti i campi per rinserire un nuovo banner.<br/></div>
      </div>
    <div dojoType="dijit.layout.ContentPane" region="left" style="width:25%; font-size: 0.8em; padding: 20px">
     Dopo aver popolato i campi cliccare sul bottone in basso per caricare i dati testuali. Ad azione eseguita, selezionare il file immagine e cliccare sul relativo bottone per completare l'inserimento. Prestare attenzione al formato di ciascun campo, in caso di dubbi viene mostrato un suggerimento passando con il mouse sulla casella d'interesse
    </div>
      <div dojoType="dijit.layout.ContentPane" region="center"  style="font-size: 0.8em; padding: 20px;">
      <form jsId="ui.formForBanners" dojoType="dijit.form.Form" action="/PreBannerServlet">
       <input dojoType="dijit.form.TextBox" name="sponsor" value="nome dello sponsor"/><span style="font-weight:bold;"> Sponsor</span><br/>
       <input dojoType="dijit.form.TextBox" name="linking" value="http://"/><span style="font-weight:bold;"> Link</span><br/>
       <input dojoType="dijit.form.TextBox" name="regione" value="Lombardia"/><span style="font-weight:bold;"> Regione</span><br/>
       <input dojoType="dijit.form.TextBox" name="tipolog" value="BB"/><span style="font-weight:bold;"> Tipologia</span><br/>
<!--
       <input dojoType="dijit.form.DateTextBox" name="fromthe" value="12/12/2010"/><span style="font-weight:bold;"> Dal</span><br/>
       <input dojoType="dijit.form.DateTextBox" name="tillthe" value="12/12/2011"/><span style="font-weight:bold;"> Al</span><br/>
-->
       <input dojoType="dijit.form.TextBox" name="fromthe" value="12/12/2010"/><span style="font-weight:bold;"> Dal</span><br/>
       <input dojoType="dijit.form.TextBox" name="tillthe" value="12/12/2011"/><span style="font-weight:bold;"> Al</span><br/>
       <input dojoType="dijit.form.RadioButton" name="posizio" value="dx"/><span style="font-weight:bold;"> destra</span>
       <input dojoType="dijit.form.RadioButton" name="posizio" value="sx"/><span style="font-weight:bold;"> sinistra</span><br/>
       <div dojoType="dijit.form.Button" onclick="sample.insertBanner()"><span><strong>charge data</strong></span></div>
      </form>
     </div>
     <div dojoType="dijit.layout.ContentPane" region="right" style="width:30%">
      <form jsId="ui.newBannerForm" id="newBannerForm" action="/BannerServlet" enctype="multipart/form-data" dojoType="dijit.form.Form" method="post">
		<span id="preamble">File to Upload:</span><br>
		<span id="inputField">
		<input type="file" id="image" name="uploadTestFile">
		</span>
		<span id="progressField" style="display:none;">
		<div dojoType="dijit.ProgressBar" style="width:200px" indeterminate="true"></div>
		</span>
        <br>
       <div dojoType="dijit.form.Button" onclick="sample.sendForm()"><span><strong>insert nuovo banner</strong></span></div>
      </form>
    </div>
   </div>
  </div>

  [#-- =================== tab: email ================================== href="info.action" --]
  <div jsId="ui.email" dojoType="dijit.layout.ContentPane" title="email"
       refreshOnShow="true" preventCache="false" preload="false">
   <div jsId="ui.mailListBorder" dojoType="dijit.layout.BorderContainer" gutters="true" style="width:60em; height:12em;">

      <div dojoType="dijit.layout.ContentPane" region="top" gutters="true">
       <h4>Selezione dei parametri per creare una mailing list</h4>
        <div style="font-size:0.9em">Valorizzare opportunamente i dati dei campi di interesse per creare una lista di indirizzi email a cui spedire la presentazione di alloggio italiano<br/><br/></div>
      </div>
      <div dojoType="dijit.layout.ContentPane" region="center" gutters="true" style="font-size: 0.8em; padding: 25px">
      <form jsId="ui.mailForm" dojoType="dijit.form.Form">
       <input dojoType="dijit.form.TextBox" required="true" name="m_sigla" value="AO"/><span style="font-weight:bold;"> Provincia</span><br/>
       <input dojoType="dijit.form.TextBox" required="true" name="m_tipologia" value="OG"/><span style="font-weight:bold;"> Tipologia</span><br/>
      </form>
     </div>
     <div dojoType="dijit.layout.ContentPane" region="right">
     <div dojoType="dijit.form.Button" onclick="sample.mailList();"><span><strong>spedisci!</strong></span></div>
   </div>
  </div>
  </div>
 </div>

 [#-- statusbar --]
 <div jsId="ui.statusbar" dojoType="dijit.layout.ContentPane" region="bottom">
  statusbar
 </div>
</div>
</body>
</html>

