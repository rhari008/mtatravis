jQuery.sap.declare("UI5Module.Component");
sap.ui.getCore().loadLibrary("sap.ui.generic.app");
jQuery.sap.require("sap.ui.generic.app.AppComponent");

sap.ui.generic.app.AppComponent.extend("UI5Module.Component", {
	metadata: {
		"manifest": "json"
	}
});