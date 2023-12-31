class ProductItemModel {
  String? type;
  String? name;
  String? code;
  String? category;
  String? cost;
  String? price;
  String? unit;
  String? brand;
  String? quantity;
  String? status;

  ProductItemModel(
      {this.type,
      this.name,
      this.code,
      this.category,
      this.cost,
      this.price,
      this.unit,
      this.brand,
      this.status,
      this.quantity});

  String? getField(String fieldName) {
    switch (fieldName) {
      case 'type':
        return type;
      case 'name':
        return name;
      case 'code':
        return code;
      case 'category':
        return category;
      case 'Status':
        return cost;
      case 'Total':
        return price;
      case 'Paid':
        return unit;
      case 'Due':
        return quantity;
      default:
        return null;
    }
  }
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
      status: 'Unpaid',
      brand: 'BMW',
      unit: '10'),
  ProductItemModel(
      price: '40.0',
      name: 'Product 1',
      category: 'Product Data',
      code: '8932323',
      cost: '40',
      quantity: '2',
      type: 'Cate',
      status: 'Unpaid',
      brand: 'BMW',
      unit: '10'),
];
