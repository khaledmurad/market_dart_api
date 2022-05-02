import 'package:flutter/material.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';

class AllOrders extends StatefulWidget {
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
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
                "All Orders",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.normal),
              ),

              centerTitle: true,
            ),
            body: FutureBuilder(
                future: CallApi().getAllOder(context: context),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return Container(color: Colors.black,);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
