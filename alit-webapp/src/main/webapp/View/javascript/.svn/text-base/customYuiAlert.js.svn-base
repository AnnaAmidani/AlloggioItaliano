(function() {
2     YAHOO.namespace('widget.alert');
3
4     alert_old = window.alert;
5     window.alert = function(str) {
6         YAHOO.widget.alert.dlg.setBody(str);
7         YAHOO.widget.alert.dlg.cfg.queueProperty('icon', YAHOO.widget.SimpleDialog.ICON_WARN);
8         YAHOO.widget.alert.dlg.cfg.queueProperty('zIndex', 9999);
9         YAHOO.widget.alert.dlg.render(document.body);
10          if (YAHOO.widget.alert.dlg.bringToTop) {
11              YAHOO.widget.alert.dlg.bringToTop();
12          }
13          YAHOO.widget.alert.dlg.show();
14      };
15
16
17      YAHOO.util.Event.on(window, 'load', function() {
18
19          var handleOK = function() {
20              this.hide();
21          };
22
23          YAHOO.widget.alert.dlg = new YAHOO.widget.SimpleDialog('widget_alert', {
24              visible:false,
25              width: '20em',
26              zIndex: 9999,
27              close: false,
28              fixedcenter: true,
29              modal: false,
30              draggable: true,
31              constraintoviewport: true,
32              icon: YAHOO.widget.SimpleDialog.ICON_WARN,
33              buttons: [
34                  { text: 'OK', handler: handleOK, isDefault: true }
35                  ]
36          });
37          YAHOO.widget.alert.dlg.setHeader("Alert!");
38          YAHOO.widget.alert.dlg.setBody('Alert body passed to window.alert'); // Bug in panel, must have a body when rendered
39          YAHOO.widget.alert.dlg.render(document.body);
40      });
41  })();