import 'package:flutter/material.dart';

import 'Drawerfile.dart';

class Drawerfile extends StatefulWidget {
  @override
  _DrawerfileState createState() => _DrawerfileState();
}

class _DrawerfileState extends State<Drawerfile> {
  List<DrawerItemModel> drawerItemModel;

  @override
  void initState() {
    super.initState();
    addDrawerItem();
  }

  addDrawerItem() {
    drawerItemModel = List<DrawerItemModel>();

    drawerItemModel
        .add(DrawerItemModel("Groceries", Icons.local_grocery_store));
    drawerItemModel
        .add(DrawerItemModel("Foods and Vegetables", Icons.food_bank_sharp));
    drawerItemModel.add(DrawerItemModel("Gifts and Stationery", Icons.edit));
    drawerItemModel
        .add(DrawerItemModel("Foods and Beverages", Icons.local_drink_sharp));
    drawerItemModel.add(DrawerItemModel("Hotel Booking", Icons.hotel));
    drawerItemModel.add(DrawerItemModel("Cafe Booking", Icons.restaurant));
    drawerItemModel.add(DrawerItemModel("Dry Cleaning", Icons.dry_cleaning));
    drawerItemModel.add(DrawerItemModel("Man Power Supply", Icons.person));
    drawerItemModel.add(DrawerItemModel("Edit Location", Icons.location_on));
  }

  buildItem(BuildContext context, int index) {
    if (drawerItemModel[index]._imageRes != null) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2, child: Icon(drawerItemModel[index]._imageRes)),
                Expanded(
                  flex: 10,
                  child: Text(
                    drawerItemModel[index].name,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20),
        child: Text(
          drawerItemModel[index].name,
          style: TextStyle(fontSize: 15),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          height: size.height / 10,
          color: Color(0xff2874F0),
          child: Center(
            child: ListTile(
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: drawerItemModel.length,
          itemBuilder: (context, index) {
            return buildItem(context, index);
          },
        )
      ],
    );
  }
}

class DrawerItemModel {
  String _name;
  IconData _imageRes;

  DrawerItemModel(this._name, this._imageRes);

  //IconData imageRes => _imageRes;

  String get name => _name;
}
