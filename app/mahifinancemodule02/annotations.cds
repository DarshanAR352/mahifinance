using MyService as service from '../../srv/service';
annotate service.PurchaseOrder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'poID',
                Value : poID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'quotationID',
                Value : quotationID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'deliveryLocation',
                Value : deliveryLocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Customer_Details',
            ID : 'Customer_Details',
            Target : '@UI.FieldGroup#Customer_Details',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'poID',
            Value : poID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Pending',
                        },
                    ],
                },
            ],
        },
        Text : 'Purchase Order',
    },
    UI.FieldGroup #Customer_Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : purchaseToQuotation.quotationToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : purchaseToQuotation.quotationToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.customerID,
                Label : 'customerID',
            },
            {
                $Type : 'UI.DataField',
                Value : purchaseToQuotation.quotationToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : purchaseToQuotation.quotationToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : purchaseToQuotation.quotationToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.phone,
                Label : 'phone',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'status',
            },
        ],
    },
);

annotate service.SalesOrder with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : soID,
            Label : 'soID',
        },
        {
            $Type : 'UI.DataField',
            Value : poID,
            Label : 'poID',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'status',
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Sent For Approval',
                        },
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Pending',
                        },
                    ],
                },
            ],
        },
        Text : 'SalesOrder',
    },
    UI.LineItem #tableView1 : [
        {
            $Type : 'UI.DataField',
            Value : soID,
            Label : 'soID',
        },
        {
            $Type : 'UI.DataField',
            Value : poID,
            Label : 'poID',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'status',
        },
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView1',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Approved',
                        },
                    ],
                },
            ],
        },
        Text : 'Payment Settings',
    },
    UI.LineItem #tableView2 : [
        {
            $Type : 'UI.DataField',
            Value : soID,
            Label : 'soID',
        },
        {
            $Type : 'UI.DataField',
            Value : poID,
            Label : 'poID',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'status',
        },
    ],
    UI.SelectionPresentationVariant #tableView2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView2',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : status,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'Paid',
                        },
                    ],
                },
            ],
        },
        Text : 'Tentative Vehicle Allocation',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Customer_Details',
            ID : 'Customer_Details',
            Target : '@UI.FieldGroup#Customer_Details',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Payment_details',
            ID : 'Payment_details',
            Target : '@UI.FieldGroup#Payment_details',
        },
    ],
    UI.FieldGroup #Customer_Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.customerID,
                Label : 'customerID',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.phone,
                Label : 'phone',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'status',
            },
        ],
    },
    UI.FieldGroup #Payment_details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : salesToSettings.accHoldersName,
                Label : 'accHoldersName',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToSettings.accNumber,
                Label : 'accNumber',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToSettings.bankName,
                Label : 'bankName',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToSettings.branch,
                Label : 'branch',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToSettings.dueDate,
                Label : 'dueDate',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToSettings.ifscCode,
                Label : 'ifscCode',
            },
        ],
    },
    UI.FieldGroup #vehicle_schedule : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToVehicle.deliveryDate,
                Label : 'deliveryDate',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToVehicle.deliveryLeadTime,
                Label : 'deliveryLeadTime',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToVehicle.price,
                Label : 'price',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToVehicle.quantity,
                Label : 'quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToVehicle.shippingCharges,
                Label : 'shippingCharges',
            },
            {
                $Type : 'UI.DataField',
                Value : salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToVehicle.shippingMethod,
                Label : 'shippingMethod',
            },
        ],
    },
);

annotate service.PaymentDetails with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : paymentId,
            Label : 'paymentId',
        },
        {
            $Type : 'UI.DataField',
            Value : soID,
            Label : 'soID',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'status',
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'PaymentDetails',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Customer_Details',
            ID : 'Customer_Details',
            Target : '@UI.FieldGroup#Customer_Details',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Payment_details',
            ID : 'Payment_details',
            Target : '@UI.FieldGroup#Payment_details',
        },
    ],
    UI.FieldGroup #Customer_Details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : paymentToSales.salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.address,
                Label : 'address',
            },
            {
                $Type : 'UI.DataField',
                Value : paymentToSales.salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.customerID,
                Label : 'customerID',
            },
            {
                $Type : 'UI.DataField',
                Value : paymentToSales.salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : paymentToSales.salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : paymentToSales.salesToPurchase.purchaseToQuotation.quototionToEnquiry.enquiryToCustomer.phone,
                Label : 'phone',
            },
        ],
    },
    UI.FieldGroup #Payment_details : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : accountNo,
                Label : 'accountNo',
            },
            {
                $Type : 'UI.DataField',
                Value : amount,
                Label : 'amount',
            },
            {
                $Type : 'UI.DataField',
                Value : paymentId,
                Label : 'paymentId',
            },
            {
                $Type : 'UI.DataField',
                Value : paymentMethod,
                Label : 'paymentMethod',
            },
            {
                $Type : 'UI.DataField',
                Value : soID,
                Label : 'soID',
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'status',
            },
            {
                $Type : 'UI.DataField',
                Value : transactionId,
                Label : 'transactionId',
            },
        ],
    },
);

annotate service.Customer with {
    address @Common.FieldControl : #ReadOnly
};

annotate service.Customer with {
    customerID @Common.FieldControl : #ReadOnly
};

annotate service.Customer with {
    email @Common.FieldControl : #ReadOnly
};

annotate service.Customer with {
    name @Common.FieldControl : #ReadOnly
};

