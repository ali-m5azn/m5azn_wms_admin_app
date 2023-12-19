import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';
import 'dart:io';

enum PaymentGateway { applePay, vis, master }

class RechargeWalletView extends StatefulWidget {
  const RechargeWalletView({super.key});

  @override
  State<RechargeWalletView> createState() => _RechargeWalletViewState();
}

class _RechargeWalletViewState extends State<RechargeWalletView>
    with SingleTickerProviderStateMixin {
  XFile? receiptImg;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<XFile?> addImage() async {
    XFile? file;
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = XFile(image.path);
    }

    return file;
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
              const ScreenTitle(
                title: "Recharge Wallet",
                showTrailingOptions: false,
              ),
              TabBar(
                labelColor: const Color(secondaryColor),
                indicatorColor: const Color(secondaryColor),
                tabs: const [
                  Tab(
                    text: "Pay with card",
                  ),
                  Tab(
                    text: "Transfer money",
                  ),
                ],
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              SizedBox(
                height: 125.h,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _payWithCardTab(),
                    _transferMoneyTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _payWithCardTab() {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        CustomTxtField(
          borderRadius: 1.5.w,
          fieldTitle: "Amount",
          textInputAction: TextInputAction.next,
          txtController: TextEditingController(),
          hint: "Amount",
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Summary",
                    style: TextStyle(
                        fontSize: 2.4.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.ccVisa,
                        size: 5.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Icon(
                          FontAwesomeIcons.applePay,
                          size: 5.sp,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.ccMastercard,
                        size: 5.sp,
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 0.12.h,
                color: Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Gateway (service charges)",
                    style: TextStyle(
                        fontSize: 2.4.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    "10.00 SAR",
                    style: TextStyle(
                        fontSize: 2.4.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(
                thickness: 0.12.h,
                color: Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 2.4.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4.0.h,
                  ),
                  Text(
                    "50.00 SAR",
                    style: TextStyle(
                        fontSize: 2.4.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(
                thickness: 0.12.h,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Center(
          child: Buttons(
              color: const Color(secondaryColor),
              radius: 1.5.w,
              txtFontSize: 2.0.sp,
              width: 30.w,
              onPressed: () {},
              text: "Add"),
        )
      ],
    );
  }

  Widget _transferMoneyTab() {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        CustomTxtField(
          borderRadius: 1.5.w,
          fieldTitle: "Amount",
          textInputAction: TextInputAction.next,
          txtController: TextEditingController(),
          hint: "Amount",
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomTxtField(
          borderRadius: 1.5.w,
          fieldTitle: "Bank Name",
          textInputAction: TextInputAction.next,
          txtController: TextEditingController(),
          hint: "Bank Name",
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomTxtField(
          borderRadius: 1.5.w,
          fieldTitle: "Account Holder Name",
          textInputAction: TextInputAction.next,
          txtController: TextEditingController(),
          hint: "Account Holder Name",
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomTxtField(
          borderRadius: 1.5.w,
          fieldTitle: "IBAN Number",
          textInputAction: TextInputAction.next,
          txtController: TextEditingController(),
          hint: "IBAN Number",
        ),
        SizedBox(
          height: 5.h,
        ),
        InkWell(
          onTap: () async {
            receiptImg = await addImage();
            setState(() {});
          },
          child: Container(
              width: MediaQuery.of(context)
                  .size
                  .width, // Adjust the width as needed
              height: 40.h, // Adjust the height as needed
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
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Add Receipt Image",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 5.h,
        ),
        Center(
          child: Buttons(
              color: const Color(secondaryColor),
              radius: 1.5.w,
              txtFontSize: 2.0.sp,
              width: 30.w,
              onPressed: () {},
              text: "Submit"),
        )
      ],
    );
  }
}
