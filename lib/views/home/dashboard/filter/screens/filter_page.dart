import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/filter/controller/filter_providers.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class FilterPage extends ConsumerStatefulWidget {
  final String title;

  const FilterPage({Key? key, required this.title}) : super(key: key);

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  List<String> saleRefList = [
    'SL_1111',
    'SL_2222',
    'SL_3333',
    'SL_4444',
    'SL_5555',
    'SL_6666',
    'SL_7777',
    'SL_8888',
    'SL_9999'
  ];
  List<String> brandRefList = ['Test Brand', 'New Brand', 'Suhail'];
  List<String> customerList = ['walk-in-customer'];
  List<String> warehouseList = ['Riyadh', 'Jeddah', 'Riyadh Warehouse'];
  List<String> statusList = ['completed', 'Pending', 'Ordered'];
  List<String> paymentStatusList = ['Paid', 'partial', 'UnPaid'];
  List<String> shippingStatusList = [
    'Ordered',
    'Packed',
    'Shipped',
    'Delivered',
    'Cancelled'
  ];

  @override
  Widget build(BuildContext context) {
    //_dateController.text = ref.watch(filterProvider).dateVal;
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: ListView(
          children: [
            ScreenTitle(
              title: Languages.of(context)?.filter ?? "",
              showTrailingOptions: false,
            ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildTextField(
                labelText: Languages.of(context)?.date ?? "",
                controller: TextEditingController(
                    text: ref.watch(filterProvider).dateVal),
                onTap: () => _selectDate(context),
                suffixIcon: Icons.calendar_today,
              ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildTextField(
                  labelText: Languages.of(context)?.reference ?? "",
                  controller: TextEditingController(
                      text: ref.watch(filterProvider).referenceVal),
                  onChanged: (value) {
                    ref.watch(filterProvider.notifier).changeReference(value);
                  }),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildTextField(
                  labelText: 'Code Product',
                  controller: TextEditingController(
                      text: ref.watch(filterProvider).codeProductVal),
                  onChanged: (value) {
                    ref
                        .watch(filterProvider.notifier)
                        .changeCodeProductRef(value);
                  }),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildTextField(
                  labelText: Languages.of(context)?.product ?? "",
                  controller: TextEditingController(
                      text: ref.watch(filterProvider).productVal),
                  onChanged: (value) {
                    ref.watch(filterProvider.notifier).changeProduct(value);
                  }),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.category ?? "",
                selectedVal: ref.watch(filterProvider).categoryVal,
                dropdownList: saleRefList,
                onChangedItem: (String? newValue) =>
                    ref.watch(filterProvider.notifier).changeCatRef(newValue),
              ),
            if (widget.title == Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.brand ?? "",
                selectedVal: ref.watch(filterProvider).brandVal,
                dropdownList: brandRefList,
                onChangedItem: (String? newValue) =>
                    ref.watch(filterProvider.notifier).changeBrandRef(newValue),
              ),
            if (widget.title == 'Client returns' ||
                widget.title == Languages.of(context)?.returns)
              _buildSelectionCard(
                labelText: Languages.of(context)?.sale ?? "",
                selectedVal: ref.watch(filterProvider).saleVal,
                dropdownList: saleRefList,
                onChangedItem: (String? newValue) =>
                    ref.watch(filterProvider.notifier).changeSaleRef(newValue),
              ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.customer ?? "",
                selectedVal: ref.watch(filterProvider).customerVal,
                dropdownList: customerList,
                onChangedItem: (String? newValue) => ref
                    .watch(filterProvider.notifier)
                    .changeCustomerRef(newValue),
              ),
            if (widget.title == Languages.of(context)?.totalOrders)
              _buildSelectionCard(
                labelText: Languages.of(context)?.warehouse ?? "",
                selectedVal: ref.watch(filterProvider).warehouseVal,
                dropdownList: warehouseList,
                onChangedItem: (String? newValue) => ref
                    .watch(filterProvider.notifier)
                    .changeWarehouseRef(newValue),
              ),
            if (widget.title != Languages.of(context)?.allProducts)
              _buildSelectionCard(
                labelText: Languages.of(context)?.status ?? "",
                selectedVal: ref.watch(filterProvider).statusVal,
                dropdownList: statusList,
                onChangedItem: (String? newValue) => ref
                    .watch(filterProvider.notifier)
                    .changeStatusRef(newValue),
              ),
            if (widget.title == Languages.of(context)?.totalOrders)
              _buildSelectionCard(
                labelText: Languages.of(context)?.paymentStatus ?? "",
                selectedVal: ref.watch(filterProvider).paymentStatusVal,
                dropdownList: paymentStatusList,
                onChangedItem: (String? newValue) => ref
                    .watch(filterProvider.notifier)
                    .changePaymentStatusRef(newValue),
              ),
            if (widget.title == Languages.of(context)?.totalOrders)
              _buildSelectionCard(
                labelText: Languages.of(context)?.shippingStatus ?? "",
                selectedVal: ref.watch(filterProvider).shippingStatusVal,
                dropdownList: shippingStatusList,
                onChangedItem: (String? newValue) => ref
                    .watch(filterProvider.notifier)
                    .changeShippingStatusRef(newValue),
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
    VoidCallback? onTap,
    IconData? suffixIcon,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: const TextStyle(fontSize: 16.0)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            suffixIcon: suffixIcon != null
                ? InkWell(onTap: onTap, child: Icon(suffixIcon))
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
        Text(labelText, style: const TextStyle(fontSize: 16.0)),
        const SizedBox(height: 5),
        Card(
          child: Container(
            width: 100.0.w,
            height: 8.0.h,
            padding: const EdgeInsets.all(10),
            child: DropdownButtonHideUnderline(
              child: _buildDropdownButton(
                selectedVal: selectedVal,
                label: labelText,
                onChangedItem: onChangedItem,
                dropdownList: dropdownList,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  @override
  void deactivate() {
    // TODO: implement dispose
    ref.invalidate(filterProvider);
    super.deactivate();
  }

  Widget _buildDropdownButton({
    required String selectedVal,
    required String label,
    required Function(String?)? onChangedItem,
    required List<String> dropdownList,
  }) {
    return DropdownButton<String>(
      value: selectedVal.isNotEmpty ? selectedVal : null,
      onChanged: onChangedItem,
      hint: Text('Choose ${dropdownList.isNotEmpty ? label : ""}'),
      icon: const Icon(Icons.arrow_drop_down_circle_sharp, size: 25),
      items: dropdownList.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
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
        const SizedBox(width: 20),
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

    if (picked != null) {
      ref
          .watch(filterProvider.notifier)
          .changeDateRef(DateFormat('dd/MM/yyyy').format(picked));
      // return DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
