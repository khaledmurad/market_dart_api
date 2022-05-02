import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spree/screens/Cart/cart_screen.dart';
import 'package:spree/screens/Search/search_screen.dart';
import 'package:spree/screens/Account/account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SubPages/bottombaritem.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> allWidgets = [
    HomeTab(),
    SearchScreen(),
    CartScreen(),
    AccountScreen()
  ];
  String activePage = "home";
  void setActivePage(String page) {
    setState(() {
      activePage = page;
    });
    print(activePage);
  }
  @override
  void initState() {
    items = [
      BottomBarItem(
        icon: FontAwesome.home,
        onPressed: () {
          setActivePage("home");
          _tabIndex = 0;
        },
        key: "home",
      ),
      BottomBarItem(
        icon: FlutterIcons.search1_ant,
        onPressed: () {
          setActivePage("search");
          _tabIndex = 1;
        },
        key: "search",
      ),
      BottomBarItem(
        icon: FlutterIcons.cart_mco,
        onPressed: () {
          setActivePage("cart");
          _tabIndex = 2;
        },
        key: "cart",
      ),
      BottomBarItem(
        icon: FlutterIcons.user_ant,
        onPressed: () {
          setActivePage("account");
          _tabIndex = 3;
        },
        key: "account",
      )
    ];
    super.initState();
  }

  int _tabIndex = 0;
  List<BottomBarItem> items = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            allWidgets.elementAt(_tabIndex),
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: Container(
                  padding: EdgeInsets.only(
                      right: size.width*0.08, left: size.width*0.08, top: size.height*0.01, bottom: size.height*0.01),
                  margin: EdgeInsets.only(
                      right: size.width*0.1, left: size.width*0.1, top:  size.height*0.01, bottom: size.height*0.01),
                  height: size.height*0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(7.5),
                      topRight: Radius.circular(7.5),
                    ),
                    color: Color(0xFFBBDEFB),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: items
                        .map(
                          (BottomBarItem item) => getBottomWidgetItem(
                          context, item, activePage == item.key),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: Container(
        //   child: BottomNavigationBar(
        //     elevation: 12,
        //     backgroundColor: Colors.white,
        //     onTap: (index) {
        //       setState(() {
        //         _tabIndex = index;
        //       });
        //     },
        //     type: BottomNavigationBarType.fixed,
        //     currentIndex: _tabIndex,
        //     showUnselectedLabels: true,
        //     selectedItemColor: Colors.blue,
        //     unselectedItemColor: Colors.black,
        //     selectedLabelStyle:
        //         TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        //     items: [
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.home_outlined),
        //           title: Text(
        //             "Home",
        //             style: TextStyle(),
        //           )),
        //       BottomNavigationBarItem(
        //           icon: Icon(CupertinoIcons.search),
        //           title: Text("Search", style: TextStyle())),
        //       BottomNavigationBarItem(
        //           icon: Icon(CupertinoIcons.shopping_cart),
        //           title: Text("Cart", style: TextStyle())),
        //       BottomNavigationBarItem(
        //           icon: Icon(CupertinoIcons.person),
        //           title: Text("Account", style: TextStyle())),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}


Widget getBottomWidgetItem(
    BuildContext context, BottomBarItem item, bool isActive) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      //color: isActive ? Colors.green : Colors.transparent,
    ),
    child: AnimatedSwitcher(
      duration: Duration(milliseconds: 450),
      child: isActive
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            color: Colors.blue,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          )
        ],
      )
          : Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: IconButton(
          icon: Icon(
            item.icon,
            color: Colors.grey,
          ),
          onPressed: item.onPressed,
        ),
      ),
    ),
  );
}