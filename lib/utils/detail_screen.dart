import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'all_product_list.dart';

Widget umang({
  required String category,
  required String Productname,
  double min = 0,
  double max = 3000,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          category,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Builder(builder: (context) {
        double h = MediaQuery.of(context).size.height;
        double w = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...AllProducts.map(
                (e) => (e["category"] == Productname)
                    ? (e['price'] >= min.toInt() && e['price'] <= max.toInt())
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('detail_page', arguments: e);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              height: h * 0.392,
                              width: w * 0.495,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      color: Colors.grey,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                e['thumbnail'],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${e['discountPercentage']} %",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "\$ ${e['price']}",
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          RatingBarIndicator(
                                            rating: e['rating'].toDouble(),
                                            itemBuilder: (context, i) {
                                              return Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              );
                                            },
                                            itemCount: 5,
                                            itemSize: 25,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container()
                    : Container(),
              ).toList(),
            ],
          ),
        );
      }),
    ],
  );
}
