
sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/PDFViewer",
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/Text"
], function(MessageToast, PDFViewer) {
    'use strict';

    return {
        Invoice: async function(oEvent) {
            debugger
            var oDialog = new Dialog({
                title: "Confirmation",
                type: "Message",
                content: new Text({ text: "Are you sure?" }),
                beginButton: new Button({
                    text: "Confirm",
                    press: async function () { 
                        onPress();
                        oDialog.close();
                    } 
                }),
                endButton: new Button({
                    text: "Cancel",
                    press: function () {
                        oDialog.close();
                    }
                })
            });
            async function onPress() {
                debugger
                const oSection = this._view.byId("mahifinancemodule02::PaymentDetailsObjectPage--fe::CustomSubSection::Invoice_Pdf");
                //oSection.setVisible(false); 
                const footer = this._view.byId("mahifinancemodule02::PaymentDetailsObjectPage--fe::FooterBar::_fc");
                const regex = /paymentId='([^']+)'/; // Match the paymentId inside single quotes
                const match = oEvent.sPath.match(regex);
                const paymentId =  match[1]; 
    
                const button = this.byId("invoice");
    
                
                let oContext = oEvent.oBinding.oElementContext;  // Get the element context
                let oBindingData = oContext.getObject();   // Retrieve the bound object data
                console.log(oBindingData);
    
                this._pdfViewer = new PDFViewer({
                    isTrustedSource : true,
                });
                this.addDependent(this._pdfViewer);
    
                const baseUrl = oEvent.oModel.sServiceUrl;
                // const aUrl = baseUrl + 'Files(ID=8edf3daa-0ecf-4ca3-8260-05ae6a8567df)';
                // console.log(aUrl);
    
                const openUrl = baseUrl + oEvent.sPath.slice(1) + '/paymentToFiles'
                const response1 = await fetchData(openUrl);
    
                const sUrl = baseUrl + `generateInvoice(paymentId='${paymentId}')`
    
                if(!response1) {
                    const response2 = await fetchData(sUrl);
                    // const wUrl = baseUrl + response1.url;
                    // // this._pdfViewer.setSource(wUrl);
                    // // this._pdfViewer.setTitle("My Custom Title");
                    // // this._pdfViewer.open();
                    // //window.open(wUrl);
                    // var oModel = new sap.ui.model.json.JSONModel({
                    //     pdfSource: wUrl
                    // });
                    // this._view.setModel(oModel, "pdfModel");
                    // footer.setVisible(false);
                    // oSection.setVisible(true);
                } else {
                }
    
    
                
    
    
                // jQuery.ajax({ 
                //     url: aUrl,
                //     method: "DELETE",
                //     success: function (data) {
                //         console.log(data);
                //     },
                // })
    
    
            
    
            }
            async function fetchData (url) {
                return new Promise((resolve, reject) => {
                    jQuery.ajax({
                        url: url,
                        method: "GET",
                        dataType: "json",
                        success: function (data) {
                            resolve(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            reject(new Error(textStatus + ': ' + errorThrown));
                        }
                    });
                });
            }
        }
    };
});
