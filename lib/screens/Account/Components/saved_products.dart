import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/ProductView/product_view.dart';

class SavedProducts extends StatefulWidget {
  @override
  _SavedProductsState createState() => _SavedProductsState();
}

class _SavedProductsState extends State<SavedProducts> {

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
                "Saved Products",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.normal),
              ),

              centerTitle: true,
            ),
            body: CustomScrollView(
              slivers: [

                buildWidget(size: size, context: context)
              ],
            ),

            // FutureBuilder(
            //     future: CallApi().getAllOder(context: context),
            //     builder: (_, snapshot) {
            //       if (snapshot.hasData) {
            //         print(snapshot.data);
            //         return Container(color: Colors.black,);
            //       } else {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     })


        ));
  }

  Widget buildWidget({BuildContext context, Size size}) {
    return SliverList(

        delegate: SliverChildListDelegate(


            [


              Container(
                  width: size.width,
                  //height: size.height,
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
                      margin: EdgeInsets.only(top: size.height * 0.0),
                      width: size.width,
                      height: size.height,
                      color: Colors.white,
                      child: FutureBuilder(
                        future: CallApi().getLatestInFashion(context: context),
                        builder: (_, snapshot) {
                          //print(snapshot.data);
                          if (snapshot.hasData) {
                            //return Container();
                            return ListView.builder(
                              itemCount: snapshot.data["data"].length,
                              //scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    moveToProductView(
                                        id: snapshot.data["data"][index]["id"],
                                        image:
                                        "${snapshot.data["data"][index]["thumbnail"]}",
                                        title:
                                        "${snapshot.data["data"][index]["name"]}",
                                        brand:
                                        "${snapshot.data["data"][index]["status"]}",
                                        price: snapshot.data["data"][index]
                                        ["price"],
                                        desc:
                                        "${snapshot.data["data"][index]["description"]}");
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.all(size.width * 0.01),
                                    height: size.height * 0.25,
                                    width: size.width * 0.1,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            //color: Colors.blue,
                                            height: size.height * 0.2,
                                            width: size.width * 0.3,
                                            //alignment: Alignment.topLeft,
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot.data["data"][index]
                                              ["thumbnail"],
                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                                            ),

                                            //   Image.network(
                                            //       snapshot.data["data"][index]
                                            //       ["thumbnail"]),
                                          ),
                                        ),
                                        //SizedBox(width: 200,),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.03,
                                              top: size.height * 0.02),
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 24,
                                              ),
                                              Text(
                                                "${snapshot.data["data"][index]["status"]}",
                                                style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                    size.width * 0.033,
                                                    letterSpacing: 0.6),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "${snapshot.data["data"][index]["name"]}",
                                                style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize:
                                                    size.width * 0.032),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "\$${snapshot.data["data"][index]["price"]}",
                                                style: GoogleFonts.meeraInimai(
                                                    color: Colors.black,
                                                    fontSize:
                                                    size.width * 0.032),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Text("ADD TO CART ", style: TextStyle(color: Colors.black),),
                                                Icon(Icons.arrow_forward_ios_rounded)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ]
                    // );
                    //             }
                  ))
            ]
        ));

  }
}
