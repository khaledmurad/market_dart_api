import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
              ),

              // actions: <Widget>[
              //   Padding(
              //       padding: EdgeInsets.all(20.0),
              //       child: GestureDetector(
              //         onTap: () {},
              //         child: Text(
              //           "Save",
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontSize: size.width * 0.04,
              //               fontWeight: FontWeight.w900),
              //         ),
              //       )),
              //
              // ],
              elevation: 0,
              title: Text(
                "Notifications",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.normal),
              ),

              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Order Placed",
                      style: TextStyle(

                          color: Colors.black,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),

                  // SizedBox(height: 10,),
                  Text("  |"),
                  Text("  |"),
                  Text("  |"),
                  Text(
                      "Order Confirmed",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  // SizedBox(height: 10,),
                  Text("  |"),
                  Text("  |"),
                  Text("  |"),
                  Text(
                    "Order Shipped",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 10,),
                  Text("  |"),
                  Text("  |"),
                  Text("  |"),
                  Text(
                    "Order Out for Delivery",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 10,),
                  Text("  |"),
                  Text("  |"),
                  Text("  |"),
                  Text(
                    "Order Delivered",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            )
        ));
  }
}
