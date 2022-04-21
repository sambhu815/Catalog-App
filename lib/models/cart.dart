import 'package:catalog_app/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

//catalog field
  late CatalogModel _catalog;

  //Collection of Ids- store ids of all items
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel catalogModel) {
    _catalog = catalogModel;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add Item
  void addItems(Item item) => _itemIds.add(item.id);

  //remove Item
  void removeItems(Item item) => _itemIds.remove(item.id);
}
