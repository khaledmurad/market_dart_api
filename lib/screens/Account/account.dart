import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:spree/screens/Account/Components/all_orders.dart';
import 'package:spree/screens/Account/Components/contact_support.dart';
import 'package:spree/screens/Account/Components/notifications.dart';
import 'package:spree/screens/Account/Components/saved_products.dart';
import 'package:spree/screens/Auth/login_screen.dart';
import 'package:toast/toast.dart';

import 'Components/account_details.dart';
import 'Components/credit_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();

  moveToAccountDetailsView({
    String email,
  }) {
    screenPush(
        context,
        AccountDetails(
          email: email,
        ));
  }

  moveToPaymentMethodsView() {
    screenPush(context, AddCard());
  }

  moveToPurchaseHistoryView() {
    screenPush(context, AllOrders());
  }

  moveToSavedProductsView() {
    screenPush(context, SavedProducts());
  }

  moveToContactSupportView() {
    screenPush(context, ContactSupport());
  }

  moveToNotificationsView() {
    screenPush(context, Notifications());
  }

  String email;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Name
          // Container(
          //     margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
          //     width: size.width,
          //     child: FutureBuilder(
          //       future: CallApi().getProfile(context: context),
          //       builder: (_, snapshot) {
          //         if (snapshot.hasData) {
          //           email = snapshot.data.data.email;
          //           return Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 child: Text(
          //                   "${snapshot.data.data.firstName}",
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: size.width * 0.07,
          //                       fontWeight: FontWeight.w700
          //                   )
          //                 ),
          //                 margin: EdgeInsets.only(left: size.width * 0.05),
          //               ),
          //             ],
          //           );
          //         } else if (snapshot.hasError) {
          //           return Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 child: Text(
          //                   "${snapshot.error}",
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: size.width * 0.07,
          //                       fontWeight: FontWeight.w700
          //                   )
          //                 ),
          //                 margin: EdgeInsets.only(left: size.width * 0.05),
          //               ),
          //             ],
          //           );
          //         } else {
          //           return Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 child: Text(
          //                   "Loading..",
          //                   style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: size.width * 0.07,
          //                     fontWeight: FontWeight.w700
          //                   )
          //                 ),
          //                 margin: EdgeInsets.only(left: size.width * 0.05),
          //               ),
          //             ],
          //           );
          //         }
          //       },
          //     )),

          /// Spree Wallet
          // Container(
          //   margin: EdgeInsets.only(
          //       left: size.width * 0.05, right: size.width * 0.09),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Spree Wallet",
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: size.width * 0.05,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //       Container(
          //         padding: EdgeInsets.all(5),
          //         decoration: BoxDecoration(
          //             border: Border.all(color: Colors.black, width: 2),
          //             borderRadius: BorderRadius.circular(4)),
          //         child: Text(
          //           "\$0.00",
          //           style: GoogleFonts.cabin(
          //             color: Colors.black,
          //             fontSize: size.width * 0.05,
          //             fontWeight: FontWeight.w900,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          /// General
          SizedBox(height: size.height * 0.03,),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                top: size.height * 0,
                left: size.width * 0.05,
                right: size.width * 0.09),
            child: Text(
              "Profile info",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
              )
            ),
          ),
          SizedBox(height: size.height * 0.01,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Divider(
                color: Colors.black,
              height: size.height*0.0025,
            ),
          ),
          /// My Account Details
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                top: size.height * 0.015,
                left: size.width * 0.05,
                right: size.width * 0.09),
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToAccountDetailsView(email: email);
                    },
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.person,
                            size: 25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Account Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToPaymentMethodsView();
                    },
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.creditcard,
                            size: 25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Payment Methods",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToPurchaseHistoryView();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.access_time_outlined,
                            size: 25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Purchase History",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToSavedProductsView();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.bookmark_border,
                            size:25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Saved Products",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Help & Support
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.only(
          //       top: size.height * 0.04,
          //       left: size.width * 0.05,
          //       right: size.width * 0.09),
          //   child: Text(
          //     "Settings",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: size.width * 0.065,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                top: size.height * 0.015,
                left: size.width * 0.05,
                right: size.width * 0.09),
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToNotificationsView();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.notifications_outlined,
                            size:25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Notifications",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToContactSupportView();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.support_agent,
                            size: 25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Contact Support",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.only(
          //       top: size.height * 0.04,
          //       left: size.width * 0.05,
          //       right: size.width * 0.09),
          //   child: Text(
          //     "Legal",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: size.width * 0.045,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.only(
          //       top: size.height * 0.015,
          //       left: size.width * 0.05,
          //       right: size.width * 0.09),
          //   decoration: BoxDecoration(),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Row(
          //           children: [
          //             Icon(Icons.file_copy_outlined,
          //                 size: 20, color: Color(0xff0059ff)),
          //             SizedBox(width: 10),
          //             Expanded(
          //               child: Text("Terms of Service",
          //                   style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: size.width * 0.04,
          //                   )),
          //             ),
          //             // Icon(
          //             //   Icons.chevron_right,
          //             //   size: 20,
          //             //   color: Colors.grey[600],
          //             // )
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Row(
          //           children: [
          //             Icon(Icons.file_copy_outlined,
          //                 size: 20, color: Color(0xff0059ff)),
          //             SizedBox(width: 10),
          //             Expanded(
          //               child: Text("Privacy Policy",
          //                   style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: size.width * 0.04,
          //                   )),
          //             ),
          //             // Icon(
          //             //   Icons.chevron_right,
          //             //   size: 20,
          //             //   color: Colors.grey[600],
          //             // )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.only(
          //       top: size.height * 0.04,
          //       left: size.width * 0.05,
          //       right: size.width * 0.09),
          //   child: Text(
          //     "Payment",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: size.width * 0.045,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   margin: EdgeInsets.only(
          //       top: size.height * 0.015,
          //       left: size.width * 0.05,
          //       right: size.width * 0.09),
          //   decoration: BoxDecoration(),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(10),
          //         child: Row(
          //           children: [
          //             Icon(Icons.credit_card, size: 20, color: Color(0xff0059ff)),
          //             SizedBox(width: 10),
          //             Expanded(
          //               child: Text("Cards",
          //                   style: TextStyle(
          //                     color: Colors.grey[600],
          //                     fontSize: size.width * 0.04,
          //                     fontWeight: FontWeight.w500,
          //                   )),
          //             ),
          //             Icon(
          //               Icons.chevron_right,
          //               size: 20,
          //               color: Colors.grey[600],
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool status = await prefs.setString("token", '');
                if (status) {
                  Toast.show(
                    "Signout successfully",
                    context,
                    duration: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  );
                  screenPushRep(context, LoginScreen());
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: size.height * 0.015,
                    left: size.width * 0.05,
                    right: size.width * 0.09),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      moveToSavedProductsView();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout,
                            size:25, color: Colors.red),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text("Sign Out",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: size.width * 0.0425,
                              )),
                        ),
                        // Icon(
                        //   Icons.chevron_right,
                        //   size: 20,
                        //   color: Colors.grey[600],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.black),
              //       borderRadius: BorderRadius.circular(4)),
              //   margin: EdgeInsets.only(
              //       top: size.height * 0.05,
              //       left: size.width * 0.05,
              //       right: size.width * 0.05),
              //   child: Text(
              //     "Sign Out",
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: size.width * 0.04,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }

  setEmail(BuildContext context, var snapshot) {
    Provider.of<ProfileProvider>(context, listen: false)
        .emailSet(snapshot.data.data.email);
  }
}
