import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';

class UpdateInfo extends StatefulWidget {
  final fName;
  final lName;
  final address;
  final apartmentAddress;
  final zipCode;
  final city;
  final region;
  final country;

  const UpdateInfo(
      {Key key,
      this.fName,
      this.lName,
      this.address,
      this.apartmentAddress,
      this.zipCode,
      this.city,
      this.region,
      this.country})
      : super(key: key);

  @override
  _UpdateInfoState createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  TextEditingController _controllerFName = TextEditingController();
  TextEditingController _controllerLName = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerApartmentAddress = TextEditingController();
  TextEditingController _controllerZipCode = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerRegion = TextEditingController();
  TextEditingController _controllerCountry = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerFName.text = widget.fName ?? "";
    _controllerLName.text = widget.lName ?? "";
    _controllerAddress.text = widget.address ?? "";
    _controllerApartmentAddress.text = widget.apartmentAddress ?? "";
    _controllerZipCode.text = widget.zipCode ?? "";
    _controllerCity.text = widget.city ?? "";
    _controllerRegion.text = widget.region ?? "";
    _controllerCountry.text = widget.country ?? "";
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
        elevation: 0,
        title: Text(
          "Update info",
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.45,
                    padding: EdgeInsets.only(
                        left: size.width * 0.04, top: size.height * 0.004),
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.grey[300].withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: _controllerFName,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "First name",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: size.width * 0.04)),
                    ),
                  ),
                  Container(
                    width: size.width * 0.45,
                    padding: EdgeInsets.only(
                        left: size.width * 0.04, top: size.height * 0.004),
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.grey[300].withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: _controllerLName,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Last name",
                          hintStyle: TextStyle(
                              height: 1,
                              color: Colors.black.withOpacity(0.5),
                              fontSize: size.width * 0.04)),
                    ),
                  ),
                ],
              ),

              /// Address
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.93,
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),

              /// Apartment address
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.93,
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerApartmentAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Apartment address option",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),

              /// Zip code
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.93,
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerZipCode,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Zip code",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),

              /// City
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.93,
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerCity,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "City",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),

              /// Region
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.93,
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerRegion,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Region",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),

              /// Country
              Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.93,
                padding: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerCountry,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Country",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),

              InkWell(
                onTap: () {
                  updateInfo(context);
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: size.height * 0.003),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  height: size.height * 0.06,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Save",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white, fontSize: size.width * 0.04),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  updateInfo(BuildContext context) async {
    if (_controllerFName.text.length > 1 &&
        _controllerLName.text.length > 1 &&
        _controllerAddress.text.length > 1 &&
        _controllerZipCode.text.length > 1 &&
        _controllerRegion.text.length > 1 &&
        _controllerCity.text.length > 1 &&
        _controllerCountry.text.length > 1) {
      Response response = await CallApi().postPersonalInfo(
          context: context,
          lName: _controllerLName.text,
          fName: _controllerFName.text,
          address: _controllerAddress.text,
          apartmentAddress: _controllerApartmentAddress.text ?? "",
          city: _controllerCity.text,
          country: _controllerCountry.text,
          region: _controllerRegion.text,
          zipCode: _controllerZipCode.text);

    }
  }
}
