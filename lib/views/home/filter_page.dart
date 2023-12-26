import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class FilterPage extends StatefulWidget {
  final String title;

  const FilterPage({Key? key, required this.title}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _codeProductController = TextEditingController();
  final TextEditingController _productController = TextEditingController();

  String saleValue = '';
  String customerVal = '';
  String warehouseVal = '';
  String statusVal = '';
  String paymentStatusVal = '';
  String shippingStatusVal = '';

  List<String> saleRefList = [
    'SL_1111',
    'SL_2222',
    'SL_3333',
    'SL_4444',
    'SL_5555',
    'SL_6666',
    'SL_7777',
    'SL_8888',
    'SL_9999',
  ];
  List<String> customerList = ['walk-in-customer'];
  List<String> warehouseList = ['Riyadh', 'Jeddah', 'Riyadh Warehouse'];
  List<String> statusList = ['completed', 'Pending', 'Ordered'];
  List<String> paymentStatusList = ['Paid', 'partial', 'UnPaid'];
  List<String> shippingStatusList = [
    'Choose Status',
    'Ordered',
    'Packed',
    'Shipped',
    'Delivered',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: ListView(
          children: [
            ScreenTitle(title: Languages.of(context)?.filter ?? ""),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildTextField(
                labelText: Languages.of(context)?.date ?? "",
                controller: _dateController,
                onTap: () => _selectDate(context),
                suffixIcon: Icons.calendar_today,
              ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildTextField(
                labelText: Languages.of(context)?.reference ?? "",
                controller: _refController,
                onTap: () {},
              ),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildTextField(
                labelText: 'Code Product',
                controller: _codeProductController,
                onTap: () => _selectCodeProduct(context),
              ),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildTextField(
                labelText: Languages.of(context)?.product ?? "",
                controller: _productController,
                onTap: () => _selectProduct(context),
              ),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.category ?? "",
                selectedVal: saleValue,
                dropdownList: saleRefList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    saleValue = newValue!;
                  });
                },
              ),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.brand ?? "",
                selectedVal: saleValue,
                dropdownList: saleRefList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    saleValue = newValue!;
                  });
                },
              ),
            if (widget.title == 'Client returns' ||
                widget.title == Languages.of(context)?.returns)
              _buildSelectionCard(
                labelText: Languages.of(context)?.sale ?? "",
                selectedVal: saleValue,
                dropdownList: saleRefList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    saleValue = newValue!;
                  });
                },
              ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.customer ?? "",
                selectedVal: customerVal,
                dropdownList: customerList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    customerVal = newValue!;
                  });
                },
              ),
            if (widget.title == Languages.of(context)?.totalOrders)
              _buildSelectionCard(
                labelText: Languages.of(context)?.warehouse ?? "",
                selectedVal: warehouseVal,
                dropdownList: warehouseList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    warehouseVal = newValue!;
                  });
                },
              ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.status ?? "",
                selectedVal: statusVal,
                dropdownList: statusList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    statusVal = newValue!;
                  });
                },
              ),
            if (widget.title == Languages.of(context)?.totalOrders)
              _buildSelectionCard(
                labelText: Languages.of(context)?.paymentStatus ?? "",
                selectedVal: paymentStatusVal,
                dropdownList: paymentStatusList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    paymentStatusVal = newValue!;
                  });
                },
              ),
            if (widget.title == Languages.of(context)?.totalOrders)
              _buildSelectionCard(
                labelText: Languages.of(context)?.shippingStatus ?? "",
                selectedVal: shippingStatusVal,
                dropdownList: shippingStatusList,
                onChangedItem: (String? newValue) {
                  setState(() {
                    shippingStatusVal = newValue!;
                  });
                },
              ),
            const SizedBox(height: 15),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    required VoidCallback onTap,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            // labelText: 'Select $labelText',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            suffixIcon: suffixIcon != null
                ? InkWell(
                    onTap: onTap,
                    child: Icon(suffixIcon),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildSelectionCard({
    required String labelText,
    required String selectedVal,
    required Function(String?)? onChangedItem,
    required List<String> dropdownList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 5),
        Card(
          child: Container(
            width: 100.0.w,
            height: 8.0.h,
            padding: const EdgeInsets.all(10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedVal.isNotEmpty ? selectedVal : null,
                onChanged: onChangedItem,
                hint: Text('Choose $labelText'),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  size: 25,
                ),
                items: dropdownList.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Buttons(
            onPressed: () {},
            text: Languages.of(context)?.reset ?? '',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Buttons(
            onPressed: () {},
            color: const Color(secondaryColor),
            text: Languages.of(context)?.filter ?? '',
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked.toString() != _dateController.text) {
      setState(() {
        _dateController.text = picked.toString(); // Format as needed
      });
    }
  }

  Future<void> _selectCodeProduct(BuildContext context) async {
    // Add logic for selecting code product
  }

  Future<void> _selectProduct(BuildContext context) async {
    // Add logic for selecting product
  }
}
