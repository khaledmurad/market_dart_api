import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/Search/components/brandProducts.dart';
import 'package:spree/screens/Search/components/subcategory.dart';

import 'components/brand.dart';
import 'components/category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> title = [
    "LA Essentials",
    "Health & wellness",
    "Pentry",
    "Beverage",
    "Personal care",
  ];

  List<String> images = [
    "glasses.png",
    "care.png",
    "honey.png",
    "pentry.png",
    "beverage.png",
    "adwoa.png",
    "akila.png",
    "honey.png",
    "guava.png"
  ];

  List<String> brandImages = [
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
    "Amass"
  ];
  List<String> colors = ["a8c7e9", "8590dd", "d8a55a", "c35855", "657dd7"];

  moveToSubCategoryView({
    Map data,
  }) {
    screenPush(
        context,
        Subcategory(
          data: data,
        ));
  }

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Text("Search",style: TextStyle(fontSize :  size.width * 0.06
                    ,fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.015,
                    bottom: size.width * 0.03),
                height: 60,
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: GoogleFonts.cabin(color: Colors.black),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Hero(
                          tag: Icons.search,
                          child: Text(
                              String.fromCharCode(Icons.search.codePoint),
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: Icons.search.fontFamily,
                                  package: Icons.search.fontPackage)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Browse by Category
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.04,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse Categories",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w900),
                    ),
                    GestureDetector(
                      onTap: () {
                        screenPush(context, Category());
                      },
                      child: Row(
                        children: [
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          // Icon(
                          //   Icons.arrow_forward_ios,
                          //   size: size.width * 0.03,
                          //   color: Color(0xff0059ff),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /// Slide
              ///
              Container(
                height: size.height*0.23,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    //snapshot.data["categories"]["data"].length,
                    itemBuilder: (_, index) {
                      return Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10, left: 5,right: 5),
                          width: size.width * .4,
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
                          child: GestureDetector(
                            onTap: () {
                             // moveToSubCategoryView(data: snapshot.data["categories"]["data"][index]);
                            },
                            child: Card(
                              elevation: 0,
                              color: Color(0xFFFAFAFA),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image.asset(
                                        "images/${images[index]}"),
                                    width: size.width * 0.27,
                                    height: size.height * 0.14,
                                  ),
                                  SizedBox(height: size.height*0.01,),
                                  Text( title[index],
                                    //"${snapshot.data["categories"]["data"][index]["name"]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.04),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }),
              ),

              // Container(
              //   margin: EdgeInsets.only(top: size.height * 0.01),
              //   width: size.width,
              //   height: size.height * 0.2,
              //   child: FutureBuilder(
              //     future: CallApi().getCategories(context: context),
              //     builder: (_, snapshot) {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             itemCount: 5,
              //             //snapshot.data["categories"]["data"].length,
              //             itemBuilder: (_, index) {
              //               return Container(
              //                   alignment: Alignment.topCenter,
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: size.width * 0.015),
              //                   margin: EdgeInsets.symmetric(
              //                       horizontal: size.width * 0.01),
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(5)),
              //                   height: size.height * 0.17,
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       moveToSubCategoryView(data: snapshot.data["categories"]["data"][index]);
              //                     },
              //                     child: Card(
              //                       elevation: 0,
              //                       child: Column(
              //                         mainAxisAlignment: MainAxisAlignment.start,
              //                         children: [
              //                           Container(
              //                             child: Image.asset(
              //                                 "images/${images[index]}"),
              //                             width: size.width * 0.27,
              //                             height: size.height * 0.14,
              //                           ),
              //                           Text(
              //                             "${snapshot.data["categories"]["data"][index]["name"]}",
              //                             style: TextStyle(
              //                                 color: Colors.black,
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: size.width * 0.04),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ));
              //             });
              //       } else {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //     },
              //   ),
              // ),

              /// Browse Brand
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.07,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse Brands",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w900),
                    ),
                    GestureDetector(
                      onTap: () {
                        screenPush(context, Brand());
                      },
                      child: Row(
                        children: [
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          // Icon(
                          //   Icons.arrow_forward_ios,
                          //   size: size.width * 0.03,
                          //   color: Color(0xff0059ff),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /// Slide
              ///
              Container(
                height: size.height*0.23,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    //snapshot.data["categories"]["data"].length,
                    itemBuilder: (_, index) {
                      return Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10, left: 5,right: 5),
                          width: size.width * .4,
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
                          child:GestureDetector(
                            onTap: () {
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
                                    width: size.width * 0.27,
                                    height: size.height * 0.14,
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
                    }),
              ),

              // Container(
              //   margin: EdgeInsets.only(top: size.height * 0.01),
              //   width: size.width,
              //   height: size.height * 0.2,
              //   child: FutureBuilder(
              //     future: CallApi().getBrands(context: context),
              //     builder: (_, snapshot) {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             itemCount: snapshot.data["data"].length,
              //             itemBuilder: (_, index) {
              //               return Container(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: size.width * 0.015),
              //                   margin: EdgeInsets.symmetric(
              //                       horizontal: size.width * 0.01),
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(5)),
              //                   alignment: Alignment.topCenter,
              //                   height: size.height * 0.17,
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       moveToBrandProductsView(data: snapshot.data["data"][index]);
              //                     },
              //                     child: Card(
              //                       elevation: 0,
              //                       child: Column(
              //                         mainAxisAlignment: MainAxisAlignment.start,
              //                         children: [
              //                           Container(
              //                             child: Image.asset(
              //                                 "images/${brandImages[index]}"),
              //                             width: size.width * 0.27,
              //                             height: size.height * 0.14,
              //                           ),
              //                           Text(
              //                             "${snapshot.data["data"][index]["name"]}",
              //                             style: TextStyle(
              //                                 color: Colors.black,
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: size.width * 0.04),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ));
              //             });
              //       } else {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //     },
              //   ),
              // ),

              // Container(
              //   margin: EdgeInsets.only(
              //       left: size.width * 0.04,
              //       right: size.width * 0.04,
              //       top: size.height * 0.07,
              //       bottom: size.height * 0.02),
              //   width: size.width,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Top Searches",
              //         style: TextStyle(
              //             fontSize: size.width * 0.04,
              //             fontWeight: FontWeight.w900),
              //       ),
              //     ],
              //   ),
              // ),

              // Container(
              //   width: size.width,
              //   height: size.height * 0.8,
              //   child: ListView.builder(
              //       itemCount: title.length,
              //       itemBuilder: (_, index) {
              //         return Container(
              //           alignment: Alignment.centerLeft,
              //           width: size.width,
              //           height: size.height * 0.13,
              //           margin: EdgeInsets.only(
              //             right:  size.width * 0.04,
              //               top: size.width * 0.01,
              //             bottom:  size.width * 0.01,
              //             left: size.width*0.031
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Container(
              //                 padding: EdgeInsets.all(size.width*0.02),
              //                 width: size.width * 0.2,
              //                 height: size.width * 0.22,
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey[300]
              //                 ),
              //                 margin: EdgeInsets.all( size.width*0.015),
              //                 child:
              //                     Image.asset("images/${brandImages[index]}"),
              //               ),
              //               SizedBox(
              //                 width: size.width*0.02,
              //               ),
              //               Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   SizedBox(
              //                     height: size.height * 0.02,
              //                   ),
              //                   Text(
              //                     " BALA",
              //                     style: TextStyle(
              //                         color: Colors.grey[600],
              //                       fontSize: size.width*0.025,
              //                       letterSpacing: 0.8
              //                     ),
              //                   ),
              //                   Text(
              //                     " ${title[index]}",
              //                     style: GoogleFonts.cabin(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: size.width * 0.035),
              //                   ),
              //                   SizedBox(
              //                     height: size.height*0.005,
              //                   ),
              //                   Text(
              //                     " \$29.05",
              //                     style: GoogleFonts.cabin(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: size.width * 0.035),
              //                   ),
              //                   SizedBox(
              //                     height: size.height * 0.02,
              //                   ),
              //                 ],
              //               )
              //             ],
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
