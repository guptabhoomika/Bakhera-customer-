import 'package:Service/src/ui/cartpg.dart';

import '../ui/storepg.dart';
import 'package:flutter/material.dart';

class VendorList extends StatefulWidget {
  final String title;
  VendorList({this.title});
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Icon(
            Icons.location_on,
            size: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPg()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Icon(
                Icons.shopping_cart,
                size: 20,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 11,
              color: Color(0xff2874F0),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.search),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Search for Stores',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            storetile("Kipps Market",
                "https://images-na.ssl-images-amazon.com/images/I/41ZF-V-a3YL._SX466_.jpg"),
            storetile("Easy Day",
                "https://lh3.googleusercontent.com/VCeEsWH2st1yXGFPM3Rj0dmPC3FE4-JwvCRM6hg-o-pBq3GeU0WbUhAYYjsl-CIx1MiqNFbFQTBqzpZn4r32F4uxQXo=w256")
          ],
        ),
      ),
    );
  }

  Widget storetile(String name, String img) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StorePg(
                        title: name,
                        img: img,
                      )));
        },
        child: Card(
          elevation: 3.0,
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth, image: NetworkImage(img)))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer),
                          Text("Open Now"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
