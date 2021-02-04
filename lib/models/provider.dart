import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'haliModel.dart';

class Durumlar extends ChangeNotifier{
List<HaliModel> haliList=[];
AddList(){
HaliModel haliModel = HaliModel("halilar ${haliList.length}","detay ${haliList.length}");
haliList.add(haliModel);
notifyListeners();
}

}