import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final bool showTrailingOptions;
  final bool showFilters;

  final VoidCallback? pdfClickCallback;
  final VoidCallback? excelCallback;

  const ScreenTitle(
      {super.key,
      required this.title,
      this.showFilters = true,
      this.pdfClickCallback,
      this.excelCallback,
      this.showTrailingOptions = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              //textAlign: TextAlign.center,
              style: TextStyle(
                // color: const Color(secondaryColor),
                fontSize: 4.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (showTrailingOptions)
            Row(
              children: [
                GestureDetector(
                  onTap: pdfClickCallback,
                  child: Icon(
                    Icons.picture_as_pdf,
                    size: 4.5.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: showFilters ? 2.0.w : 1.0.w),
                  child: GestureDetector(
                    onTap: title != Languages.of(context)?.filter
                        ? () {
                            NavigationService.navigateTo(
                                '/${Languages.of(context)?.filter}',
                                arguments: title);
                          }
                        : null,
                    child: showFilters
                        ? Icon(
                            FontAwesomeIcons.filter,
                            size: 4.5.sp,
                          )
                        : const SizedBox(),
                  ),
                ),
                GestureDetector(
                  onTap: excelCallback,
                  child: Icon(
                    FontAwesomeIcons.fileExcel,
                    size: 4.5.sp,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
