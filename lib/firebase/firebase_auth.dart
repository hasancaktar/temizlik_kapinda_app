import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:temizlik_kapinda_app/screens/Login.dart';
import 'package:temizlik_kapinda_app/screens/SiparisDetay%C4%B1.dart';
import 'package:temizlik_kapinda_app/screens/profil.dart';

// ignore: must_be_immutable
class FirebaseAuthIslem extends ChangeNotifier {
  static bool siparistenMiGeldin = false;
  static bool girisyapildi = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static bool isLoadingg = false;

  Future girisYap(BuildContext context, String email, String sifre) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: sifre)
          .then((oturumAcmisKullaniciAuthResoult) {
        girisyapildi = true;

          //
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => ProfilScreen()));

        isLoadingg = true;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Geçersiz mail.');
        isLoadingg = true;
        gecersizMailleGiris(context, "Hata", "Geçersiz Mail");
      } else if (e.code == 'wrong-password') {
        gecersizMailleGiris(context, "Hata", "Hatalı şifre");
        isLoadingg = true;
      }
    }
    notifyListeners();
  }

  Future uyeOl(
    BuildContext context,
    String email,
    String sifre,
    String telefon,
    String ad,
    String soyad,
  ) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: sifre)
          .then((authResult) {
        //print("Üye olundu");
        var firebaseUser = authResult.user;
        if (firebaseUser != null) {
          _uyeOlshowDialog(
              context, "Üyeliğiniz Gerçekleşti", "Giriş yapabilirsiniz");
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _kullanilanMailleUyeOlshowDialog(
            context, "Hata", "Bu mail zaten kullanılıyor");
        print("zaten var");
      }
    }
    notifyListeners();
  }

  void _uyeOlshowDialog(BuildContext context, String title, String content) {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Text(content),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        );
      },
    );
    notifyListeners();
  }

  void gecersizMailleGiris(BuildContext context, String title, String content) {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Text(content),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    notifyListeners();
  }

  void _kullanilanMailleUyeOlshowDialog(
      BuildContext context, String title, String content) {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Text(content),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    notifyListeners();
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
    notifyListeners();
  }

}
