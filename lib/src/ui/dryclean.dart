import '../ui/dryclean_det.dart';
import 'package:flutter/material.dart';

class DryClean extends StatefulWidget {
  @override
  _DryCleanState createState() => _DryCleanState();
}

class _DryCleanState extends State<DryClean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Dry Cleaning",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
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
                            'Search for Dry Cleaning Services',
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DryCleanDet(
                                title: "Smart Wash",
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
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(
                                        "https://content3.jdmagicbox.com/comp/bareilly/b2/9999px581.x581.181012064959.e9b2/catalogue/smart-wash-laundry-service-bareilly-mcwltmayre.jpg?clr=2b3b3b")))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("SMART WASH",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(
                                      "https://content3.jdmagicbox.com/comp/bareilly/x5/9999px581.x581.161012162932.s9x5/catalogue/dhobi-ghat-bareilly-9kug3rl1mk.jpg?clr=204646")))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("DHOBI GHAAT",
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(
                                      "https://content3.jdmagicbox.com/comp/def_content/cleaning-services/shutterstock-128998688-cleaning-services-2-t71zi-250.jpg")))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WISH WASH",
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
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Fifthlist(),
          ],
        ),
      ),
    );
  }
}
