sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'mahifinancemodule02/test/integration/FirstJourney',
		'mahifinancemodule02/test/integration/pages/PurchaseOrderList',
		'mahifinancemodule02/test/integration/pages/PurchaseOrderObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseOrderList, PurchaseOrderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('mahifinancemodule02') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseOrderList: PurchaseOrderList,
					onThePurchaseOrderObjectPage: PurchaseOrderObjectPage
                }
            },
            opaJourney.run
        );
    }
);