import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/model/sale_item_model.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_sale_widget.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

Future<void> generateOrderExcel() async {
  try {
    // Create a new Excel workbook
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    // Set header row with light blue background color
    for (int col = 0; col < labelItems.length; col++) {
      final String label = labelItems[col];
      final String cellAddress =
          '${String.fromCharCode(col + 65)}1'; // A1, B1, C1, ...

      sheet.getRangeByName(cellAddress).setText(label);
      sheet.getRangeByName(cellAddress).cellStyle.backColorRgb =
          const Color(0xFFADD8E6); // Light blue color
    }

    // Set data rows
    for (int row = 0; row < saleItemList.length; row++) {
      final SaleItemModel item = saleItemList[row];
      for (int col = 0; col < labelItems.length; col++) {
        final String? value = item.getField(labelItems[col]);
        final String cellAddress =
            '${String.fromCharCode(col + 65)}${row + 2}'; // A2, B2, C2, ...

        sheet.getRangeByName(cellAddress).setText(value ?? '');
      }
    }

    final List<int> bytes = workbook.saveAsStream();
    final Uint8List uint8list = Uint8List.fromList(bytes);

    // Save the Excel file
    final File file = File(await getSaleExcel());
    if (await file.exists()) {
      OpenFile.open(file.path);
    } else {
      await file.writeAsBytes(uint8list);
      print('File not found!');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<String> getSaleExcel() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/sale_invoice.xlsx';
}
