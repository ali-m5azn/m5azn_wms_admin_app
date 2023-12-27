class TotalSellerModel {
  final String? shopName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phone;

  TotalSellerModel(
      {this.shopName, this.lastName, this.username, this.email, this.phone});

  String? getField(String labelItem) {
    switch (labelItem) {
      case 'Shop Name':
        return shopName;
      case 'Last Name':
        return lastName;
      case 'Username':
        return username;
      case 'Email':
        return email;
      case 'Phone':
        return phone;
      default:
        return null;
    }
  }
}

List<String> sellerLabel = [
  'Shop Name',
  'Last Name',
  'Username',
  'Email',
  'Phone',
];

List<TotalSellerModel> totalSellerList = [
  TotalSellerModel(
      shopName: 'zyros',
      phone: '0823443433',
      email: 'syrox@gmail.com',
      lastName: 'syros',
      username: 'zyros'),
  TotalSellerModel(
      shopName: 'zyros',
      phone: '0823443433',
      email: 'syrox@gmail.com',
      lastName: 'syros',
      username: 'zyros'),
];
