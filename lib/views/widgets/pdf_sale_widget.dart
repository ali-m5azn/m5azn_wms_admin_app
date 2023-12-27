import 'dart:io';

import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/model/sale_item_model.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// Helper function to build the table

Future generateOrderPDF() async {
  final pdf = pw.Document();

  // Add a page to the PDF
  pdf.addPage(
    pw.Page(
      // Set page margin
      margin: const pw.EdgeInsets.all(10),

      // Build the content of the page
      build: (pw.Context context1) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Add header with light blue color
            pw.Container(
              color: PdfColor.fromHex(lightHexColor), // Light blue color
              padding: const pw.EdgeInsets.all(10),
              child: pw.Text(
                'Order List',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            // Add the invoice details in table format
            pw.SizedBox(height: 10),
            buildTableSale(),
          ],
        );
      },
    ),
  );

  // Save the PDF as bytes
  final file = File(await getFilePath());
  await file.writeAsBytes(await pdf.save());

  // Open the PDF using open_file package
  await OpenFilex.open(file.path);
}

Future<String> getFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  print('this is >> $directory');
  return '${directory.path}/order_invoice.pdf';
}

pw.Widget buildTableSale() {
  return pw.Column(children: [
    _buildTableHeader(),
    ...saleItemList.map((e) => _buildTableRow(e)),
  ]);
}

pw.Widget _buildTableHeader() {
  return pw.Row(
    children: saleLabelItem.asMap().entries.map((entry) {
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

List<double> contentColumnWidths = [50, 50, 80, 80, 50, 50, 50, 50, 60, 60];
// Helper function to build each row in the table
pw.Widget _buildTableRow(SaleItemModel item) {
  return pw.Row(
    children: [
      ...[
        item.ref,
        item.client,
        item.warehouse,
        item.createdBy,
        item.status,
        item.total,
        item.paid,
        item.due,
        item.paymentStatus,
        item.shippingStatus,
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
