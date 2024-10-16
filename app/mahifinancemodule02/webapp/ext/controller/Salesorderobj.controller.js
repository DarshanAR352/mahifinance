sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('mahifinancemodule02.ext.controller.Salesorderobj', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf mahifinancemodule02.ext.controller.Salesorderobj
             */
			onInit: function () {
				debugger
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
				var oModel = new sap.ui.model.json.JSONModel({
					input: false,  // Initial state is display mode
					text: false
				});
				this.getView().setModel(oModel, "editModel");
			},
			routing: {
				onAfterBinding: async function (oUrl) { 
                   debugger
					const buttons = this.base.getView().findAggregatedObjects(true, function (control) {
						return control.isA("sap.m.Button") && (control.getId().includes("approve") || control.getId().includes("Edit"));
					});

					var editModel = this.getView().getModel("editModel");
					
					const regex1 = /IsActiveEntity=(true|false)/;
					const match1 = oUrl.sPath.match(regex1);
					const IsActiveEntity =  match1[1];
					const section1 = this.base.getView().byId('mahifinancemodule02::SalesOrderObjectPage--fe::FacetSection::Payment_details'); 
					const section2 = this.base.getView().byId('mahifinancemodule02::SalesOrderObjectPage--fe::CustomSection::Vehicle_allocation'); 
					const section3 = this.base.getView().byId('mahifinancemodule02::SalesOrderObjectPage--fe::CustomSection::Item_Details'); 

					if(IsActiveEntity === "false") {
						buttons[1].setVisible(false);
						editModel.setProperty("/input", true);
						editModel.setProperty("/input1", true);
						editModel.setProperty("/text", false);
					} else {
						buttons[1].setVisible(true);
						editModel.setProperty("/input", false);
						editModel.setProperty("/input1", false);
						editModel.setProperty("/text", true);
					}

					setTimeout(function() {
						debugger
						let oContext = oUrl.oBinding.oElementContext;  // Get the element context
						let oBindingData = oContext.getObject(); 
						console.log(oBindingData);

						if(IsActiveEntity === "true") {

						if(oBindingData.status === 'Pending') {
							buttons[0].setVisible(true);
							buttons[1].setVisible(true);
							section1.setVisible(false);
							section2.setVisible(false);
						}
						else if(oBindingData.status === 'Sent For Approval'){
                            buttons[0].setVisible(false);
							buttons[1].setVisible(false);
							section1.setVisible(false);
							section2.setVisible(false);
						}
						else if(oBindingData.status === 'Approved'){
                            buttons[0].setVisible(true);
							buttons[1].setVisible(false);
							section1.setVisible(true);
							section2.setVisible(false);
						}
							
						 else {
							buttons[0].setVisible(true);
							buttons[1].setVisible(false);
							section1.setVisible(false);
							section2.setVisible(true);
						}
					}
					else{
					    if(oBindingData.status === 'Approved' || oBindingData.status === 'Paid'){
							editModel.setProperty("/input", false);
						editModel.setProperty("/text", true);
						}
					}
					}.bind(this), 1000); 
				 }
			}

		}
	});
});
