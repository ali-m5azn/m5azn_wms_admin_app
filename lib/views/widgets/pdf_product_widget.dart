import 'dart:io';

import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_products/model/product_item_model.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

generateProductPdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      // Set page margin
      margin: const pw.EdgeInsets.all(10),

      // Build the content of the page
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Add header with light blue color
            pw.Container(
              color: PdfColor.fromHex(lightHexColor), // Light blue color
              padding: const pw.EdgeInsets.all(10),
              child: pw.Text(
                'Product List',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),

            // Add the invoice details in table format
            pw.SizedBox(height: 10),
            buildTableProduct(),
          ],
        );
      },
    ),
  );

  final file = File(await getFilePath());
  await file.writeAsBytes(await pdf.save());

  // Open the PDF using open_file package
  await OpenFilex.open(file.path);
}

// Helper function to build the table
pw.Widget buildTableProduct() {
  return pw.Column(children: [
    _buildTableHeader(),
    ...productItemList.map((e) => _buildTableRow(e)),
  ]);
}

pw.Widget _buildTableHeader() {
  return pw.Row(
    children: productLabel.asMap().entries.map((entry) {
      final int index = entry.key;
      final String label = entry.value;
      final double width = contentColumnWidths[index];

      return pw.Container(
        width: width,
        height: 40,
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.black, width: 1),
          color: PdfColors.lightBlue,
        ),
        padding: const pw.EdgeInsets.all(8),
        child: pw.Text(
          label,
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 10.5,
            color: PdfColors.white,
          ),
        ),
      );
    }).toList(),
  );
}

List<double> contentColumnWidths = [50, 80, 80, 80, 50, 50, 50, 50, 60, 60];
// Helper function to build each row in the table
pw.Widget _buildTableRow(ProductItemModel item) {
  return pw.Row(
    children: [
      ...[
        item.type,
        item.name,
        item.code,
        item.category,
        item.cost,
        item.price,
        item.unit,
        item.quantity,
      ].asMap().entries.map((entry) {
        final int index = entry.key;
        final String? value = entry.value;
        final double width = contentColumnWidths[index];

        return pw.Container(
          width: width,
          height: 40,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black, width: 1),
          ),
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(
            value ?? '',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 10.5,
            ),
          ),
        );
      }).toList(),
    ],
  );
}

Future<String> getFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/product_invoice.pdf';
}
