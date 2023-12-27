class ProductItemModel {
  String? type;
  String? name;
  String? code;
  String? category;
  String? cost;
  String? price;
  String? unit;
  String? quantity;

  ProductItemModel(
      {this.type,
      this.name,
      this.code,
      this.category,
      this.cost,
      this.price,
      this.unit,
      this.quantity});
}

List<String> productLabel = [
  'type',
  'name',
  'code',
  'category',
  'cost',
  'price',
  'unit',
  'quantity',
];

List<ProductItemModel> productItemList = [
  ProductItemModel(
      price: '40.0',
      name: 'Product 1',
      category: 'Product Data',
      code: '8932323',
      cost: '40',
      quantity: '2',
      type: 'Cate',
      unit: '10'),
  ProductItemModel(
      price: '40.0',
      name: 'Product 1',
      category: 'Product Data',
      code: '8932323',
      cost: '40',
      quantity: '2',
      type: 'Cate',
      unit: '10'),
];
