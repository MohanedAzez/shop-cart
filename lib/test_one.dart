import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_project/card.dart';
import 'package:flutter_provider_project/item.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';

class TestOne extends StatefulWidget {
  const TestOne({Key? key}) : super(key: key);

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  List<Item> item = [
    Item(name: "S20", price: 20),
    Item(name: "S30", price: 30),
    Item(name: "S40", price: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart App"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Checout()));
                  },
                  icon: Icon(Icons.add_shopping_cart_outlined)),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text(cart.count.toString());
                  },
                ),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Consumer<Cart>(builder: (context, card, child) {

            return ListTile(
              title: Text("Name : ${item[index].name}"),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  card.add(item[index]);
                },
              ),
            );
          });
        },
      ),
    );
  }
}
