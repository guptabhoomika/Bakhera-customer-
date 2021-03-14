import '../ui/prod_det.dart';
import '../ui/vendor.dart';
import 'package:flutter/material.dart';

class ProdList extends StatefulWidget {
  @override
  _ProdListState createState() => _ProdListState();
}

class _ProdListState extends State<ProdList> {
  var name = [
    "https://images-na.ssl-images-amazon.com/images/I/71PiszDkulL._SL1500_.jpg",
    "https://www.bigbasket.com/media/uploads/p/l/284420_8-aashirvaad-multigrains-atta.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/41XDxFG9WzL.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/51R6OxZA-KL._SY450_.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/61L1thSI95L._SL1000_.jpg"
  ];

  buildItem(BuildContext context, int index, String title, int price) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProdDet(
                            title: title,
                            url: name[index],
                          )));
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 4,
              child: Image.network(
                name[index],
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 4,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 10),
          ),
          Text(
            "₹ " + price.toString(),
            style: TextStyle(color: Colors.green, fontSize: 10),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildItem(context, 0, "Coffee", 150),
          buildItem(context, 1, "Wheat Flour", 57),
          buildItem(context, 2, "Sugar", 42),
          buildItem(context, 3, "Rice", 70),
          buildItem(context, 4, "Toor Dal", 120)
        ],
      ),
    );
  }
}
