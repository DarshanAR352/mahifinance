sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('mahifinancemodule02.ext.controller.Paymentobj', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf mahifinancemodule02.ext.controller.Paymentobj
             */
			onInit: function () {
				debugger
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
			},
			routing: {
				onBeforeBinding: async function (oUrl) { 

					const oSection = this.getView().byId("mahifinancemodule02::PaymentDetailsObjectPage--fe::CustomSubSection::Invoice_Pdf");
					//oSection.setVisible(false); 
					const footer = this.getView().byId("mahifinancemodule02::PaymentDetailsObjectPage--fe::FooterBar::_fc");
					console.log(footer);
					const baseUrl = oUrl.oModel.sServiceUrl;
					const openUrl = baseUrl + oUrl.sPath.slice(1) + '/paymentToFiles'
					console.log(openUrl);

					const response = await new Promise((resolve, reject) => {
						$.ajax({
            		    url: openUrl,
            		    method: "GET",
            		    success: function (oData) {
            		        resolve(oData);
            		    }
            		});
					});
			
					console.log(response);
					if(response) {
						var oModel = new sap.ui.model.json.JSONModel({
							pdfSource: baseUrl + response.url
						});
						this.getView().setModel(oModel, "pdfModel");
						footer.setVisible(false);
						oSection.setVisible(true);
					} else {
						oSection.setVisible(false);
						footer.setVisible(true);
					}
					
				}
			}
		}
	});
});
