import 'package:catalog_app/core/store.dart';
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
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VxConsumer(
              builder: (BuildContext context, store, VxStatus? status) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(context.theme.accentColor)
                    .make();
              },
              notifications: const {}, mutations: const {RemoveMutation},
            ),
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

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    onPressed: () => RemoveMutation(_cart.items[index]),
                    icon: const Icon(Icons.remove_circle_outline_rounded),
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
