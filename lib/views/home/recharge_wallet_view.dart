import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class RechargeWalletView extends StatefulWidget {
  const RechargeWalletView({Key? key}) : super(key: key);

  @override
  _RechargeWalletViewState createState() => _RechargeWalletViewState();
}

class _RechargeWalletViewState extends State<RechargeWalletView>
    with SingleTickerProviderStateMixin {
  XFile? receiptImg;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<XFile?> addImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return image != null ? XFile(image.path) : null;
  }

  Widget _buildTextField({
    required String fieldTitle,
    required TextEditingController controller,
    required String hintText,
  }) {
    return CustomTxtField(
      borderRadius: 1.5.w,
      fieldTitle: fieldTitle,
      textInputAction: TextInputAction.next,
      txtController: controller,
      hint: hintText,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 2.4.sp, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 2.4.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 0.12.h,
      color: Colors.black,
    );
  }

  Widget _buildTotalRow(String label, String value) {
    return Column(
      children: [
        _buildInfoRow(label, value),
        _buildDivider(),
      ],
    );
  }

  Widget _buildImagePicker() {
    return InkWell(
      onTap: () async {
        receiptImg = await addImage();
        setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.07),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.black54,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.image,
              color: Colors.black38,
              size: 10.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              Languages.of(context)?.addReceiptImg ?? "",
              style: const TextStyle(
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
      child: Column(
        children: [
          _buildInfoRow(
            Languages.of(context)?.paymentSummary ?? '',
            '',
          ),
          _buildDivider(),
          Row(
            children: [
              Icon(FontAwesomeIcons.ccVisa, size: 5.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Icon(FontAwesomeIcons.applePay, size: 5.sp),
              ),
              Icon(FontAwesomeIcons.ccMastercard, size: 5.sp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentGateway() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
      child: Column(
        children: [
          _buildInfoRow(
            "Payment Gateway (service charges)",
            "10.00 SAR",
          ),
          _buildDivider(),
        ],
      ),
    );
  }

  Widget _buildTotal() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
      child: Column(
        children: [
          _buildTotalRow(
            "Total",
            "50.00 SAR",
          ),
        ],
      ),
    );
  }

  Widget _buildPayWithCardTab() {
    return Column(
      children: [
        SizedBox(height: 5.h),
        _buildTextField(
          fieldTitle: Languages.of(context)?.amount ?? '',
          controller: TextEditingController(),
          hintText: Languages.of(context)?.amount ?? '',
        ),
        SizedBox(height: 2.h),
        _buildPaymentSummary(),
        SizedBox(height: 2.h),
        _buildPaymentGateway(),
        SizedBox(height: 2.h),
        _buildTotal(),
        SizedBox(height: 5.h),
        Center(
          child: Buttons(
            color: const Color(secondaryColor),
            radius: 1.5.w,
            txtFontSize: 2.0.sp,
            width: 30.w,
            onPressed: () {},
            text: Languages.of(context)?.add ?? '',
          ),
        ),
      ],
    );
  }

  Widget _buildTransferMoneyTab() {
    return Column(
      children: [
        SizedBox(height: 5.h),
        _buildTextField(
          fieldTitle: Languages.of(context)?.amount ?? '',
          controller: TextEditingController(),
          hintText: Languages.of(context)?.amount ?? '',
        ),
        SizedBox(height: 5.h),
        _buildTextField(
          fieldTitle: Languages.of(context)?.bankName ?? '',
          controller: TextEditingController(),
          hintText: Languages.of(context)?.bankName ?? '',
        ),
        SizedBox(height: 2.h),
        _buildTextField(
          fieldTitle: Languages.of(context)?.accountHolder ?? '',
          controller: TextEditingController(),
          hintText: Languages.of(context)?.accountHolder ?? '',
        ),
        SizedBox(height: 2.h),
        _buildTextField(
          fieldTitle: Languages.of(context)?.ibanNumber ?? '',
          controller: TextEditingController(),
          hintText: Languages.of(context)?.ibanNumber ?? '',
        ),
        SizedBox(height: 5.h),
        _buildImagePicker(),
        SizedBox(height: 5.h),
        Center(
          child: Buttons(
            color: const Color(secondaryColor),
            radius: 1.5.w,
            txtFontSize: 2.0.sp,
            width: 30.w,
            onPressed: () {},
            text: Languages.of(context)?.submit ?? '',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isRechargeWalletScreen: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenTitle(
                title: Languages.of(context)?.rechargeWallet ?? '',
                showTrailingOptions: false,
              ),
              TabBar(
                tabs: [
                  Tab(text: Languages.of(context)?.payCard ?? ''),
                  Tab(text: Languages.of(context)?.transferMoney ?? ''),
                ],
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              SizedBox(
                height: 125.h,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _buildPayWithCardTab(),
                    _buildTransferMoneyTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
