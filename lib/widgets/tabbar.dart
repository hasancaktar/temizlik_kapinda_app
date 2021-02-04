import 'package:flutter/cupertino.dart';
import 'package:temizlik_kapinda_app/screens/Destek.dart';
import 'package:temizlik_kapinda_app/screens/Login.dart';

import 'HomeBodyGridview.dart';

void tabbarWidget() {
  final widgetOptions = [
    HomeTabbar(),
    DestekScreen(),
    LoginScreen(),
  ];

  int currentIndex = 0;


}
