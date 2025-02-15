import 'package:Service/src/ui/widgets/Category.dart';
import 'package:Service/src/ui/widgets/DealsOfTheDay.dart';
import 'package:Service/src/ui/widgets/Offers.dart';
import 'package:Service/src/ui/widgets/OffersInList.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          'Search for Products, Services and More',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Thirdlist(),
          Secondlist(),
          Firstlist(),
          Fourthlist(),
          SizedBox(
            height: 5,
          ),
          //Fifthlist(),
        ],
      ),
    );
  }
}
