import 'package:flutter/material.dart';

import '../ui/enquire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../ui/alldrycleanservices.dart';

class DryCleanDet extends StatefulWidget {
  final String title;
  final String img;
  final String id;
  final String time;
  final String loc;
  DryCleanDet({this.title, this.img, this.time, this.id, this.loc});
  @override
  _DryCleanDetState createState() => _DryCleanDetState();
}

class _DryCleanDetState extends State<DryCleanDet> {
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Icon(
              Icons.shopping_cart,
              size: 20,
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
                            'Search for Services',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 3.0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(widget.img)))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.title.toUpperCase(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    Text(widget.loc),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyCustomForm()));
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text("Enquire Now"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllDryCleanService(
                                id: widget.id,
                              ),
                            ));
                      },
                      child: Text("View All"))
                ],
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("drycleanservice")
                    .doc(widget.id)
                    .collection("Services")
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.40,
                        ),
                        CircularProgressIndicator()
                      ],
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // physics: NeverScrollablePhysics(),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot service = snapshot.data.docs[index];

                        // print(names);

                        return drycleanservice(
                            service["service_name"],
                            service["service_cost"],
                            service["service_clothes"],
                            service["service_img_url"],
                            service["service_duration"],
                            widget.id,
                            context);
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

Widget drycleanservice(String name, String price, String quan, String img,
    String time, String id, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        elevation: 10.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth, image: NetworkImage(img))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 16),
                child: Column(
                  children: [
                    Text(
                      "₹ " + price,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      "Per " + quan + " clothes",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  time,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {},
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Book Now"),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ]),
      ),
    ),
  );
}
