import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/ProductView/product_view.dart';

class BrandProducts extends StatefulWidget {
  final data;

  const BrandProducts({
    Key key,
    this.data,
  }) : super(key: key);
  @override
  _BrandProductsState createState() => _BrandProductsState();
}

class _BrandProductsState extends State<BrandProducts> {

  moveToProductView(
      {String price,
        String title,
        String brand,
        String image,
        String desc,
        var id}) {
    screenPush(
        context,
        ProductView(
          id: id,
          desc: desc,
          title: title,
          image: image,
          brand: brand,
          price: price,
        ));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Adwoa Brand",
              //"${widget.data["name"]}",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.05),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              buildWidget(size: size, context: context)
            ],
          ),





        ));
  }

  Widget buildWidget({BuildContext context, Size size}) {
    return SliverList(

        delegate: SliverChildListDelegate(
              [
                Container(
                  width: size.width,
                  child:
                  // ListView.builder(
                  //     itemCount: widget.data["child"]["data"].length,
                  //     itemBuilder: (_, index) {
                  //       return
                  Column(children: [

                    /// New Arrivals
                    // Container(
                    //   margin: EdgeInsets.only(
                    //       left: size.width * 0.04,
                    //       top: size.height * 0.05,
                    //       right: size.width * 0.04),
                    //   alignment: Alignment.centerLeft,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "${widget.data["child"]["data"][index]["name"]}",
                    //         style: GoogleFonts.roboto(
                    //             fontSize: size.width * 0.04,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //       Text(
                    //         "Shop All",
                    //         style: GoogleFonts.roboto(
                    //             color: Color(0xff0059ff),
                    //             fontSize: size.width * 0.036,
                    //             fontWeight: FontWeight.w700),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    /// slider
                    Container(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                      width: size.width,
                      height: size.height *.925,
                      color: Colors.white,
                      child:ListView(
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
                                      GestureDetector(
                                        onTap:(){
                                // moveToProductView(
                                //     id: snapshot.data["data"][index]["id"],
                                //     image:
                                //     "${snapshot.data["data"][index]["thumbnail"]}",
                                //     title:
                                //     "${snapshot.data["data"][index]["name"]}",
                                //     brand:
                                //     "${snapshot.data["data"][index]["status"]}",
                                //     price: snapshot.data["data"][index]
                                //     ["price"],
                                //     desc:
                                //     "${snapshot.data["data"][index]["description"]}");
                                },
                                        child: Container(
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
                                                      child: Image.asset("images/akila.png")
                                                    // CachedNetworkImage(
                                                    //   imageUrl: snapshot.data["data"][index]
                                                    //   ["thumbnail"],
                                                    //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                    //   errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                                                    // ),

                                                    //   Image.network(
                                                    //       snapshot.data["data"][index]
                                                    //       ["thumbnail"]),
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
                                                        Text("Adwoa",
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
                      //   future: CallApi().getBrandProducts(name: "${widget.data["name"]}", context: context),
                      //   builder: (_, snapshot) {
                      //     //print(snapshot.data);
                      //     if (snapshot.hasData) {
                      //       //return Container();
                      //       return ListView.builder(
                      //         itemCount: snapshot.data["data"].length,
                      //         scrollDirection: Axis.horizontal,
                      //         itemBuilder: (_, index) {
                      //           return InkWell(
                      //             onTap: () {
                      //               moveToProductView(
                      //                   id: snapshot.data["data"][index]["id"],
                      //                   image:
                      //                   "${snapshot.data["data"][index]["thumbnail"]}",
                      //                   title:
                      //                   "${snapshot.data["data"][index]["name"]}",
                      //                   brand:
                      //                   "${snapshot.data["data"][index]["status"]}",
                      //                   price: snapshot.data["data"][index]
                      //                   ["price"],
                      //                   desc:
                      //                   "${snapshot.data["data"][index]["description"]}");
                      //             },
                      //             child: Container(
                      //               //margin: EdgeInsets.all(size.width * 0.01),
                      //               height: size.height * 0.3,
                      //               width: size.width * 0.3,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //               child: Column(
                      //                 children: [
                      //                   Container(
                      //                     height: size.height * 0.2,
                      //                     width: size.width * 0.4,
                      //                     child: CachedNetworkImage(
                      //                       imageUrl: snapshot.data["data"][index]
                      //                       ["thumbnail"],
                      //                       placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      //                       errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                      //                     ),
                      //
                      //                   //   Image.network(
                      //                   //       snapshot.data["data"][index]
                      //                   //       ["thumbnail"]),
                      //                   ),
                      //                   Container(
                      //                     margin: EdgeInsets.only(
                      //                         left: size.width * 0.03,
                      //                         top: size.height * 0.02),
                      //                     alignment: Alignment.centerLeft,
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           "${snapshot.data["data"][index]["status"]}",
                      //                           style: GoogleFonts.roboto(
                      //                               color: Colors.black,
                      //                               fontWeight: FontWeight.bold,
                      //                               fontSize:
                      //                               size.width * 0.033,
                      //                               letterSpacing: 0.6),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 2.5,
                      //                         ),
                      //                         Text(
                      //                           "${snapshot.data["data"][index]["name"]}",
                      //                           style: GoogleFonts.roboto(
                      //                               color: Colors.black,
                      //                               fontSize:
                      //                               size.width * 0.032),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 2.5,
                      //                         ),
                      //                         Text(
                      //                           "\$${snapshot.data["data"][index]["price"]}",
                      //                           style: GoogleFonts.meeraInimai(
                      //                               color: Colors.black,
                      //                               fontSize:
                      //                               size.width * 0.032),
                      //                         )
                      //                       ],
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //       );
                      //     } else {
                      //       return Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }
                      //   },
                      // ),
                    ),
                  ]
                    // );
                    //             }
                  ))
          ]
        ));

  }
}
