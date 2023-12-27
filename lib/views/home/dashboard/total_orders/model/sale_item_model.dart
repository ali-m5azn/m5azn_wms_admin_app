class SaleItemModel {
  String? ref;
  String? client;
  String? warehouse;
  String? createdBy;
  String? status;
  String? total;
  String? paid;
  String? due;
  String? paymentStatus;
  String? shippingStatus;

  SaleItemModel({
    this.ref,
    this.client,
    this.warehouse,
    this.createdBy,
    this.status,
    this.total,
    this.paid,
    this.due,
    this.paymentStatus,
    this.shippingStatus,
  });

  String? getField(String fieldName) {
    switch (fieldName) {
      case 'Ref':
        return ref;
      case 'Client':
        return client;
      case 'Warehouse':
        return warehouse;
      case 'Created By':
        return createdBy;
      case 'Status':
        return status;
      case 'Total':
        return total;
      case 'Paid':
        return paid;
      case 'Due':
        return due;
      case 'Status Payment':
        return paymentStatus;
      case 'Shipping Status':
        return shippingStatus;
      default:
        return null;
    }
  }
}

List<String> saleLabelItem = [
  'Ref',
  'Client',
  'Warehouse',
  'Created By',
  'Status',
  'Total',
  'Paid',
  'Due',
  'Status Payment',
  'Shipping Status'
];

List<SaleItemModel> saleItemList = [
  SaleItemModel(
      client: '',
      ref: '1927685087',
      createdBy: 'Demo User',
      due: '40.00',
      paid: '0.0',
      paymentStatus: 'unpaid',
      shippingStatus: 'unpaid',
      status: 'completed',
      total: '40.00',
      warehouse: 'Test Warehouse'),
  SaleItemModel(
      client: '',
      ref: '1927685087',
      createdBy: 'Demo User',
      due: '40.00',
      paid: '0.0',
      paymentStatus: 'unpaid',
      shippingStatus: 'unpaid',
      status: 'completed',
      total: '40.00',
      warehouse: 'Test Warehouse'),
];
