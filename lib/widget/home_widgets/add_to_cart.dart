import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatefulWidget {
  final Item catalog;

  const AddtoCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = CartModel.cartModel.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();

            _cart.catalog = _catalog;
            _cart.addItems(widget.catalog);
            setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(Icons.add_shopping_cart));
  }
}
