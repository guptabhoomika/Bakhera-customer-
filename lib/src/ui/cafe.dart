import 'package:flutter/material.dart';

import 'cafe_det.dart';

class Cafe extends StatefulWidget {
  @override
  _CafeState createState() => _CafeState();
}

class _CafeState extends State<Cafe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Cafe Booking",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.location_on,
              size: 20,
            ),
          ),
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
                            'Search for Cafes',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            cafetile(
                "https://b.zmtcdn.com/data/pictures/1/19479221/13eae75769811ad074269de5e8714664.jpeg",
                "Sarita's Cafe",
                "300",
                "10:00 am-7:00 pm",
                "Model Town"),
            cafetile(
                "https://content1.jdmagicbox.com/comp/bareilly/e8/9999px581.x581.180205021023.f9e8/catalogue/waffle-affairs-janak-puri-bareilly-restaurants-9l2hez4hy3-250.jpg",
                "Waffle Affairs",
                "200",
                "10:00 am-7:00 pm",
                "Model Town"),
            cafetile("https://i.ytimg.com/vi/cmgxB_EWk18/hqdefault.jpg",
                "Boston Cafe", "500", "10:00 am-7:00 pm", "Model Town")
          ],
        ),
      ),
    );
  }

  Widget cafetile(
      String img, String name, String price, String time, String loc) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CafeDet(
                        image: img,
                        name: name,
                        loc: loc,
                        price: price,
                        time: time,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Card(
            elevation: 10.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.8,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 16),
                    child: Column(
                      children: [
                        Text(
                          "₹ " + price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "For 2 people",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
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
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 15,
                    ),
                    Text(
                      loc,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
