class CustomerReturnModel {
  String? ref;
  String? client;
  String? warehouse;
  String? sale_ref;
  String? status;
  String? total;
  String? paid;
  String? due;
  String? statusPayment;

  CustomerReturnModel(
      {this.ref,
      this.client,
      this.warehouse,
      this.sale_ref,
      this.status,
      this.total,
      this.paid,
      this.due,
      this.statusPayment});

  String? getField(String labelItem) {
    switch (labelItem) {
      case 'Ref':
        return ref;
      case 'Client':
        return client;
      case 'Warehouse':
        return warehouse;
      case 'sale_ref':
        return sale_ref;
      case 'Status':
        return status;
      case 'Total':
        return total;
      case 'Paid':
        return paid;
      case 'Due':
        return due;
      case 'Status Payment':
        return statusPayment;
      default:
        return null;
    }
  }
}

List<String> customerReturnLabel = [
  'Ref',
  'Client',
  'Warehouse',
  'sale_ref',
  'Status',
  'Total',
  'Paid',
  'Due',
  'Status Payment'
];

List<CustomerReturnModel> customerReturnList = [
  CustomerReturnModel(
      ref: '112233223',
      client: '',
      total: '100',
      paid: '0',
      due: '20',
      sale_ref: '22',
      status: 'unpaid',
      statusPayment: 'unpaid',
      warehouse: 'Total Warehouse'),
  CustomerReturnModel(
      ref: '112233223',
      client: '',
      total: '100',
      paid: '0',
      due: '20',
      sale_ref: '22',
      status: 'unpaid',
      statusPayment: 'unpaid',
      warehouse: 'Total Warehouse'),
];
