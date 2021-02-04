import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:temizlik_kapinda_app/firebase/firebase_auth.dart';
import 'package:temizlik_kapinda_app/models/listenning.dart';
import 'package:temizlik_kapinda_app/screens/Login.dart';
import 'package:temizlik_kapinda_app/screens/SiparisDetay%C4%B1.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  GirisYapildiMiDinleme _dinleme = new GirisYapildiMiDinleme();
  FirebaseAuthIslem islem = new FirebaseAuthIslem();
  bool a = true;
  bool b = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("Profil Ekranı")),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              maxRadius: 55,
              child: Icon(
                Icons.person,
                size: 55,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 30,
              child: Column(
                children: [
                  Text("İsim Soyisim"),
                  Text(
                    "Hasan Sancaktar",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text("Telefon"),
                  Text(
                    "+905052022233",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text("Adres"),
                  Text(
                    "Adres bilgisi",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.08,
          //   width: MediaQuery.of(context).size.width,
          //   child: RaisedButton(
          //     child: Text(
          //       "Devam Et",
          //       style: TextStyle(fontSize: 25, color: Colors.white),
          //     ),
          //     color: Colors.green,
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => SiparisDetayiScreen()));
          //     },
          //   ),
          // ),
        ],
      )),
    );
  }

  // Future cikisYap(BuildContext context) async {
  //   await _cikisYapuyeOlshowDialog(context, "Dikkta", "Çıkış yapılıyor");
  //
  //   print("çıkış yapılıyor");
  //   // islem.girisyapildi = false;
  // }

  // void _cikisYapuyeOlshowDialog(
  //     BuildContext context, String title, String content) {
  //   // flutter defined function
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text(title),
  //         content: Text(content),
  //         //content: new Text("Alert Dialog body"),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           new FlatButton(
  //             child: new Text("Tamam"),
  //             onPressed: () {
  //               _auth.signOut();
  //               FirebaseAuthIslem.girisyapildi = false;
  //               FirebaseAuthIslem.girisyapildi = false;
  //               print(_auth.currentUser.email);
  //
  //               Navigator.pushNamedAndRemoveUntil(
  //                   context, '/', ModalRoute.withName('/'));
  //             },
  //           ),
  //           new FlatButton(
  //             child: new Text("İptal"),
  //             onPressed: () async {
  //               Navigator.pop(context);
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }
}

// Text("profil"),
// Text(_dinleme.IslemSonucuDeger.toString()),
// Text(_dinleme.islemSonucuDeger.toString())

// if (_dinleme.IslemSonucuDeger == false) {
//   _dinleme.IslemSonucuDeger = true;
//   print(_dinleme.IslemSonucuDeger);
// } else {
//   _dinleme.IslemSonucuDeger = false;
//   print(_dinleme.IslemSonucuDeger);
// }
