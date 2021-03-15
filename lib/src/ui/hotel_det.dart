import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelDet extends StatefulWidget {
  final String name;
  final String img;
  final double rate;
  final String price;
  final String loc;
  HotelDet({this.img, this.name, this.price, this.rate, this.loc});

  @override
  _HotelDetState createState() => _HotelDetState();
}

class _HotelDetState extends State<HotelDet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.network(widget.img, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.name + "\n" + widget.loc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "8.4/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RatingBarIndicator(
                                  rating: widget.rate,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_purple500_outlined,
                                    size: 5,
                                    color: Colors.grey,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  unratedColor: Colors.white,
                                  direction: Axis.horizontal,
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(text: "8 km to beach")
                                  ]),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "₹ " + widget.price,
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "per night",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.purple,
                          textColor: Colors.white,
                          child: Text(
                            "Book Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      _tabSection(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.purple,
                labelColor: Colors.purple,
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Rooms"),
                  Tab(text: "Facilities"),
                  Tab(text: "Reviews"),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Column(
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                  ),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: NetworkImage(
                                              "https://r1imghtlak.mmtcdn.com/003b6bae844511e993e80242ac110002.jpg")))),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, top: 8),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("King Room",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text("₹ 3200"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Colors.purple,
                              textColor: Colors.white,
                              child: Text(
                                "Select",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0,
                              ),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: NetworkImage(
                                              "https://r1imghtlak.mmtcdn.com/256f6ce64fba11e989790242ac110003.jpg")))),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, top: 8),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Twin Room",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text("₹ 4200"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Colors.purple,
                              textColor: Colors.white,
                              child: Text(
                                "Select",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0,
                              ),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    "HEALTH AND WELLNESS",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Gym",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "First-aid Services",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Actvity Center",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "HEALTH AND WELLNESS",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Gym",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "First-aid Services",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Actvity Center",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "HEALTH AND WELLNESS",
                    textAlign: TextAlign.justify,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Gym",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "First-aid Services",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Actvity Center",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8d29tYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Nice Hotel",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "' Excellent Service '",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8d29tYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Awesome",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "' Excellent Service '",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
