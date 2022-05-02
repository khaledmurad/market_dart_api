import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spree/Common/functions/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:spree/screens/Account/Components/update_personal_info.dart';

class AccountDetails extends StatefulWidget {
  final email;
  const AccountDetails({Key key, this.email}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  bool switchState;
  @override
  void initState() {
    super.initState();
    switchState = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ),



        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w900),
                ),
              )
          ),
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //           Icons.more_vert
          //       ),
          //     )
          // ),
        ],
        elevation: 0,
        title: Text(
          "Account Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.normal),
        ),

        //centerTitle: true,
      ),
      body: FutureBuilder(
        future: CallApi().getProfile(context: context),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "${snapshot.data.data.firstName} ${snapshot.data.data.lastName}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.06,
                            color: Color(0xff0059ff)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: size.width * 0.6,
                        child: Text(
                          "${(Provider.of<ProfileProvider>(context, listen: false).emailGet()) ?? widget.email}",
                          //   "${snapshot.data.data.email}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: size.width * 0.04,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),

                  /// Address
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  /// Apartment Address
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Apartment address",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  /// Zip code
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Zip code",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  /// City
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "City",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  /// Region
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Region",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  /// Country
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Country",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {
                      screenPush(context, UpdateInfo());
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: size.height * 0.003),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      height: size.height * 0.06,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Update information",
                        style: GoogleFonts.ubuntu(
                            color: Colors.black, fontSize: size.width * 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.06,
                            color: Color(0xff0059ff)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: size.width * 0.05),
                      ),
                      Text(
                        "Loading..",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.05,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}

// SizedBox(
// height: size.height * 0.08,
// ),
// Text(
// "Notifications",
// style: TextStyle(
// color: Colors.black,
// fontSize: size.width * 0.055,
// fontWeight: FontWeight.w600),
// ),
// SizedBox(
// height: size.height * 0.04,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "Enable Push Notifications",
// style: TextStyle(
// fontWeight: FontWeight.w800, fontSize: size.width * 0.04),
// ),
// Container(
// child: Switch(
// activeTrackColor: Color(0xff0059ff),
// inactiveTrackColor: Colors.grey,
// activeColor: Color(0xff0059ff)[800],
// value: switchState,
// onChanged: (value) {
// setState(() {
// switchState = value;
// });
// }),
// )
// ],
// ),

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text(
//       "Enable Push Notifications",
//       style: TextStyle(
//           fontWeight: FontWeight.w800, fontSize: size.width * 0.04),
//     ),
//     Container(
//       child: Switch(
//           activeTrackColor: Color(0xff0059ff),
//           inactiveTrackColor: Colors.grey,
//           activeColor: Color(0xff0059ff)[800],
//           value: switchState,
//           onChanged: (value) {
//             setState(() {
//               switchState = value;
//             });
//           }),
//     )
//   ],
// ),
