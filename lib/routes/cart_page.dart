import 'package:catalog_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: "Cart".text.xl.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${_cart.totalPrice}"
                .text
                .xl6
                .color(context.theme.accentColor)
                .make(),
            30.widthBox,
            ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Buying not supported yet.".text.make()));
                    },
                    child: "Buy".text.white.make())
                .w32(context)
          ],
        ).p16());
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    onPressed: () {
                      _cart.removeItems(_cart.items[index]);
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove_circle_outline_rounded),
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
