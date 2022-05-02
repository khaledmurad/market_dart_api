import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/Search/components/brandProducts.dart';

class Brand extends StatefulWidget {
  const Brand({Key key}) : super(key: key);

  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  List<String> brandImages = [
    "adwoa.png",
    "akila.png",
    "honey.png",
    "guava.png",
    "glasses.png",
    "amass.png",
    "adwoa.png",
    "akila.png",
    "honey.png",
    "guava.png",
    "glasses.png",
    "amass.png"
  ];

  List<String> brandTitle = [
    "Activist",
    "Adwoa",
    "Aesop",
    "Alo",
    "Akila",
    "Amass",
    "Activist",
    "Adwoa",
    "Aesop",
    "Alo",
    "Akila",
    "Amass"
  ];

  moveToBrandProductsView({
    Map data,
  }) {
    screenPush(
        context,
        BrandProducts(
         // data: data,
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Brands",
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.8,
                backgroundColor: Colors.white,
                fontSize: size.width * 0.06),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children:[
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
              itemCount: 12,
              itemBuilder: (_, index) {
                return Container(
                    height: size.height*0.23,
                    margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 5,right: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child:GestureDetector(
                      onTap: () {
                         moveToBrandProductsView();
                        // moveToBrandProductsView(data: snapshot.data["data"][index]);
                      },
                      child: Card(
                        elevation: 0,
                        color: Color(0xFFFAFAFA),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                  "images/${brandImages[index]}"),
                              width: size.width * 0.23,
                              height: size.height * 0.12,
                            ),
                            Text(brandTitle[index],
                              //"${snapshot.data["data"][index]["name"]}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.04),
                            ),
                          ],
                        ),
                      ),
                    ));
                //   Container(
                //   padding:
                //   EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //          // moveToBrandProductsView(data: snapshot.data["data"][index]);
                //         },
                //         child: Row(
                //           children: [
                //             Container(
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(50),
                //                   border: Border.all(
                //                       color: Colors.grey, width: 0.5)),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(50),
                //                 child: Image.asset(
                //                   'images/nike.png',
                //                   // 'images/${brandImages[index]}',
                //                   height: 40,
                //                   width: 40,
                //                   fit: BoxFit.fill,
                //                 ),
                //               ),
                //             ),
                //             SizedBox(
                //               width: 15,
                //             ),
                //             Expanded(
                //               child: Column(
                //                 crossAxisAlignment:
                //                 CrossAxisAlignment.start,
                //                 children: [
                //                   Text( "Name",
                //                    // "${snapshot.data["data"][index]["name"]}",
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black),
                //                   ),
                //                   // SizedBox(
                //                   //   height: 2.5,
                //                   // ),
                //                   // Text(
                //                   //   "${brandTitle[index]}",
                //                   //   style: TextStyle(
                //                   //       fontSize: 13, color: Colors.grey[700]),
                //                   // ),
                //                 ],
                //               ),
                //             ),
                //             // SizedBox(
                //             //   width: 15,
                //             // ),
                //             // Text(
                //             //   'View',
                //             //   style: TextStyle(color: Color(0xff0059ff)),
                //             // )
                //           ],
                //         ),
                //       ),
                //       // SizedBox(
                //       //   height: 10,
                //       // ),
                //       // Container(
                //       //   height: 130,
                //       //   child: ListView.builder(
                //       //     itemCount: 3,
                //       //     shrinkWrap: true,
                //       //     scrollDirection: Axis.horizontal,
                //       //     padding: EdgeInsets.zero,
                //       //     itemBuilder: (context, index) {
                //       //       return Container(
                //       //         margin: EdgeInsets.symmetric(horizontal: 5),
                //       //         child: Card(
                //       //           elevation: 0,
                //       //           shape: RoundedRectangleBorder(
                //       //               borderRadius: BorderRadius.circular(8)),
                //       //           child: Container(
                //       //             child: ClipRRect(
                //       //               borderRadius: BorderRadius.circular(8),
                //       //               child: Image.asset(
                //       //                 'images/${brandImages[index]}',
                //       //                 height: 130,
                //       //                 width: 90,
                //       //                 fit: BoxFit.fitWidth,
                //       //               ),
                //       //             ),
                //       //           ),
                //       //         ),
                //       //       );
                //       //     },
                //       //   ),
                //       // )
                //     ],
                //   ),
                // );
                // return Container(
                //   alignment: Alignment.center,
                //   width: size.width * 0.9,
                //   height: size.height * 0.24,
                //   margin: EdgeInsets.symmetric(
                //       horizontal: size.width * 0.03,
                //       vertical: size.height * 0.01),
                //   child: Text(
                //     "${brandTitle[index]}",
                //     style: GoogleFonts.cabin(
                //         color: Colors.white,
                //         fontWeight: FontWeight.w800,
                //         letterSpacing: 0.8,
                //         fontSize: size.width * 0.06),
                //   ),
                //   decoration: BoxDecoration(
                //       color: Color(0xffccccce),
                //       borderRadius: BorderRadius.circular(5),
                //       image: DecorationImage(
                //           image: AssetImage("images/${brandImages[index]}"),
                //           colorFilter: ColorFilter.srgbToLinearGamma())),
                // );
              }, ),
        ])
        // FutureBuilder(
        //     future: CallApi().getBrands(context: context),
        //     builder: (_, snapshot) {
        //       if (snapshot.hasData) {
        //         return
        //           ListView.builder(
        //             physics: NeverScrollableScrollPhysics(),
        //             shrinkWrap: true,
        //             padding: EdgeInsets.symmetric(vertical: 5),
        //             itemCount: snapshot.data["data"].length,
        //             itemBuilder: (_, index) {
        //               return Container(
        //                 padding:
        //                     EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //                 child: Column(
        //                   mainAxisSize: MainAxisSize.min,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     GestureDetector(
        //                       onTap: () {
        //                         moveToBrandProductsView(data: snapshot.data["data"][index]);
        //                       },
        //                       child: Row(
        //                         children: [
        //                           Container(
        //                             decoration: BoxDecoration(
        //                                 borderRadius: BorderRadius.circular(50),
        //                                 border: Border.all(
        //                                     color: Colors.grey, width: 0.5)),
        //                             child: ClipRRect(
        //                               borderRadius: BorderRadius.circular(50),
        //                               child: Image.asset(
        //                                 'images/nike.png',
        //                                 // 'images/${brandImages[index]}',
        //                                 height: 40,
        //                                 width: 40,
        //                                 fit: BoxFit.fill,
        //                               ),
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 15,
        //                           ),
        //                           Expanded(
        //                             child: Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: [
        //                                 Text(
        //                                   "${snapshot.data["data"][index]["name"]}",
        //                                   style: TextStyle(
        //                                       fontWeight: FontWeight.bold,
        //                                       color: Colors.black),
        //                                 ),
        //                                 // SizedBox(
        //                                 //   height: 2.5,
        //                                 // ),
        //                                 // Text(
        //                                 //   "${brandTitle[index]}",
        //                                 //   style: TextStyle(
        //                                 //       fontSize: 13, color: Colors.grey[700]),
        //                                 // ),
        //                               ],
        //                             ),
        //                           ),
        //                           // SizedBox(
        //                           //   width: 15,
        //                           // ),
        //                           // Text(
        //                           //   'View',
        //                           //   style: TextStyle(color: Color(0xff0059ff)),
        //                           // )
        //                         ],
        //                       ),
        //                     ),
        //                     // SizedBox(
        //                     //   height: 10,
        //                     // ),
        //                     // Container(
        //                     //   height: 130,
        //                     //   child: ListView.builder(
        //                     //     itemCount: 3,
        //                     //     shrinkWrap: true,
        //                     //     scrollDirection: Axis.horizontal,
        //                     //     padding: EdgeInsets.zero,
        //                     //     itemBuilder: (context, index) {
        //                     //       return Container(
        //                     //         margin: EdgeInsets.symmetric(horizontal: 5),
        //                     //         child: Card(
        //                     //           elevation: 0,
        //                     //           shape: RoundedRectangleBorder(
        //                     //               borderRadius: BorderRadius.circular(8)),
        //                     //           child: Container(
        //                     //             child: ClipRRect(
        //                     //               borderRadius: BorderRadius.circular(8),
        //                     //               child: Image.asset(
        //                     //                 'images/${brandImages[index]}',
        //                     //                 height: 130,
        //                     //                 width: 90,
        //                     //                 fit: BoxFit.fitWidth,
        //                     //               ),
        //                     //             ),
        //                     //           ),
        //                     //         ),
        //                     //       );
        //                     //     },
        //                     //   ),
        //                     // )
        //                   ],
        //                 ),
        //               );
        //               // return Container(
        //               //   alignment: Alignment.center,
        //               //   width: size.width * 0.9,
        //               //   height: size.height * 0.24,
        //               //   margin: EdgeInsets.symmetric(
        //               //       horizontal: size.width * 0.03,
        //               //       vertical: size.height * 0.01),
        //               //   child: Text(
        //               //     "${brandTitle[index]}",
        //               //     style: GoogleFonts.cabin(
        //               //         color: Colors.white,
        //               //         fontWeight: FontWeight.w800,
        //               //         letterSpacing: 0.8,
        //               //         fontSize: size.width * 0.06),
        //               //   ),
        //               //   decoration: BoxDecoration(
        //               //       color: Color(0xffccccce),
        //               //       borderRadius: BorderRadius.circular(5),
        //               //       image: DecorationImage(
        //               //           image: AssetImage("images/${brandImages[index]}"),
        //               //           colorFilter: ColorFilter.srgbToLinearGamma())),
        //               // );
        //             });
        //       } else {
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //     },
        //   ),

      ),
    );
  }
}
