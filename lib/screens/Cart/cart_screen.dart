import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spree/Common/custom_drop_down.dart';
import 'package:spree/providers/order_provider.dart';
import 'package:spree/providers/profile_provider.dart';

import 'componenet/delivery_time_sheet.dart';
import 'componenet/select_your_address.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

bool isScrollControlled = false;

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;
  String dropdownValue = '1';

  @override
  void initState() {
    // totalPrice = 0.0;
    isScrollControlled = false;
    btnIsVisible = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<OrderProvider>(
        builder: (_, order, child) => Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   title: Text(
          //     "Shopping Cart",
          //     style: GoogleFonts.roboto(
          //         fontSize: size.width * 0.08,
          //         fontWeight: FontWeight.w700,
          //         color: Colors.black),
          //   ),
          //   toolbarHeight: size.height * 0.14,
          // ),
          body: order.getList().length <= 0
              ? Container(
                  width: size.width,
                  height: size.height * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width*0.8,
                        height: size.height*0.2,
                        child: Image.asset("images/empty.png",height: 250,width:250,),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width,
                        margin: EdgeInsets.only(
                          top: size.height * 0.025,
                        ),
                        child: Text(
                          "Your Cart is Empty",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: size.width * 0.06),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.7,
                        margin: EdgeInsets.only(top: size.height * 0.02),
                        child: Text(
                          "When you add products to your order they'll show up here.",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.05,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  width: size.width,
                  height: size.height,
                  child: ListView.builder(
                      itemCount: order.getList().length,
                      itemBuilder: (_, index) {
                        totalPrice =
                            double.parse(order.getList()[index]["price"]) +
                                totalPrice;

                        return Container(
                          width: size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.width * 0.02),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: size.width * 0.3,
                                    height: size.width * 0.3,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${order.getList()[index]["image"]}",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),

                                    // Image.asset(
                                    //     "${order.getList()[index]["image"]}"),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: size.height * 0.02,
                                      // ),
                                      Text(
                                        "  ${order.getList()[index]["brand"]}",
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.029,
                                            letterSpacing: 0.6),
                                      ),
                                      // SizedBox(
                                      //   height: size.height*0.01,
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            " ${order.getList()[index]["name"]}",
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * 0.045),
                                          ),
                                          // SizedBox(width: 30,),
                                          Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  120, 0, 0, size.height * 0),
                                              child: CustomDropdownButton(
                                                dropdownColor: Colors.white,
                                                focusColor: Colors.grey,
                                                value: dropdownValue,

                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                iconSize: 24,
                                                elevation: 16,
                                                //style: const TextStyle(color: Colors.deepPurple),
                                                underline: Container(
                                                  height: 2,
                                                  //color: Colors.deepPurpleAccent,
                                                ),
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    dropdownValue = newValue;
                                                  });
                                                },
                                                items: <String>[
                                                  '1',
                                                  '2',
                                                  '3',
                                                  '4'
                                                ].map<
                                                        CustomDropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return CustomDropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  );
                                                }).toList(),
                                              )

                                              // DropdownButton<String>(
                                              //   dropdownColor: Colors.white,
                                              //   focusColor: Colors.grey,
                                              //   value: dropdownValue,
                                              //
                                              //   icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                                              //   iconSize: 24,
                                              //   elevation: 16,
                                              //   //style: const TextStyle(color: Colors.deepPurple),
                                              //   underline: Container(
                                              //     height: 2,
                                              //     //color: Colors.deepPurpleAccent,
                                              //   ),
                                              //   onChanged: (String newValue) {
                                              //     setState(() {
                                              //       dropdownValue = newValue;
                                              //     });
                                              //   },
                                              //   items: <String>['1', '2', '3', '4']
                                              //       .map<DropdownMenuItem<String>>((String value) {
                                              //     return DropdownMenuItem<String>(
                                              //
                                              //       value: value,
                                              //       child: Text(value, style: TextStyle(color: Colors.black),),
                                              //     );
                                              //   }).toList(),
                                              // )

                                              // Text(
                                              //   "QTY -> ${order.getList()[index]["quantity"]}",
                                              //   style: GoogleFonts.roboto(
                                              //       color: Colors.black,
                                              //       fontWeight: FontWeight.w700,
                                              //       fontSize: size.width * 0.04),
                                              // ),
                                              ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: size.height*0.014,
                                      // ),
                                      Text(
                                        " \$${order.getList()[index]["price"]}",
                                        style: GoogleFonts.meeraInimai(
                                            color:
                                                Colors.black.withOpacity(0.9),
                                            fontWeight: FontWeight.w700,
                                            fontSize: size.width * 0.033),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                            // width: 200,
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                //IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
                                                Text(
                                                  "Save for Later",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            Row(
                                              children: [
                                                //IconButton(icon: Icon(Icons.delete_outline), onPressed: () {}),
                                                Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            //SizedBox(width: 30,),
                                          ],
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
          bottomNavigationBar: order.getList().length <= 0
              ? Container(
                  height: size.height * 0.22,
                  width: size.width,
                )
              : Container(
                  height: size.height * 0.2,
                  width: size.width,
                  child: Column(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(
                      //       top: size.height * 0.02,
                      //       bottom: size.height * 0.02),
                      //   height: 1,
                      //   width: size.width,
                      //   color: Colors.grey[400],
                      // ),
                      // Container(
                      //   margin:
                      //       EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      //   width: size.width,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Apply a Promo Code",
                      //         style: GoogleFonts.roboto(
                      //             fontWeight: FontWeight.w700,
                      //             fontSize: size.width * 0.04),
                      //       ),
                      //       Container(
                      //           padding:
                      //               EdgeInsets.only(right: size.width * 0.03),
                      //           child: Icon(Icons.keyboard_arrow_down_outlined))
                      //     ],
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.02),
                        height: 1,
                        width: size.width,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.055),
                            ),
                            Container(
                                height: size.height * 0.05,
                                padding: EdgeInsets.only(
                                    top: size.height * 0.015,
                                    right: size.width * 0.03),
                                child: Text(
                                  "\$$totalPrice + Taxes & Fees",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.02),
                        height: 1,
                        width: size.width,
                        color: Colors.grey[400],
                      ),
                      InkWell(
                        onTap: () {
                          settingModalBottomSheetTime(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                              vertical: size.height * 0.005),
                          height: size.height * 0.05,
                          width: size.width,
                          alignment: Alignment.center,
                          child: Text(
                            "Checkout",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

settingModalBottomSheetTime(context) {
  showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      context: context,
      builder: (BuildContext buildContext) {
        return DeliveryTimeBottomSheet();
      });
}

settingModalBottomSheetAddress(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext buildContext) {
        return SelectAddress();
      });
}
