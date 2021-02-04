import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiparisDetayiScreen extends StatefulWidget {
  @override
  _SiparisDetayiScreenState createState() => _SiparisDetayiScreenState();
}

class _SiparisDetayiScreenState extends State<SiparisDetayiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Detay")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 30,
              child: Column(
                children: [
                  Text("İsim Soyisim" , style: TextStyle(fontSize: 20),),
                  Text(
                    "Hasan Sancaktar",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text("Telefon" , style: TextStyle(fontSize: 20),),
                  Text(
                    "+905052022233",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text("Adres" , style: TextStyle(fontSize: 20),),
                  Text(
                    "Adres bilgisi",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text("Halı Türü"),
                  Text(
                    "----------",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Text("Boyutu" , style: TextStyle(fontSize: 20),),
                  Text(
                    "----------",
                    style: TextStyle(fontSize: 30),
                  ),
                  Divider(
                    color: Colors.black,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Toplam Tutar",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "0.00 TL",
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: RaisedButton(
                child: Text(
                  "Siparişi Tamamla",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}
