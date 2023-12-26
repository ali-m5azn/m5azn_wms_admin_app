import 'dart:io';
import 'dart:typed_data';

import 'package:m5azn_app_wms/views/home/dashboard/total_products/model/product_item_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'pdf_product_widget.dart';

Future<void> generateProductExcel() async {
  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];

  // Set header row
  for (int col = 0; col < labelItems.length; col++) {
    final String label = labelItems[col];
    sheet.getRangeByIndex(1, col + 1).setText(label);
    sheet.getRangeByIndex(1, col + 1).cellStyle.backColor =
        '#ADD8E6'; // Light blue color

    // Set the width and height for a specific column and row
    sheet.getRangeByIndex(1, col + 1).columnWidth =
        15; // Set width for column A
    sheet.getRangeByIndex(1, col + 1).rowHeight = 20; // Set height for row 1
  }

  // Populate data rows
  for (int row = 0; row < productItemList.length; row++) {
    final ProductItemModel item = productItemList[row];
    for (int col = 0; col < labelItems.length; col++) {
      final String? value = getValueByIndex(item, col);
      sheet.getRangeByIndex(row + 2, col + 1).setText(value ?? '');
    }
  }

  // Save the workbook
  final List<int> bytes = workbook.saveAsStream();
  final Uint8List uint8list = Uint8List.fromList(bytes);

  // Save the Excel file
  final File file = File(await getProductExcel());
  if (await file.exists()) {
    OpenFile.open(file.path);
  } else {
    await file.writeAsBytes(uint8list);
    print('File not found!');
  }
}

Future<String> getProductExcel() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/product_invoice.xlsx';
}

String? getValueByIndex(ProductItemModel item, int index) {
  switch (index) {
    case 0:
      return item.type;
    case 1:
      return item.name;
    case 2:
      return item.code;
    case 3:
      return item.category;
    case 4:
      return item.cost;
    case 5:
      return item.price;
    case 6:
      return item.unit;
    case 7:
      return item.quantity;
    default:
      return null;
  }
}
