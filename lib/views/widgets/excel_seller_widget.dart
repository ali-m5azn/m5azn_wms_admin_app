import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

Future<void> generateSellerExcel(
    List label, List items, String fileName) async {
  // Create a new Excel workbook
  final Workbook workbook = Workbook();

  // Access the default sheet
  final Worksheet sheet = workbook.worksheets[0];

  // Add header row with light blue background color
  for (int col = 0; col < label.length; col++) {
    final String labelItem = label[col];
    sheet.getRangeByIndex(1, col + 1).setText(labelItem);
    sheet.getRangeByIndex(1, col + 1).cellStyle.backColorRgb =
        const Color(0xFFADD8E6);
  }

  // Set data rows
  for (int row = 0; row < items.length; row++) {
    final item = items[row];
    for (int col = 0; col < label.length; col++) {
      final String? value = item.getField(label[col]);
      sheet.getRangeByIndex(row + 2, col + 1).setText(value ?? '');
    }
  }

  final List<int> bytes = workbook.saveAsStream();
  final Uint8List uint8list = Uint8List.fromList(bytes);

  // Save the Excel file
  final File file = File(await getSellerExcel(fileName));
  await file.writeAsBytes(uint8list);
  OpenFilex.open(file.path);
  // if (await file.exists()) {
  //   workbook.dispose(); // Release resources
  //   OpenFilex.open(file.path);
  // } else {
  //   final List<int> bytes = workbook.saveAsStream();
  //   final Uint8List uint8list = Uint8List.fromList(bytes);
  //   await file.writeAsBytes(uint8list);
  //   workbook.dispose(); // Release resources
  //   OpenFilex.open(file.path);
  // }
}

Future<String> getSellerExcel(String fileName) async {
  print('this is>>> $fileName');
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/$fileName';
}
