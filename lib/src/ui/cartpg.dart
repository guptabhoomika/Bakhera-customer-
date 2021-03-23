import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addresspg.dart';

class CartPg extends StatefulWidget {
  @override
  _CartPgState createState() => _CartPgState();
}

class _CartPgState extends State<CartPg> {
  int totalprice = 0;
  int totalitem = 0;
  bool isempty = true;

  fetchtot() {
    FirebaseFirestore.instance
        .collection("cart")
        .where("user_id", isEqualTo: "Bhoomika12345")
        .get()
        .then((value) => {
              if (value.docs.length == 0)
                {
                  setState(() {
                    isempty = true;
                  })
                }
              else
                {
                  setState(() {
                    isempty = false;
                  }),
                  totalitem = value.docs.length,
                  print(value.docs.length),
                  for (int i = 0; i < value.docs.length; i++)
                    {
                      setState(() {
                        totalprice += value.docs[i]["prod_price"] *
                            value.docs[i]["prod_quan"];
                      }),
                    },
                  print(totalprice)
                }
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchtot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isempty == true
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "My Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Container(
                child: Image.asset("assets/empty_cart.png"),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "My Cart",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Center(
                      child: Text(
                    totalprice.toString() + "(" + totalitem.toString() + ")",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ],
            ),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("cart")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
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
                              DocumentSnapshot cart = snapshot.data.docs[index];

                              // print(names);

                              return carttile(
                                  cart["prod_name"],
                                  cart["prod_img"],
                                  cart["prod_price"],
                                  cart["prod_quan"],
                                  cart["prod_size"].toString(),
                                  cart.id);
                            },
                          );
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryConfirm(
                                      amt: totalprice,
                                      items: totalitem,
                                      vendortag: "guptastore",
                                    )));
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text("Proceed To Checkout"),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget carttile(
      String title, String img, int price, int quan, String amt, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Card(
        elevation: 3.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth, image: NetworkImage(img)))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "₹ " + price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      amt,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              totalprice += price;
                            });
                            FirebaseFirestore.instance
                                .collection("cart")
                                .doc(id)
                                .update({"prod_quan": ++quan});
                            print(totalprice);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          quan.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (quan != 1) {
                              setState(() {
                                totalprice -= price;
                              });

                              FirebaseFirestore.instance
                                  .collection("cart")
                                  .doc(id)
                                  .update({"prod_quan": --quan});

                              ///
                            } else {
                              setState(() {
                                totalprice -= price;
                                totalitem--;
                              });
                              FirebaseFirestore.instance
                                  .collection("cart")
                                  .doc(id)
                                  .delete();
                            }

                            // quan--;

                            print(totalprice);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
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
    );
  }
}
