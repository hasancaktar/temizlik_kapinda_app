import 'package:flutter/material.dart';

import '../Login.dart';

class KoltukYikama extends StatefulWidget {
  const KoltukYikama({
    Key key,
  }) : super(key: key);

  @override
  _KoltukYikamaState createState() => _KoltukYikamaState();
}

class _KoltukYikamaState extends State<KoltukYikama> {
  List<String> haliTurleri = ['A', 'B', 'C', 'D'];
  String secilenHali;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Koltuk Yıkama"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Koltuk Türünü seçiniz",
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
                      'Koltuk türü seçin',
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
                    "Koltuk adadini girin",
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
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'ADET',
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
                            "Adet",
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
              Text("0.00TL", style: TextStyle(fontSize: 25))
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
