import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllBrands extends StatefulWidget {
  const AllBrands({Key key}) : super(key: key);

  @override
  _AllBrandsState createState() => _AllBrandsState();
}

class _AllBrandsState extends State<AllBrands> {

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


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Brands",style: GoogleFonts.zillaSlab(color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: size.width*0.06),),centerTitle: true,
      backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
        ),
      ),
      body: GridView.builder(
          itemCount: brandTitle.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ), itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left:size.width*0.02,right: size.width*0.02,top:size.width*0.02,bottom: size.width*0.02),
          width: size.width*0.4,
          height: size.height*0.3,
          decoration: BoxDecoration(
            color: Color(0xffcecbce),
    image: DecorationImage(
              scale: 5,
              image: AssetImage(
                "images/${brandImages[index]}",
              ),
      colorFilter:ColorFilter.srgbToLinearGamma()
          ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text("${brandTitle[index]}",style: GoogleFonts.cabin(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.8,
                fontSize: size.width*0.05
            ),),
            width: size.width*0.26,
            height: size.width*0.26,
            decoration: BoxDecoration(
            ),
          ),
        );
      }),
    ));
  }
}
