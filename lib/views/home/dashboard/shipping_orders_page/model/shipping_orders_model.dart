class ShippingOrderModel {
  String? date;
  String? shipment_ref;
  String? sale_ref;
  String? customer;
  String? warehouse;
  String? status;

  ShippingOrderModel(
      {this.date,
      this.shipment_ref,
      this.sale_ref,
      this.customer,
      this.warehouse,
      this.status});

  String? getField(String labelItem) {
    switch (labelItem) {
      case 'Date':
        return date;
      case 'Shipment Ref':
        return shipment_ref;
      case 'Sale Ref':
        return sale_ref;
      case 'Customer':
        return customer;
      case 'Warehouse':
        return warehouse;
      case 'Status':
        return status;
      default:
        return null;
    }
  }
}

List<String> shippingOrderLabel = [
  'Date',
  'Shipment Ref',
  'Sale Ref',
  'Customer',
  'Warehouse',
  'Status'
];

List<ShippingOrderModel> shippingOrderList = [
  ShippingOrderModel(
      date: '2023-12-19 12:57:33',
      shipment_ref: 'SM_1111',
      sale_ref: '8232789443',
      customer: '',
      warehouse: 'Riyadh',
      status: 'ordered')
];
