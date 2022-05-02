import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/order_provider.dart';
import 'package:spree/Common/functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  final image;
  final price;
  final title;
  final brand;
  final desc;
  final id;
  const ProductView(
      {Key key,
      this.image,
      this.price,
      this.title,
      this.brand,
      this.desc,
      this.id})
      : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int _pictureIndex = 0;
  String selectedColor;

  bool colorIsVisible;
  int quantity = 1;
  List carouselList;

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
  void initState() {
    super.initState();
    colorIsVisible = false;
    carouselList = [
      CachedNetworkImage(
        imageUrl: widget.image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              scale: 5,
            ),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(
          "${widget.image}",
          fit: BoxFit.cover,
          scale: 5,
        ),
      ),
      CachedNetworkImage(
        imageUrl: widget.image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              scale: 5,
            ),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(
          "images/${widget.image}",
          fit: BoxFit.cover,
          scale: 5,
        ),
      ),
      CachedNetworkImage(
        imageUrl: widget.image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              scale: 5,
            ),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(
          "images/${widget.image}",
          fit: BoxFit.cover,
          scale: 5,
        ),
      ),
      CachedNetworkImage(
        imageUrl: widget.image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              scale: 5,
            ),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(
          "images/${widget.image}",
          fit: BoxFit.cover,
          scale: 5,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     "${widget.title}",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w500,
      //       fontSize: size.width * 0.08,
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.45,
                        child: Carousel(
                          autoplay: false,
                          boxFit: BoxFit.cover,
                          images: carouselList,

                          // [
                          //   Image.asset(
                          //     "images/${widget.image}",
                          //     fit: BoxFit.scaleDown,
                          //     scale: 5,
                          //   ),
                          //   Image.asset(
                          //     "images/${widget.image}",
                          //     scale: 5,
                          //   ),
                          //   Image.asset(
                          //     "images/${widget.image}",
                          //     scale: 5,
                          //   ),
                          //   Image.asset(
                          //     "images/${widget.image}",
                          //     scale: 5,
                          //   )
                          // ],
                          dotColor: Colors.white,
                          dotBgColor: Colors.white,
                          autoplayDuration: Duration(seconds: 10),
                          onImageChange: (pre, curr) {
                            _pictureIndex = curr;
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.03),
                        height: 4,
                        width: size.width * 0.6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return Container(
                              width: size.width * 0.07,
                              height: 2,
                              color: _pictureIndex == index
                                  ? Colors.black
                                  : Colors.grey[400],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      left: size.width*0.02,
                      top: size.height*0.01,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: size.height*0.05,width: size.width*0.1,
                          decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Icon(Icons.chevron_left,size: size.width*0.1,),),
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                alignment: Alignment.topLeft,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * 0.075,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                          height: size.height * 0.04,
                          width: size.width * 0.32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity = quantity - 1;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.08,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCFD8DC),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                      child: Icon(Icons.remove)
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal:size.width * 0.005 ),
                                  height: size.height * 0.04,
                                  width: size.width * 0.08,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE1F5FE),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:Center(
                                    child: Text(
                                      "$quantity",
                                      style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = quantity + 1;
                                    });
                                  },
                                  child: Container(
                                      height: size.height * 0.04,
                                      width: size.width * 0.08,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFCFD8DC),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Icon(Icons.add)
                                  )),
                            ],
                          ),
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "${widget.title}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.06,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      "${widget.brand}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.04,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    /// Colors
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.only(top: size.height * 0.016),
                                  child: Text(
                                    "Color option",
                                    style: TextStyle(
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: size.height * 0.024,
                                      bottom: size.height * 0.02),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor = "0xFFdbe1e4";
                                          });
                                        },
                                        child: Container(
                                          width: size.width * 0.08,
                                          height: size.width * 0.08,
                                          margin: EdgeInsets.only(
                                              right: size.height * 0.005,
                                              left: size.width * 0.005),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFdbe1e4),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border:
                                              selectedColor == "0xFFdbe1e4"
                                                  ? Border.all(color: Colors.white,width: 1.25)
                                                  : Border(),
                                            boxShadow: [
                                              selectedColor == "0xFFdbe1e4"
                                              ? BoxShadow(
                                              color: Colors.grey,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 2)
                                               ): BoxShadow(
                                                  offset: Offset(0,0),
                                                color: Colors.transparent,
                                                blurRadius: 0.0
                                              )
                                            ]
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor = "0xFF929aa6";
                                          });
                                        },
                                        child: Container(
                                          width: size.width * 0.08,
                                          height: size.width * 0.08,
                                          margin: EdgeInsets.only(
                                              right: size.height * 0.005,
                                              left: size.width * 0.005),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF929aa6),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border:
                                              selectedColor == "0xFF929aa6"
                                                  ? Border.all(color: Colors.white,width: 1.25)
                                                  : Border(),
                                              boxShadow: [
                                          selectedColor == "0xFF929aa6"
                                          ? BoxShadow(
                                          color: Colors.grey,
                                              blurRadius: 3,
                                              offset: Offset(0, 2)
                                          ): BoxShadow(
                                            offset: Offset(0,0),
                                          color: Colors.transparent,
                                          blurRadius: 0.0
                                      )]),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor = "0xfff5ebdf";
                                          });
                                        },
                                        child: Container(
                                          width: size.width * 0.08,
                                          height: size.width * 0.08,
                                          margin: EdgeInsets.only(
                                              right: size.height * 0.005,
                                              left: size.width * 0.005),
                                          decoration: BoxDecoration(
                                              color: Color(0xfff5ebdf),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border:
                                              selectedColor == "0xfff5ebdf"
                                                  ? Border.all(color: Colors.white,width: 1.25)
                                                  : Border(),
                                              boxShadow: [
                                                selectedColor == "0xfff5ebdf"
                                                    ? BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 2)
                                                ): BoxShadow(
                                                    offset: Offset(0,0),
                                                    color: Colors.transparent,
                                                    blurRadius: 0.0
                                                )]),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor = "0xff474547";
                                          });
                                        },
                                        child: Container(
                                          width: size.width * 0.08,
                                          height: size.width * 0.08,
                                          margin: EdgeInsets.only(
                                              right: size.height * 0.005,
                                              left: size.width * 0.005),
                                          decoration: BoxDecoration(
                                              color: Color(0xff474547),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border:
                                              selectedColor == "0xff474547"
                                                  ? Border.all(color: Colors.white,width: 1.25)
                                                  : Border(),
                                              boxShadow: [
                                                selectedColor == "0xff474547"
                                                    ? BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 2)
                                                ): BoxShadow(
                                                    offset: Offset(0,0),
                                                    color: Colors.transparent,
                                                    blurRadius: 0.0
                                                )]),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor = "0xFFf7d1c5";
                                          });
                                        },
                                        child: Container(
                                          width: size.width * 0.08,
                                          height: size.width * 0.08,
                                          margin: EdgeInsets.only(
                                              right: size.height * 0.005,
                                              left: size.width * 0.005),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFf7d1c5),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border:
                                              selectedColor == "0xFFf7d1c5"
                                                  ? Border.all(color: Colors.white,width: 1.25)
                                                  : Border(),
                                              boxShadow: [
                                                selectedColor == "0xFFf7d1c5"
                                                    ? BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3,
                                                    offset: Offset(0, 2)
                                                ): BoxShadow(
                                                    offset: Offset(0,0),
                                                    color: Colors.transparent,
                                                    blurRadius: 0.0
                                                )]),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [
                                //
                                //     Container(
                                //       padding: EdgeInsets.only(
                                //           top: size.height * 0.016),
                                //       child: Text(
                                //         "Blush",
                                //         style: TextStyle(
                                //             fontSize: size.width * 0.04,
                                //             fontWeight: FontWeight.w400,
                                //             color: Colors.black),
                                //       ),
                                //       height: size.height * 0.04,
                                //     ),
                                //     Container(
                                //       margin: EdgeInsets.only(
                                //           top: size.height * 0.02,
                                //           left: size.width * 0.01),
                                //       width: size.width * 0.04,
                                //       height: size.width * 0.04,
                                //       decoration: BoxDecoration(
                                //           color: selectedColor == null
                                //               ? Colors.grey
                                //               : Color(int.parse(selectedColor)),
                                //           shape: BoxShape.circle),
                                //     ),
                                //     GestureDetector(
                                //       onTap: () {
                                //         setState(() {
                                //           colorIsVisible = !colorIsVisible;
                                //         });
                                //       },
                                //       child: Container(
                                //         margin: EdgeInsets.only(
                                //             top: size.height * 0.02),
                                //         child: Icon(
                                //           colorIsVisible
                                //               ? Icons.keyboard_arrow_up
                                //               : Icons.keyboard_arrow_down_sharp,
                                //           color: Colors.black,
                                //           size: size.width * 0.06,
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // )
                              ],
                            ),
                            // Visibility(
                            //   visible: colorIsVisible,
                            //   child: Container(
                            //     margin: EdgeInsets.only(
                            //         top: size.height * 0.024,
                            //         left: size.width * 0.02,
                            //         bottom: size.height * 0.02),
                            //     child: Row(
                            //       children: [
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectedColor = "0xFFdbe1e4";
                            //             });
                            //           },
                            //           child: Container(
                            //             width: size.width * 0.1,
                            //             height: size.width * 0.1,
                            //             margin: EdgeInsets.only(
                            //                 right: size.height * 0.02,
                            //                 left: size.width * 0.02),
                            //             decoration: BoxDecoration(
                            //                 color: Color(0xFFdbe1e4),
                            //                 shape: BoxShape.circle,
                            //                 border:
                            //                 selectedColor == "0xFFdbe1e4"
                            //                     ? Border(
                            //                   bottom: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   left: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   top: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   right: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                 )
                            //                     : Border()),
                            //           ),
                            //         ),
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectedColor = "0xFF929aa6";
                            //             });
                            //           },
                            //           child: Container(
                            //             width: size.width * 0.1,
                            //             height: size.width * 0.1,
                            //             margin: EdgeInsets.only(
                            //                 right: size.height * 0.02,
                            //                 left: size.width * 0.02),
                            //             decoration: BoxDecoration(
                            //                 color: Color(0xFF929aa6),
                            //                 shape: BoxShape.circle,
                            //                 border:
                            //                 selectedColor == "0xFF929aa6"
                            //                     ? Border(
                            //                   bottom: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   left: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   top: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   right: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                 )
                            //                     : Border()),
                            //           ),
                            //         ),
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectedColor = "0xfff5ebdf";
                            //             });
                            //           },
                            //           child: Container(
                            //             width: size.width * 0.1,
                            //             height: size.width * 0.1,
                            //             margin: EdgeInsets.only(
                            //                 right: size.height * 0.02,
                            //                 left: size.width * 0.02),
                            //             decoration: BoxDecoration(
                            //                 color: Color(0xfff5ebdf),
                            //                 shape: BoxShape.circle,
                            //                 border:
                            //                 selectedColor == "0xfff5ebdf"
                            //                     ? Border(
                            //                   bottom: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   left: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   top: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   right: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                 )
                            //                     : Border()),
                            //           ),
                            //         ),
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectedColor = "0xff474547";
                            //             });
                            //           },
                            //           child: Container(
                            //             width: size.width * 0.1,
                            //             height: size.width * 0.1,
                            //             margin: EdgeInsets.only(
                            //                 right: size.height * 0.02,
                            //                 left: size.width * 0.02),
                            //             decoration: BoxDecoration(
                            //                 color: Color(0xff474547),
                            //                 shape: BoxShape.circle,
                            //                 border:
                            //                 selectedColor == "0xff474547"
                            //                     ? Border(
                            //                   bottom: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   left: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   top: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   right: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                 )
                            //                     : Border()),
                            //           ),
                            //         ),
                            //         GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               selectedColor = "0xFFf7d1c5";
                            //             });
                            //           },
                            //           child: Container(
                            //             width: size.width * 0.1,
                            //             height: size.width * 0.1,
                            //             margin: EdgeInsets.only(
                            //                 right: size.height * 0.02,
                            //                 left: size.width * 0.02),
                            //             decoration: BoxDecoration(
                            //                 color: Color(0xFFf7d1c5),
                            //                 shape: BoxShape.circle,
                            //                 border:
                            //                 selectedColor == "0xFFf7d1c5"
                            //                     ? Border(
                            //                   bottom: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   left: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   top: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                   right: BorderSide(
                            //                       color: Colors.black,
                            //                       width: 3),
                            //                 )
                            //                     : Border()),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "${widget.desc}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.02),
                      height: 1,
                      width: size.width,
                      color: Colors.grey[400],
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: size.height * 0.016),
              child: Text(
                "Recommended Products",
                style: TextStyle(
                    fontSize: size.width * 0.044,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.04),
              width: size.width,
              height: size.height * 0.3,
              color: Colors.white,
              child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    // moveToProductView(
                    //     id: snapshot.data["recommendations"][index]
                    //     ["id"],
                    //     image:
                    //     "${snapshot.data["recommendations"][index]["thumbnail"]}",
                    //     title:
                    //     "${snapshot.data["recommendations"][index]["name"]}",
                    //     brand:
                    //     "${snapshot.data["recommendations"][index]["status"]}",
                    //     price: snapshot.data["recommendations"][index]
                    //     ["price"],
                    //     desc:
                    //     "${snapshot.data["recommendations"][index]["description"]}");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10, left: 5,right: 5),
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
                                      height: size.height * 0.2,
                                      width: size.width * 0.4,
                                      child: Image.asset("images/guava.png")
                                    // CachedNetworkImage(
                                    //   imageUrl: snapshot.data["recommendations"]
                                    //   [index]["thumbnail"],
                                    //   placeholder: (context, url) => Center(
                                    //       child: CircularProgressIndicator()),
                                    //   errorWidget: (context, url, error) =>
                                    //       Center(child: Icon(Icons.error)),
                                    // ),

                                    //   Image.network(
                                    //       snapshot.data["data"][index]
                                    //       ["thumbnail"]),
                                  ),
                                  // SizedBox(height: size.height*0.005,),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: size.width * 0.03,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Avalible",
                                          //"${snapshot.data["recommendations"][index]["status"]}",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.033,
                                              letterSpacing: 0.6),
                                        ),
                                        SizedBox(
                                          height: 2.5,
                                        ),
                                        Text("NAME",
                                          //"${snapshot.data["recommendations"][index]["name"]}",
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: size.width * 0.032),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: size.width*0.16,
                                height: size.height*0.0325,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomLeft:Radius.circular(15),
                                    )
                                ),
                                child: Center(
                                    child:Text("50 \$",
                                      // "\$${snapshot.data["recommendations"][index]["price"]}",
                                      style: GoogleFonts.meeraInimai(
                                          color: Colors.white,
                                          fontSize: size.width * 0.037),
                                    )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   //margin: EdgeInsets.all(size.width * 0.01),
                  //   height: size.height * 0.3,
                  //   width: size.width * 0.3,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(10),
                  //       boxShadow: [
                  //         BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(1.5,1.5))
                  //       ]
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         height: size.height * 0.2,
                  //         width: size.width * 0.4,
                  //         child: Image.asset("images/akila.png")
                  //         // CachedNetworkImage(
                  //         //   imageUrl: snapshot.data["recommendations"]
                  //         //   [index]["thumbnail"],
                  //         //   placeholder: (context, url) => Center(
                  //         //       child: CircularProgressIndicator()),
                  //         //   errorWidget: (context, url, error) =>
                  //         //       Center(child: Icon(Icons.error)),
                  //         // ),
                  //
                  //         //   Image.network(
                  //         //       snapshot.data["data"][index]
                  //         //       ["thumbnail"]),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(
                  //             left: size.width * 0.03,
                  //             top: size.height * 0.02),
                  //         alignment: Alignment.centerLeft,
                  //         child: Column(
                  //           crossAxisAlignment:
                  //           CrossAxisAlignment.start,
                  //           children: [
                  //             Text("Available",
                  //               //"${snapshot.data["recommendations"][index]["status"]}",
                  //               style: GoogleFonts.roboto(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: size.width * 0.033,
                  //                   letterSpacing: 0.6),
                  //             ),
                  //             SizedBox(
                  //               height: 2.5,
                  //             ),
                  //             Text("Name",
                  //               //"${snapshot.data["recommendations"][index]["name"]}",
                  //               style: GoogleFonts.roboto(
                  //                   color: Colors.black,
                  //                   fontSize: size.width * 0.032),
                  //             ),
                  //             SizedBox(
                  //               height: 2.5,
                  //             ),
                  //             Text("\$50",
                  //              // "\$${snapshot.data["recommendations"][index]["price"]}",
                  //               style: GoogleFonts.meeraInimai(
                  //                   color: Colors.black,
                  //                   fontSize: size.width * 0.032),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                );
              },
            ),
              // FutureBuilder(
              //   future: CallApi().getRecommendedProducts(
              //       product_id: "${widget.id}", context: context),
              //   builder: (_, snapshot) {
              //     if (snapshot.hasData) {
              //       //return Container();
              //       return ListView.builder(
              //         itemCount: snapshot.data["recommendations"].length,
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (_, index) {
              //           return InkWell(
              //             onTap: () {
              //               moveToProductView(
              //                   id: snapshot.data["recommendations"][index]
              //                       ["id"],
              //                   image:
              //                       "${snapshot.data["recommendations"][index]["thumbnail"]}",
              //                   title:
              //                       "${snapshot.data["recommendations"][index]["name"]}",
              //                   brand:
              //                       "${snapshot.data["recommendations"][index]["status"]}",
              //                   price: snapshot.data["recommendations"][index]
              //                       ["price"],
              //                   desc:
              //                       "${snapshot.data["recommendations"][index]["description"]}");
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
              //                       imageUrl: snapshot.data["recommendations"]
              //                           [index]["thumbnail"],
              //                       placeholder: (context, url) => Center(
              //                           child: CircularProgressIndicator()),
              //                       errorWidget: (context, url, error) =>
              //                           Center(child: Icon(Icons.error)),
              //                     ),
              //
              //                     //   Image.network(
              //                     //       snapshot.data["data"][index]
              //                     //       ["thumbnail"]),
              //                   ),
              //                   Container(
              //                     margin: EdgeInsets.only(
              //                         left: size.width * 0.03,
              //                         top: size.height * 0.02),
              //                     alignment: Alignment.centerLeft,
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "${snapshot.data["recommendations"][index]["status"]}",
              //                           style: GoogleFonts.roboto(
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: size.width * 0.033,
              //                               letterSpacing: 0.6),
              //                         ),
              //                         SizedBox(
              //                           height: 2.5,
              //                         ),
              //                         Text(
              //                           "${snapshot.data["recommendations"][index]["name"]}",
              //                           style: GoogleFonts.roboto(
              //                               color: Colors.black,
              //                               fontSize: size.width * 0.032),
              //                         ),
              //                         SizedBox(
              //                           height: 2.5,
              //                         ),
              //                         Text(
              //                           "\$${snapshot.data["recommendations"][index]["price"]}",
              //                           style: GoogleFonts.meeraInimai(
              //                               color: Colors.black,
              //                               fontSize: size.width * 0.032),
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: size.width * 0.02),
        height: size.height * 0.09,
        width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            )
          ),

        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
              height: size.height * 0.07,
              width: size.width * 0.15,
              child: Center(
                child: Icon(Icons.bookmark_outline_sharp,size: size.width * 0.075,color:Color(0xFF37474F))
              ),
              decoration: BoxDecoration(
                color:Color(0xFFCFD8DC),
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(1.5,1.5)
                    )
                  ]
                  ),
            ),
            GestureDetector(
              onTap: () {
                CallApi().postItemsToCart(
                    context: context, id: widget.id, quantity: quantity);
                Toast.show("Added to Cart", context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.BOTTOM,
                    backgroundColor: Color(0xff0059ff),
                    textColor: Colors.white);

                addToBagList(
                    brand: widget.brand,
                    name: widget.title,
                    buildContext: context,
                    pic: widget.image,
                    price: double.parse(widget.price),
                    quantity: quantity);
                Navigator.pop(context);
              },
              child: Container(
                //margin: EdgeInsets.only(left: size.width * 0.03),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                height: size.height * 0.07,
                width: size.width * 0.7,
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
offset: Offset(3,3)
                      )
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  addToBagList(
      {double price,
      String pic,
      int quantity,
      String brand,
      String name,
      BuildContext buildContext}) {
    List localList =
        Provider.of<OrderProvider>(context, listen: false).getList();
    Map<String, dynamic> oderMap = {
      "name": "$name",
      "quantity": "$quantity",
      "brand": "$brand",
      "image": "$pic",
      "price": "$price"
    };

    localList.add(oderMap);

    Provider.of<OrderProvider>(context, listen: false)
        .setBagList(bagList: localList);
  }

  // isProductAdded({String orderId}) {
  //   List products = Provider.of<OrderProvider>(context, listen: false)
  //       .getBagList();
  //
  // }
}
