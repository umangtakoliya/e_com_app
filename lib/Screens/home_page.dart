import 'package:ecom_cf_2/utils/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils/all_product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues range = RangeValues(1, 3000);
  String? select;
  Color mycolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "HomePage",
          style: TextStyle(color: mycolor,fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.shopping_cart,
            color: mycolor,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DropdownButton(
                  padding: EdgeInsets.all(15),
                  hint: Text("Select Category"),
                  value: select,
                  items: Cat.map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ),
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        select = val;
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                Visibility(
                  visible: select != null,
                  child: ActionChip(
                    avatar: Icon(Icons.clear),
                    label: Text("Clear"),
                    onPressed: () {
                      setState(() {
                        select = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: select != null,
              child: Row(
                children: [
                  Expanded(
                    child: Text("\$ ${range.start.toInt()}"),
                  ),
                  Expanded(
                    flex: 6,
                    child: RangeSlider(
                      divisions: 3000,
                      min: 1,
                      max: 3000,
                      onChanged: (val) {
                        setState(() {
                          range = val;
                        });
                      },
                      values: range,
                    ),
                  ),
                  Expanded(
                    child: Text("\$ ${range.end.toInt()}"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            (select != null)
                ? umang(
                    category: select!,
                    Productname: select!,
                    min: range.start,
                    max: range.end)
                : Column(children: [
                  umang(category: "SmartPhones", Productname: "smartphones"),
              umang(category: "Laptops", Productname: "laptops"),
              umang(category: "Fragrances", Productname: "fragrances"),
              umang(category: "Skincare", Productname: "skincare"),
              umang(category: "Groceries", Productname: "groceries"),
              umang(
                        category: "Home Decoration",
                        Productname: "home-decoration"),
              umang(category: "Furniture", Productname: "furniture"),
              umang(category: "Tops", Productname: "tops"),
              umang(
                        category: "Womens Dresses",
                        Productname: "womens-dresses"),
              umang(
                        category: "Womens Shoes", Productname: "womens-shoes"),
                    umang(category: "Mens Shirts", Productname: "mens-shirts"),
                    umang(category: "Mens Shoes", Productname: "mens-shoes"),
                    umang(
                        category: "Mens Watches", Productname: "mens-watches"),
                    umang(
                        category: "Womens Watches",
                        Productname: "womens-watches"),
                    umang(category: "Womens Bags", Productname: "womens-bags"),
                    umang(
                        category: "Womens Jewellery",
                        Productname: "womens-jewellery"),
                    umang(category: "Sunglasses", Productname: "sunglasses"),
                    umang(category: "Automotive", Productname: "automotive"),
                    umang(category: "Motorcycle", Productname: "motorcycle"),
                    umang(category: "Lighting", Productname: "lighting"),
                  ]),
          ],
        ),
      ),
    );
  }
}
