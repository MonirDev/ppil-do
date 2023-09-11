import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/text_style.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Constants {
  Constants._();
  static const String appName = "PPIL-DO";
  static const String baseURL = "baseURL";

  //api name
  static const String loginEndpoint = "Auth/login";
  static const String getCustomerEndpoint = "Customers/GetCustomersMR";
  static const String getCustomerDueBalanceEndpoint =
      "CustomerLedger/GetCustomerLedgerInfo";
  static const String getSubCustomerEndpoint =
      "SubCustomers/GetSubCustomersByCustId";
  static const String getProductEndpoint = "ProductItems/GetProductItems";
  static const String postSaleEndpoint = "SaleOrders/PostSale";
  static const String getSalesWithDateMREndpoint =
      "SaleOrders/GetSalesWithDateMR";
  static const String getSalesWithDateASMEndpoint =
      "SaleOrders/GetSalesWithDateASM";
  static const String getSalesWithDateApprovedAsmEndpoint =
      "SaleOrders/GetSalesWithDateApprovedAsm";
  static const String getPdfEndpoint = "HtmlToPdf/GetHtmltoPdfOrder?id=";
  static const String getUserModulesEndpoint =
      "Modules/GetModulesForMenuByUserName?userName=";
  static const String orderApprovedAsm = "SaleOrders/IsReadOrderAsm";
//##################

  static const String home = "Home";

  //api service helper string
  static const String successSigned = 'Successfully signed';
  static const String couldNotSigned = 'Could not sign in';
  static const String sometingWentWrong = 'Something went wrong!';
  static const String dataUpDated = 'Data uploaded successfully!';
  static const String successfullyOrderPlaced = 'Successfully Order Placed.';
  static const String failed = 'Failed';
  static const String pleaseWait = "Please wait...";
  static const String retry = "Retry";
  static const String cancel = "Cancel";
  static const String errorText = "Error!";
  static const String loginToken = "loginToken";
  static const String success = "Success";
  static const String authorization = "Authorization";
  static const String tokenExpired = "Login token expired. Please login again";
  static const String checkConnectivity = "Check Your Internet Connection";

  //error
  static const String failedToConnectServer = "Failed to connect to server.";
  static const String networkProblemPleaseTryAgainLater =
      "Network Problem! Please try again later";
  static const String tryAgain = "please try again!";
  static const String networkError = "Network Error";
  static const String somethingWentWrong = "Something went wrong.";

  //User type helper
  static const String mrTypeString = "Demand Order MR";
  static const String asmTypeString = "DO-ASM-Approval";

  ////
  static const String login = "Login";
  static const String userName = "User Name";
  static const String enterUserName = "Enter username";
  static const String enterPassword = "Enter password";
  static const String password = "Password";
  static const String userNameRequired = "User name is required!";
  static const String passRequired = "Password is required!";
  static const String logout = "Logout";
  static const String yes = "Yes";
  static const String createOrder = "Create Order";
  static const String orderHistory = "Order History";
  static const String sureToDelete = "Are you sure, you want to delete this?";
  static const String sureTologout = "Are you sure, you want to Logout?";

  //create order page
  static const String selectCustomer = "Select Customer";
  static const String selectSubCustomer = "Select Sub Customer";
  static const String pleaseSelect = "Please select";
  static const String selectProduct = "Select Product";
  static const String enterPrice = "Enter price";
  static const String totalPrice = "Total price";
  static const String enterQuantity = "Enter quantity";
  static const String enterDiscount = "Enter discount (%)";
  static const String ratePcs = "Rate/Pcs";
  static const String discountPerc = "Discount (%)";
  static const String selectedProducts = "Selected Products";
  static const String quantity = "Quantity";
  static const String qty = "Qty";
  static const String totalAmount = "Total Amount";
  static const String select = "Select";
  static const String name = "Name";
  static const String model = "Model";
  static const String discount = "Discount";
  static const String brand = "Brand";
  static const String group = "Group";
  static const String category = "Category";
  static const String dueBalance = "Due Balance";
  static const String rate = "Rate";
  static const String netRate = "Net Rate";
  static const String disPercentage = "Dis%";
  static const String productCode = "P.Code";
  static const String description = "Description";
  static const String rateAndDiscount = "Rate/Dis%";
  static const String qtyAndTotalAmount = "Qty/Total";
  static const String modeOfPayment = "Mode of payment";
  static const String addThisProduct = "Add product";
  static const String deliveryAddress = "Delivery adress";
  static const String enterDeliveryAddress = "Enter Delivery adress";
  static const String enterDeliveryMobileNo = "Enter Delivery mobile no";
  static const String deliveryMobileNo = "Delivery mobile no";
  static const String deliveryDate = "Delivery date";
  static const String grossAmount = "Gross Amount";
  static const String netTotal = "Net Total";
  static const String discountTotal = "Discount Total";
  static const String selectSaleDate = "Select Entry Date";
  static const String selectDate = "Select a date";
  static const String notes = "Notes";
  static const String orderEntryDate = "Order entry date";
  static const String product = "Product";
  static const String placeOrder = "Place Order";
  static const String addProductToorder = "Please add atleast 1 product";
  static const String writeNotes = "Write notes";
  static const String youAlreadyAddedThisProduct =
      "You Already Added This Product";
  static const String addedProductSuccessfully = "Product added successfully";
  static const String dateFormat = "dd/MM/yyyy";

  //Create order page field validation
  static const String enterRatePcsFirst = "Please Enter Rate/Pcs First";

  //order history page
  static const String fromDate = "From Date";
  static const String toDate = "To Date";
  static const String search = "Search";
  static const String approved = "Approved";
  static const String preview = "Preview";
  static const String sl = "SL";
  static const String date = "Date";
  static const String partyId = "PartyID";
  static const String party = "Party";
  static const String subId = "SubID";
  static const String subDealer = "SubDealer";
  static const String orderNo = "OrderNumber";
  static const String saleType = "SaleType";
  static const String bill = "Bill";
  static const String areUSureToApprovedDo =
      "Are you sure that you want to make approve this DO?";
  static const String reviewPreview = "Review/Preview";
  static const String orderList = "Order List";

//pdf view
  static const String orderPdf = "Order PDF";
  static const String downloadPdf = "Download PDF";

  //Constants list
  static const List<String> paymentList = [
    'Cash on Delivery',
    'Calender Month',
    'Advance',
  ];

  static List<GridColumn> orderTableColumn = <GridColumn>[
    GridColumn(
        columnName: Constants.sl,
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              Constants.sl,
            ))),
    GridColumn(
        columnName: Constants.date,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.date,
            ))),
    GridColumn(
        columnName: Constants.partyId,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.partyId,
            ))),
    GridColumn(
        columnName: Constants.party,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.party,
            ))),
    GridColumn(
        columnName: Constants.subId,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.subId,
            ))),
    GridColumn(
        columnName: Constants.subDealer,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.subDealer,
            ))),
    GridColumn(
        columnName: Constants.orderNo,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.orderNo,
            ))),
    GridColumn(
        columnName: Constants.saleType,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.saleType,
            ))),
    GridColumn(
        columnName: Constants.bill,
        label: Container(
            alignment: Alignment.center,
            child: const Text(
              Constants.bill,
            ))),
    GridColumn(
      columnName: Constants.reviewPreview,
      label: Container(
        alignment: Alignment.center,
        child: const Text(
          Constants.reviewPreview,
        ),
      ),
    ),
    GridColumn(
      columnName: " ",
      label: Container(
        alignment: Alignment.center,
        child: const Text(
          " ",
        ),
      ),
    ),
  ];

  ///constants style utils
  static const Map<int, TableColumnWidth> tableColumnWidth = {
    0: FixedColumnWidth(10),
    1: FixedColumnWidth(80),
    2: FixedColumnWidth(50),
    3: FixedColumnWidth(50),
  };
  static const BorderSide borderSide =
      BorderSide(width: 1, color: AppColors.black);

  static final DropDownDecoratorProps dropDownStyle = DropDownDecoratorProps(
    baseStyle: AppTextStyle.bb14,
    dropdownSearchDecoration: InputDecoration(
        hintText: Constants.pleaseSelect,
        hintStyle: AppTextStyle.nw14.copyWith(
          color: AppColors.grey,
        ),
        suffixIconColor: AppColors.black,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 2, left: 15)),
  );

  static const BoxConstraints constraints = BoxConstraints(
    maxHeight: 300,
  );
  static const BottomSheetProps bottomSheetProps = BottomSheetProps(
    elevation: 16,
    backgroundColor: Color(0xFFFDF3D6),
  );
}
