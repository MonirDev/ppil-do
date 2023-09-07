import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppildo/app/common/helper/order_validation.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';
import 'package:ppildo/app/data/repository/customer_repository.dart';
import 'package:ppildo/app/data/repository/order_repository.dart';
import 'package:ppildo/app/data/repository/product_repository.dart';
import 'package:ppildo/app/utils/constants.dart';

class CreateOrderController extends GetxController {
  var isLoading = false.obs;
  var rateTextEditingController = TextEditingController().obs;
  var quantityTextEditingController = TextEditingController(text: "1").obs;
  var discountTextEditingController = TextEditingController().obs;
  var deliveryAddressTextEditingController = TextEditingController().obs;
  var deliveryMNoTextEditingController = TextEditingController().obs;
  var selectSaleDateTextEditingController = TextEditingController().obs;
  var deliveryDateTextEditingController = TextEditingController().obs;
  var notesTextEditingController = TextEditingController().obs;

  var dropProductSelected = false.obs;

  //value
  var selectedCustomerName = "".obs;
  var selectedSubCustomerName = "".obs;
  var selectedProductCode = "".obs;
  var customerModel = CustomerModel().obs;
  var subCustomerModel = SubCustomerModel().obs;
  var productModel = ProductModel().obs;
  var modeOfPayment = "".obs;
  var selectedCustomerId = RxInt(-1);
  var selectedSubCustomerId = RxInt(-1);
  var selectedProductAmount = "".obs; //Total amount after discount
  var selectedCustomerDueBalance = 0.0.obs;

//Data list
  var customerList = <CustomerModel>[].obs;
  var subCustomerList = <SubCustomerModel>[].obs;
  var productList = <ProductModel>[].obs;
  var selectedProductList = <ProductModel>[].obs;
  // var selectedProductListWithChanges = <ProductModel>[].obs;

  Rx<DateTime> selectedSaleDate = DateTime.now().obs;
  Rx<DateTime> selectedDeliveryDate = DateTime.now().obs;

  @override
  void onReady() {
    getCustomerList();
    selectSaleDateTextEditingController.value.text =
        DateFormat(Constants.dateFormat).format(selectedSaleDate.value);
    deliveryDateTextEditingController.value.text =
        DateFormat(Constants.dateFormat).format(selectedDeliveryDate.value);
    super.onReady();
  }

  //put Repository
  final CustomerRepository _customerRepository = Get.put(CustomerRepository());
  final ProductRepository _productRepository = Get.put(ProductRepository());
  final OrderRepository _orderRepository = Get.put(OrderRepository());

  //place order
  placeOrder() async {
    CommonWidget.loader();
    try {
      Get.put(OrderValidation()).validateOrder();
      await _orderRepository
          .placeOrder(
        customerModel.value,
        subCustomerModel.value,
        selectedProductList,
        selectedSaleDate.value,
        selectedDeliveryDate.value,
        deliveryAddressTextEditingController.value.text,
        getSelectedProductNetTotal(),
        totalDiscount(),
        notesTextEditingController.value.text,
        modeOfPayment.value,
        selectedCustomerDueBalance.value,
        deliveryMNoTextEditingController.value.text,
      )
          .then(
        (value) async {
          //set initial empty value
          customerModel.value = CustomerModel();
          subCustomerModel.value = SubCustomerModel();
          productModel.value = ProductModel();
          selectedCustomerDueBalance.value = 0.0;
          selectedCustomerName.value = "";
          selectedSubCustomerName.value = "";
          selectedProductCode.value = "";
          selectedProductList.value = [];
          dropProductSelected.value = false;
          rateTextEditingController.value.text = "";
          quantityTextEditingController.value.text = "1";
          discountTextEditingController.value.text = "";
          selectSaleDateTextEditingController.value.text =
              DateFormat(Constants.dateFormat).format(
            DateTime.now(),
          );
          deliveryAddressTextEditingController.value.text = "";
          deliveryMNoTextEditingController.value.text = "";
          deliveryDateTextEditingController.value.text =
              DateFormat(Constants.dateFormat).format(
            DateTime.now(),
          );
          notesTextEditingController.value.text = "";

          //
          Get.back();
          CommonWidget.callSnackBar(Constants.successfullyOrderPlaced, false);
        },
      );
    } catch (e) {
      Get.back();
      CommonWidget.callSnackBar(e.toString());
    }
  }

//Get Customer listpp001
  getCustomerList() async {
    CommonWidget.loader();
    try {
      await _customerRepository.getCustomer().then(
        (value) async {
          // Get.back();
          customerList.value = value.customerlist;
          await getProductsList();
        },
      );
    } catch (e) {
      Get.back();
      CommonWidget.responseErrorPopUp(e.toString(), () {
        if (e.toString() != Constants.tokenExpired) getCustomerList();
      });
      log("Customer Api error");
    }
  }

//Get Sub Customer list
  getSubCustomerList(int customerId) async {
    CommonWidget.loader();
    try {
      await _customerRepository.getSubCustomer(customerId).then(
        (value) async {
          // Get.back();
          subCustomerList.value = value.subCustomerlist;
          await getCustomerDueBalance(customerId);
        },
      );
    } catch (e) {
      Get.back();
      CommonWidget.responseErrorPopUp(e.toString(), () {
        if (e.toString() != Constants.tokenExpired) getCustomerList();
      });
      log("SubCustomer Api error");
    }
  }

//Get Customer Due Balance
  getCustomerDueBalance(int customerId) async {
    try {
      await _customerRepository.getCustomerDueBalance(customerId).then(
        (value) {
          Get.back();
          selectedCustomerDueBalance.value = value;
        },
      );
    } catch (e) {
      Get.back();
      CommonWidget.responseErrorPopUp(e.toString(), () {
        if (e.toString() != Constants.tokenExpired) getCustomerList();
      });
      log("Customer Due Balance Api error");
    }
  }

//Get Products list
  getProductsList() async {
    try {
      await _productRepository.getProducts().then(
        (value) async {
          Get.back();
          productList.value = value.productlist;
        },
      );
    } catch (e) {
      Get.back();
      CommonWidget.responseErrorPopUp(e.toString(), () {
        if (e.toString() != Constants.tokenExpired) getCustomerList();
      });
      log("GetProducts Api error");
    }
  }

  addSelectedProduct() {
    if (!selectedProductList
        .any((item) => productModel.value.productCode == item.productCode)) {
      var rate = rateTextEditingController.value.text;
      var discount = discountTextEditingController.value.text.isEmpty
          ? "0"
          : discountTextEditingController.value.text;
      var quantity = quantityTextEditingController.value.text.isEmpty
          ? "1"
          : quantityTextEditingController.value.text;
      if (rateTextEditingController.value.text.isNotEmpty) {
        productModel.value.saleRate = double.parse(rate); //rate set by user
        productModel.value.netRate =
            double.parse(getDiscountPrice(1)); // net rate after discount
        productModel.value.quantity =
            double.parse(quantity); //user total quantity
        productModel.value.disPerc =
            double.parse(discount); //discount perc. set by user
        productModel.value.totalAmoount = double.parse(
            selectedProductAmount.value); //Total amount after discount
        selectedProductList.add(productModel.value);

        //reset product section
        productModel.value = ProductModel();
        dropProductSelected.value = false;
        rateTextEditingController.value.text = "";
        quantityTextEditingController.value.text = "1";
        discountTextEditingController.value.text = "";

        CommonWidget.callSnackBar(Constants.addedProductSuccessfully, false);
      } else {
        CommonWidget.callSnackBar(Constants.selectProduct);
      }
    } else {
      CommonWidget.callSnackBar(Constants.youAlreadyAddedThisProduct);
    }
  }

  //remove selected product
  removeSelectedProduct(int index) {
    selectedProductList.removeAt(index);
    // selectedProductListWithChanges.removeAt(index);
    update();
  }

// Get selected product total amount
  setSelectedProductTotalAmount() {
    var rate = rateTextEditingController.value.text;
    var discount = discountTextEditingController.value.text;
    var quantity = quantityTextEditingController.value.text;

    if (rate.isNotEmpty) {
      if (discount.isNotEmpty && double.parse(discount) > 0) {
        if (quantity.isNotEmpty && double.parse(quantity) > 0) {
          selectedProductAmount.value =
              getDiscountPrice(double.parse(quantity));
        } else {
          selectedProductAmount.value = getDiscountPrice(1.0);
        }
      } else {
        if (quantity.isNotEmpty && double.parse(quantity) > 0) {
          selectedProductAmount.value =
              (double.parse(rate) * double.parse(quantity)).toStringAsFixed(2);
        } else {
          selectedProductAmount.value = rate;
        }
      }
    } else {
      CommonWidget.callSnackBar(Constants.enterRatePcsFirst);
    }
  }

//get discount Price
  String getDiscountPrice(double quantity) {
    var value = rateTextEditingController.value.text;
    return ((double.parse(value) -
                (double.parse(value) *
                    (discountTextEditingController.value.text.isEmpty
                        ? 0.0
                        : double.parse(
                            discountTextEditingController.value.text)) /
                    100.0)) *
            quantity)
        .toStringAsFixed(2);
  }

  //
  double getSelectedProductTotalAmount() {
    return selectedProductList.fold(0.0, (previousValue, element) {
      return previousValue + (element.saleRate! * element.quantity!);
    });
  }

  double totalDiscount() {
    return getSelectedProductTotalAmount() - getSelectedProductNetTotal();
  }

  double getSelectedProductNetTotal() {
    return selectedProductList.fold(0.0, (previousValue, element) {
      return previousValue + (element.netRate! * element.quantity!);
    });
  }

  //select customer func
  customerChanged(CustomerModel customer) async {
    selectedCustomerId.value = customer.id ?? -1;
    selectedCustomerName.value = customer.name!;
    customerModel.value = customer;
    if (selectedCustomerId.value != -1) {
      await getSubCustomerList(selectedCustomerId.value);
      subCustomerModel.value = SubCustomerModel();
    }
  }

  //select Subcustomer func
  subcustomerChanged(SubCustomerModel subCustomer) async {
    selectedSubCustomerName.value = subCustomer.subCustomerName!;
    subCustomerModel.value = subCustomer;
  }

  //select Product func
  productChanged(ProductModel product) async {
    //set initial value after product selected
    dropProductSelected.value = true;
    rateTextEditingController.value.text = product.saleRateMrp.toString();
    selectedProductCode.value = product.productCode!;
    selectedProductAmount.value = product.saleRateMrp.toString();
    quantityTextEditingController.value.text = "1";
    discountTextEditingController.value.text = "";
    Get.focusScope?.unfocus();

    productModel.value = product;
  }

  //ratePerPcs onChanged
  ratePerPcsOnChanged(String value) {
    if (rateTextEditingController.value.text.isNotEmpty) {
      setSelectedProductTotalAmount();
    } else {
      CommonWidget.callSnackBar(Constants.enterRatePcsFirst);
    }
  }

  //discount onChanged
  discountOnChanged(String value) {
    if (rateTextEditingController.value.text.isNotEmpty) {
      setSelectedProductTotalAmount();
    } else {
      discountTextEditingController.value.text = "";
      CommonWidget.callSnackBar(Constants.enterRatePcsFirst);
    }
  }

  //quantity onChanged
  quantityOnChanged(String value) {
    if (rateTextEditingController.value.text.isNotEmpty) {
      //Check if quantity are negative or not
      if (value != "" && double.parse(value) > 0) {
        setSelectedProductTotalAmount();
      } else {
        // quantityTextEditingController.value.text = "";
      }
    } else {
      quantityTextEditingController.value.text = "1";
      CommonWidget.callSnackBar(Constants.enterRatePcsFirst);
    }
  }

  //deliveryAddress onChanged
  deliveryAddressOnChanged(String value) {}
  //mobileNo onChanged
  mobileNoOnChanged(String value) {}
  //notes onChanged
  notesOnChanged(String value) {}
  //notes onChanged
  paymentModeChanged(String value) {
    modeOfPayment.value = value;
  }

  //select sale date date
  Future<void> selectSaleDate() async {
    final DateTime? pickedDate = await CommonWidget.showDatePickerDialog(
      selectedSaleDate.value,
    );

    if (pickedDate != null) {
      selectedSaleDate.value = pickedDate;
      selectSaleDateTextEditingController.value.text =
          DateFormat(Constants.dateFormat).format(
        selectedSaleDate.value,
      );
    }
  }

  //select DeliveryDate
  Future<void> selectDeliveryDate() async {
    final DateTime? pickedDate = await CommonWidget.showDatePickerDialog(
      selectedDeliveryDate.value,
    );

    if (pickedDate != null) {
      selectedDeliveryDate.value = pickedDate;
      deliveryDateTextEditingController.value.text =
          DateFormat(Constants.dateFormat).format(selectedDeliveryDate.value);
    }
  }
}
