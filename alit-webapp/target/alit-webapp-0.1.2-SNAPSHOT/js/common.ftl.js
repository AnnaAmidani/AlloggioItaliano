// -*- js-var:ui,console,dojo,dijit,dojox; -*-
// $Revision: 320 $
// :encoding=UTF-8:

dojo.provide("organic.ui");

dojo.require("dojo._base.declare");
dojo.require("dojo.string");
dojo.require('dojo.parser');
dojo.require("dojo.date.locale");

dojo.declare("organic.ui", null,
{
  constructor: function(args)
  {
  },

  genError: 'Errore generico: ', // 'some error occured: '

  /*
   *
   */
  checkProgress:function()
  {
    if (dijit.byId('ui.progressBar').progress == 100)
    {
      this.openThePage();
    }
  },


  /*
   *
   */
  openThePage:function()
  {
    // Many dojo widgets display badly if their display style attribute is "none". So we refresh the layout with resize
    dojo.style('organicLoadingPanel', 'display', 'none');
    dojo.style('thePage', 'display', 'block');
    ui.thePage.resize();
    console.log('organic.ui.openThePage: done');
  },


  example: function(/*string*/ method, /*array*/ parameters, /*string*/ url)
  {
    return dojo.hitch(this, function()
      {
        var deferredRequestHandler = new dojo.Deferred();

        // if params weren't specified, then we can assume it's varargs
        if ((this.strictArgChecks) && (parameters != null) && (arguments.length != parameters.length))
        {
          // put error stuff here, no enough params
          throw new Error("Invalid number of parameters for remote method.");
        }
        else
        {
        	console.log(arguments);
          this.bind(method, dojo._toArray(arguments), deferredRequestHandler, url);
        }
        return deferredRequestHandler;
      });
  }

});

