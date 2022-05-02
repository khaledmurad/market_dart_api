import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/Search/components/brandProducts.dart';

class ProductShopAll extends StatefulWidget {
  final title;
  const ProductShopAll({Key key,@required this.title}) : super(key: key);

  @override
  _ProductShopAllState createState() => _ProductShopAllState();
}

class _ProductShopAllState extends State<ProductShopAll> {
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
          data: data,
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
              widget.title,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: (size.width * .4/size.height * 4)),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
                  itemCount: 12,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5, left: 5,right: 5),
                      width: size.width * .4,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        height: size.height * 0.15,
                                        width: size.width * 0.30,
                                        child: Image.asset("images/${brandImages[index]}")
                                      // CachedNetworkImage(
                                      //   imageUrl: snapshot.data["data"]
                                      //   [index]["thumbnail"],
                                      //   placeholder: (context, url) => Center(
                                      //       child: CircularProgressIndicator()),
                                      //   errorWidget: (context, url, error) =>
                                      //       Center(child: Icon(Icons.error)),
                                      // ),


                                      // Image.network(snapshot.data["data"]
                                      //     [index]["thumbnail"]),
                                    ),
                                    // SizedBox(height: size.height*0.005,),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: size.width * 0.03,
                                        right: size.width * 0.03,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(brandTitle[index],
                                            //"${snapshot.data["data"][index]["status"]}",
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.033,
                                                letterSpacing: 0.6),
                                          ),
                                          SizedBox(
                                            height: 2.5,
                                          ),
                                          Text("simply dummy text of the printing and typesetting industry",
                                            //"${snapshot.data["data"][index]["name"]}",
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: size.width * 0.030),
                                          ),
                                          SizedBox(
                                            height: 2.5,
                                          ),
                                          Text("\$50 ",
                                            // "\$${snapshot.data["data"][index]["price"]}",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue,
                                                fontSize: size.width * 0.05),
                                          ),
                                          SizedBox(
                                            height: size.height * .025,
                                          ),
                                          Container(
                                            height: size.height * .04,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: Colors.blue,width: 1)
                                            ),
                                            child:Center(
                                              child: Text("Add to cart",
                                                //"${snapshot.data["data"][index]["name"]}",
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontSize: size.width * 0.030),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   width: size.width*0.16,
                                //   height: size.height*0.0325,
                                //   decoration: BoxDecoration(
                                //       color: Colors.blue,
                                //       borderRadius: BorderRadius.only(
                                //         topRight: Radius.circular(20),
                                //         bottomLeft:Radius.circular(15),
                                //       )
                                //   ),
                                //   child: Center(
                                //       child:Text("50 \$",
                                //         // "\$${snapshot.data["data"][index]["price"]}",
                                //         style: GoogleFonts.meeraInimai(
                                //             color: Colors.white,
                                //             fontSize: size.width * 0.037),
                                //       )
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                    // Container(
                    //   padding:
                    //   EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           // moveToBrandProductsView(data: snapshot.data["data"][index]);
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
                    //                     // "${snapshot.data["data"][index]["name"]}",
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
