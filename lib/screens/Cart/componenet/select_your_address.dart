import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({Key key}) : super(key: key);

  @override
  _SelectAddressState createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height*0.05,right: size.width*0.03),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(13.0),
              topRight: const Radius.circular(13.0))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.cancel_outlined,color: Colors.black,size: size.width*0.07,), onPressed: (){
              screenPop(context);
              }),
             Text("Add Address",style: GoogleFonts.zillaSlab(color: Colors.black,fontSize: size.width*0.07,fontWeight: FontWeight.w800),),
              SizedBox(
                width: size.width*0.1,
              ),
            ],
          ),
          SizedBox(
            height: size.height*0.05,
          ),
          Container(
            width: size.width,
            height: 0.7,
            color: Colors.black45,
          ),

    Container(
alignment: Alignment.center,
      height: size.height*0.1,
      child: TextField(

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Your Address",
          hintStyle: TextStyle(
            height: 1.2,
            fontWeight: FontWeight.w400,
            fontSize: size.width*0.045
          ),
          prefixIcon: Icon(Icons.search)
        ),
      ),
    ),



          Container(
            width: size.width,
            height: 0.7,
            color: Colors.black45,
          )
        ],
      ),
    );
  }
}
