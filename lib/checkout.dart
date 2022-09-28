import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_project/card.dart';
import 'package:provider/provider.dart';

class Checout extends StatefulWidget {
  const Checout({Key? key}) : super(key: key);

  @override
  State<Checout> createState() => _ChecoutState();
}

class _ChecoutState extends State<Checout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(builder: (context, cart, widget) => Text("price: ${cart.totalPrice}"),)
        ],
      ),
      body: Consumer<Cart>(
          builder: (context, card, widget) {
            return ListView.builder(

              itemCount: card.itemContainer.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(card.itemContainer[i].name),
                    trailing: IconButton(icon:Icon(Icons.highlight_remove_outlined),onPressed: () {

                      card.remove(card.itemContainer[i]);

                    }, ),
                  );
                });
          }

      ),
    );
  }
}
