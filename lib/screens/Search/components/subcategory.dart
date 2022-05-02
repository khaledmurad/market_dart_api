import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/ProductView/product_view.dart';

class Subcategory extends StatefulWidget {
  final data;

  const Subcategory({
    Key key,
    this.data,
  }) : super(key: key);
  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
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
        title: Text(
          "${widget.data["name"]}",
          style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.8,
              fontSize: size.width * 0.06),
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
        slivers: [buildWidget(size: size, context: context)],
      ),
    ));
  }

  Widget buildWidget({BuildContext context, Size size}) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
            width: size.width,
            child:
                // ListView.builder(
                //     itemCount: widget.data["child"]["data"].length,
                //     itemBuilder: (_, index) {
                //       return
                Column(children: [
              /// New Arrivals
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    top: size.height * 0.05,
                    right: size.width * 0.04),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.data["child"]["data"][index]["name"]}",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Shop All",
                      style: GoogleFonts.roboto(
                          color: Color(0xff0059ff),
                          fontSize: size.width * 0.036,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              /// slider
              Container(
                margin: EdgeInsets.only(top: size.height * 0.04),
                width: size.width,
                height: size.height * 0.4,
                color: Colors.white,
                child: FutureBuilder(
                  future: CallApi().getSubCategories(
                      pName: "${widget.data["name"]}",
                      name: "${widget.data["child"]["data"][index]["name"]}",
                      context: context),
                  builder: (_, snapshot) {
                    //print(snapshot.data);
                    if (snapshot.hasData) {
                      //return Container();
                      return ListView.builder(
                        itemCount: snapshot.data["products"]["data"].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              moveToProductView(
                                  id: snapshot.data["products"]["data"][index]
                                      ["id"],
                                  image:
                                      "${snapshot.data["products"]["data"][index]["thumbnail"]}",
                                  title:
                                      "${snapshot.data["products"]["data"][index]["name"]}",
                                  brand:
                                      "${snapshot.data["products"]["data"][index]["status"]}",
                                  price: snapshot.data["products"]["data"]
                                      [index]["price"],
                                  desc:
                                      "${snapshot.data["products"]["data"][index]["description"]}");
                            },
                            child: Container(
                              //margin: EdgeInsets.all(size.width * 0.01),
                              height: size.height * 0.3,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: size.height * 0.2,
                                    width: size.width * 0.4,
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data["products"]
                                          ["data"][index]["thumbnail"],
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),

                                    // Image.network(
                                    //     snapshot.data["products"]["data"][index]
                                    //         ["thumbnail"]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.03,
                                        top: size.height * 0.02),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.data["products"]["data"][index]["status"]}",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.033,
                                              letterSpacing: 0.6),
                                        ),
                                        SizedBox(
                                          height: 2.5,
                                        ),
                                        Text(
                                          "${snapshot.data["products"]["data"][index]["name"]}",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: size.width * 0.032),
                                        ),
                                        SizedBox(
                                          height: 2.5,
                                        ),
                                        Text(
                                          "\$${snapshot.data["products"]["data"][index]["price"]}",
                                          style: GoogleFonts.meeraInimai(
                                              color: Colors.black,
                                              fontSize: size.width * 0.032),
                                        )
                                      ],
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
                    ));
      },
      childCount: widget.data["child"]["data"].length,
    ));
  }
}
