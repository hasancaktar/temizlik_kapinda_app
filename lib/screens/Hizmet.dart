import 'package:flutter/material.dart';
import 'package:temizlik_kapinda_app/commonBottomNavigatorBAR.dart';
import 'package:temizlik_kapinda_app/firebase/firebase_auth.dart';
import 'package:temizlik_kapinda_app/screens/Destek.dart';
import 'package:temizlik_kapinda_app/screens/profil.dart';
import 'package:temizlik_kapinda_app/widgets/HomeBodyGridview.dart';

import 'Login.dart';

Widget dinlemek() {
  if (FirebaseAuthIslem.girisyapildi == true)
    return ProfilScreen();
  else
    return LoginScreen();
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final widgetOptions = [
    HomeTabbar(),
    DestekScreen(),
    FirebaseAuthIslem.girisyapildi == true ? ProfilScreen() : LoginScreen()
  ];

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    dinlemek();
    widgetOptions;
  }


  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: CommonBottomNavigationBar(
        childrens: widgetOptions,
        navigatorKeys: _navigatorKeys,
        selectedIndex: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.addchart_rounded),
            title: new Text('Coustom'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.call),
            title: new Text('Support'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profil'))
        ],
      ),
    );
  }


}

// Widget  buildColumn() {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//        SizedBox(
//          height: 25,
//        ),
//        Center(child: Text("temizlikyolda.com")),
//        GridviewWidget(),
//      ],
//    );
//  }

