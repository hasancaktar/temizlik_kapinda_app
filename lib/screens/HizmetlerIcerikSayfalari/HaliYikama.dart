import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temizlik_kapinda_app/firebase/firebase_auth.dart';
import 'package:temizlik_kapinda_app/models/provider.dart';
import 'package:temizlik_kapinda_app/screens/Login.dart';
import 'package:temizlik_kapinda_app/screens/SiparisDetay%C4%B1.dart';
import 'package:temizlik_kapinda_app/screens/profil.dart';

class HaliYikama extends StatefulWidget {
  const HaliYikama({
    Key key,
  }) : super(key: key);

  @override
  _HaliYikamaState createState() => _HaliYikamaState();
}

class _HaliYikamaState extends State<HaliYikama> {


  FirebaseAuthIslem islem= new FirebaseAuthIslem();

  List<String> haliTurleri = ['A', 'B', 'C', 'D'];
  String secilenHali;
  final metrekareBoyutu = TextEditingController();
  String metrekare = "0.00 TL";

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    metrekare = metrekareBoyutu.text + " TL";
  }

  LoginScreen login = new LoginScreen();

  @override
  Widget build(BuildContext context) {
    print("giris degeri"+FirebaseAuthIslem.girisyapildi.toString());
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Halı Yıkama"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Halı Türünü seçiniz",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange[100],
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: DropdownButton(
                    dropdownColor: Colors.orange,
                    isExpanded: true,
                    elevation: 15,
                    hint: Text(
                      'Halı türü seçin',
                      style: TextStyle(fontSize: 20),
                    ),
                    // Not necessary for Option 1
                    value: secilenHali,
                    onChanged: (newValue) {
                      setState(() {
                        secilenHali = newValue;
                      });
                    },
                    items: haliTurleri.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 90),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Halı boyutunu girin",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TextField(onChanged: (text){
                          setState(() {
                            metrekare=text;
                          });

                        },
                          controller: metrekareBoyutu,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'M2.',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          //  color: Colors.blueGrey,
                          child: Text(
                            "m2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Toplam Fiyat",
                style: TextStyle(fontSize: 25),
              ),
              Text(metrekareBoyutu.text +" TL" ?? "0.00 TL",
                  style: TextStyle(fontSize: 25))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: RaisedButton(
              child: Text(
                "Devam Et",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                Provider.of<Durumlar>(context).AddList();
               // FirebaseAuthIslem.siparistenMiGeldin=true;
                print("siparişten mi geldin"+FirebaseAuthIslem.siparistenMiGeldin.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              //  login.siparistenMiGeldin=true;
              //   if(FirebaseAuthIslem.girisyapildi==true){
              //
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => SiparisDetayiScreen()));
              //   }
              //   else
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
