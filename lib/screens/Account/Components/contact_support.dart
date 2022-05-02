import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupport extends StatefulWidget {
  @override
  _ContactSupportState createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {

  final Uri params = Uri(
    scheme: 'mailto',
    path: 'support@spreere.com',
    query: 'subject=Contacting Spree&body=Write your query here...', //add subject and body here
  );

  final Uri params1 = Uri(
    scheme: 'mailto',
    path: 'press@spreere.com',
    query: 'subject=Contacting Spree&body=Write your query here...', //add subject and body here
  );

  _sendingMails() async {

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _sendingMails1() async {

    var url = params1.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
                "Contact Us",
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
                  GestureDetector(
                    onTap: () {
                      _sendingMails();
                    },
                    child: Text(
                      "support@spreere.com",
                      style: TextStyle(

                          color: Colors.black,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      _sendingMails1();
                    },
                    child: Text(
                      "press@spreere.com",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}
