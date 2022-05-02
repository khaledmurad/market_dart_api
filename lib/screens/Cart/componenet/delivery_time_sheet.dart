import 'package:flutter/material.dart';

import '../cart_screen.dart';

class DeliveryTimeBottomSheet extends StatefulWidget {
  const DeliveryTimeBottomSheet({Key key}) : super(key: key);

  @override
  _DeliveryTimeBottomSheetState createState() => _DeliveryTimeBottomSheetState();
}
bool btnIsVisible;

class _DeliveryTimeBottomSheetState extends State<DeliveryTimeBottomSheet> {
  int selectedTime=0;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height*0.9,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: new Container(
            padding: EdgeInsets.only(top: size.height*0.05,right: size.width*0.03),
            decoration: new BoxDecoration(
                color: Colors.white,

                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(13.0),
                    topRight: const Radius.circular(13.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text("Select Your Delivery Time",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: size.width*0.06,

                  ),),
                  margin: EdgeInsets.only(left: size.width*0.07),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTime = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
                    alignment:Alignment.centerLeft,
                    margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
                    child:Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today",style: TextStyle(color:selectedTime==1? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
                              fontSize: size.width*0.033,),),
                            Text("10:00AM - 12:00PM",style: TextStyle(color: selectedTime==1? Colors.white:Colors.black,fontWeight: FontWeight.w600,
                              fontSize: size.width*0.05,),)
                          ],)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: selectedTime==1? Colors.black:Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: size.width*0.9,
                    height: size.height*0.085,

                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTime = 2;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
                    margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
                    child:Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today",style: TextStyle(color: selectedTime==2? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
                              fontSize: size.width*0.033,),),
                            Text("12:00PM - 2:00PM",style: TextStyle(color: selectedTime==2? Colors.white:Colors.black,fontWeight: FontWeight.w600,
                              fontSize: size.width*0.05,),)
                          ],)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: selectedTime==2? Colors.black:Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: size.width*0.9,
                    height: size.height*0.085,
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedTime = 3;
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
                    margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
                    child:Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today",style: TextStyle(color: selectedTime==3? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
                              fontSize: size.width*0.033,),),
                            Text("2:00AM - 4:00PM",style: TextStyle(color:  selectedTime==3? Colors.white:Colors.black,fontWeight: FontWeight.w600,
                              fontSize: size.width*0.05,),)
                          ],)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: selectedTime==3? Colors.black:Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: size.width*0.9,
                    height: size.height*0.085,
                  ),
                ),
                Visibility(
                  visible: isScrollControlled,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedTime = 4;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
                      margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
                      child:Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Today",style: TextStyle(color: selectedTime==4? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
                                fontSize: size.width*0.033,),),
                              Text("4:00AM - 6:00PM",style: TextStyle(color: selectedTime==4? Colors.white:Colors.black,fontWeight: FontWeight.w600,
                                fontSize: size.width*0.05,),)
                            ],)
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: selectedTime==4? Colors.black:Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: size.width*0.9,
                      height: size.height*0.085,
                    ),
                  ),
                ),
                Visibility(
                  visible: isScrollControlled,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedTime = 5;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
                      margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
                      child:Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Today",style: TextStyle(color: selectedTime==5? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
                                fontSize: size.width*0.033,),),
                              Text("6:00AM - 8:00PM",style: TextStyle(color: selectedTime==5? Colors.white:Colors.black,fontWeight: FontWeight.w600,
                                fontSize: size.width*0.05,),)
                            ],)
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: selectedTime==5? Colors.black:Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: size.width*0.9,
                      height: size.height*0.085,
                    ),
                  ),
                ),
                Visibility(
  visible: isScrollControlled,
  child: InkWell(
  onTap: (){
    setState(() {
      selectedTime = 6;
    });
  },
  child: Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
    margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
    child:Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today",style: TextStyle(color: selectedTime==6? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
              fontSize: size.width*0.033,),),
            Text("8:00PM - 10:00PM",style: TextStyle(color: selectedTime==6? Colors.white:Colors.black,fontWeight: FontWeight.w600,
              fontSize: size.width*0.05,),)
          ],)
      ],
    ),
    decoration: BoxDecoration(
        color: selectedTime==6? Colors.black:Colors.white,
        borderRadius: BorderRadius.circular(10)
    ),
    width: size.width*0.9,
    height: size.height*0.085,
  ),
),),
                Visibility(
                  visible: isScrollControlled,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedTime = 7;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: size.height*0.01,left: size.width*0.02),
                      margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.014,bottom: size.height*0.01),
                      child:Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tomorrow",style: TextStyle(color: selectedTime==7? Colors.white60:Colors.grey,fontWeight: FontWeight.w600,
                                fontSize: size.width*0.033,),),
                              Text("8:00AM - 10:00PM",style: TextStyle(color: selectedTime==7? Colors.white:Colors.black,fontWeight: FontWeight.w600,
                                fontSize: size.width*0.05,),)
                            ],)
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: selectedTime==7? Colors.black:Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: size.width*0.9,
                      height: size.height*0.085,
                    ),
                  ),),
                Visibility(
                  visible: btnIsVisible??true,
                  replacement: selectedTime!=0? InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      settingModalBottomSheetAddress(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width*0.89,
                      margin: EdgeInsets.only(left: size.width*0.06,
                          bottom: size.height*0.01
                      ),
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.13,vertical: size.height*0.02),
                      child: Text("Continue",style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width*0.05,
                          fontWeight: FontWeight.w800
                      ),),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff2a4ff2)
                      ),
                    ),
                  ):Container(

                  ),
                  child: InkWell(
                    onTap: (){
                      isScrollControlled = true;
                      print(isScrollControlled);
                      Navigator.pop(context);
                      Future.delayed(Duration(milliseconds: 200),(){
                        setState(() {
                          btnIsVisible = false;
                          settingModalBottomSheetTime(context);

                        });
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: size.width*0.08,bottom: size.height*0.03
                      ),
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.13,vertical: size.height*0.02),
                      child: Text("See All Delivery Windows",style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width*0.05,
                      ),),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black,
                                width: 0.2,
                                style: BorderStyle.solid
                            ),
                            top:  BorderSide(
                                color: Colors.black,
                                width: 0.2,
                                style: BorderStyle.solid
                            ),
                            left:  BorderSide(
                                color: Colors.black,
                                width: 0.2,
                                style: BorderStyle.solid
                            ),
                            right:  BorderSide(
                                color: Colors.black,
                                width: 0.2,
                                style: BorderStyle.solid
                            ),
                          )
                      ),

                    ),
                  ),
                )

              ],
            )));
  }
}











