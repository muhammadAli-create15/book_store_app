import 'package:bookstore/common/color_extension.dart';
import 'package:bookstore/common_widget/cart_item_row.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../view_model/cart_view_model.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  final cartVM = Get.put(
      CartViewModel()); //GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<CartViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
              color: TColor.primary, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() => ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: cartVM.listArr.length,
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
              itemBuilder: (context, index) {
                var cObj = cartVM.listArr[index];
                // return CartItemRow(
                //   cObj: cObj,
                //   didQtyAdd: () {
                //    // cartVM.serviceCallUpdateCart(cObj, (cObj.qty ?? 0) + 1);
                //   },
                //   didQtySub: () {
                //     var qty = cObj.qty ?? 0;
                //     qty -= 1;
                //
                //     if (qty < 0) {
                //       qty = 0;
                //     }
                //    // cartVM.serviceCallUpdateCart(cObj, qty);
                //   },
                //   didDelete: () {
                //   //  cartVM.serviceCallRemoveCart(cObj);
                //   },
                // );
              })),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: cartVM.listArr.isNotEmpty
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                children: [
                  cartVM.listArr.isNotEmpty
                      ? MaterialButton(
                          onPressed: () {
                            //  showCheckout();
                          },
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          minWidth: double.maxFinite,
                          elevation: 0.1,
                          color: TColor.primary,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Go to Checkout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Text(
                                  "\$${cartVM.cartTotalPrice.value}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Text(
                          "Your Card is Empty",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}