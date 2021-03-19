import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryConfirm extends StatefulWidget {
  final String vendortag;
  final int amt;
  final int items;

  DeliveryConfirm({this.vendortag, this.amt, this.items});
  @override
  _DeliveryConfirmState createState() => _DeliveryConfirmState();
}

class _DeliveryConfirmState extends State<DeliveryConfirm> {
  TextEditingController _add1Controller = TextEditingController();
  TextEditingController _add2Controller = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _pincodeNumberController = TextEditingController();
  String userId;

  @override
  void initState() {
    super.initState();
  }

  void placeorder() {
    FirebaseFirestore.instance.collection("orders").add({
      "add1": _add1Controller.text,
      "add2": _add2Controller.text,
      "landmark": _landmarkController.text,
      "city": _cityController.text,
      "user_phone": _mobileNumberController.text,
      "pincode": _pincodeNumberController.text,
      "user_name": "Bhoomika",
      "vendor": widget.vendortag,
      "user_id": "Bhoomika12345"
    }).then((value) => {print("added")});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: Text(
          // AppLocalizations.of(context).tr('deliveryAppBar'),
          "Delivery Address",

          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        //centerTitle: true,

        // iconTheme: IconThemeData(color: Color(0xFF6991C7)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                // Padding(padding: EdgeInsets.only(top: 40.0)),
                TextFormField(
                  controller: _add1Controller,
                  decoration: InputDecoration(
                      labelText: "Address Line 1",
                      hintText: "Address Line 1",
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                TextFormField(
                  controller: _add2Controller,
                  decoration: InputDecoration(
                      labelText: "Address Line 2",
                      hintText: "Address Line 2",
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(
                  controller: _landmarkController,
                  decoration: InputDecoration(
                      labelText: "Landmark",
                      hintText: "Landmark",
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                      labelText: "City",
                      hintText: "City",
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _pincodeNumberController,
                  maxLength: 6,
                  decoration: InputDecoration(
                      labelText: "Pin Code",
                      hintText: "Pin Code",
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _mobileNumberController,
                  maxLength: 13,
                  decoration: InputDecoration(
                      labelText: "Mobile Number",
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {
                      placeorder();
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("Confirm Order"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
