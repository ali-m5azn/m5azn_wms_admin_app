import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_locations/total_locations_list_view.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/total_orders_list_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final List<ChartData> chartData = [
  ChartData("Delivery Note", "35", Colors.yellow),
  ChartData("RTO", "23", Colors.green),
  ChartData("RVP", "34", Colors.lightGreen),
];

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String _selectedWarehouse = "Warehouse 1";
  final _warehouseList = ["Warehouse 1", "Warehouse 2", "Warehouse 3"];

  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(
          'Total orders', //Empty

          () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TotalOrdersListView()),
              )),
      GridItem(
          'Top-selling products', //Empty
          () => {}),
      GridItem(
          'Customer returns', //Empty

          () => {}),
      GridItem(
          'Total sellers', //Empty

          () => {}),
      GridItem(
          'Shipping orders', //Empty

          () => {}),
      GridItem(
          'Total inventory cost', //Empty
          () => {}),
      GridItem(
          'Expired products', //Empty
          () => {}),
      GridItem(
          'Orders (24 hours)', //Empty
          () => {}),
      GridItem(
          'Total locations', //Empty
          () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TotalLocationsListView()),
              )),
      GridItem(
          'Returns', //Empty
          () => {}),
      GridItem(
          'Orders (48 hours)', //Empty
          () => {}),
      GridItem(
          'QC orders', //Empty
          () => {}),
      GridItem(
          'Total shipping companies', //Empty
          () => {}),
      GridItem(
          'Total products', //Empty
          () => {}),
      GridItem(
          'Inbound', //Empty
          () => {}),
      GridItem(
          'Near expiry products', //Empty
          () => {}),
    ];

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Warehouse",
                  style: TextStyle(fontSize: 2.6.sp),
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _selectedWarehouse,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1.2.sp)),
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedWarehouse = newValue!;
                    });
                  },
                  items: List.generate(
                    _warehouseList.length,
                    (index) => DropdownMenuItem(
                      value: _warehouseList[index],
                      child: Text(_warehouseList[index]),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 4.w),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.w,
                  childAspectRatio: 2.1,
                  mainAxisSpacing: 5.h,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => items[index].onTap(),
                    child: GridTile(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            items[index].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 2.5.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SfCartesianChart(
              isTransposed: true,
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              title: ChartTitle(
                text: "Delivery Note | RTO | RVP",
              ),
              series: <ChartSeries>[
                BarSeries<ChartData, String>(
                  width: 0.05.w,
                  color: const Color(secondaryColor),
                  dataSource: chartData,
                  xValueMapper: (ChartData sales, _) => sales.title,
                  yValueMapper: (ChartData sales, _) =>
                      double.parse(sales.value),
                ),
              ],
            ),
            _charDetailCard(title: "RTO", value: "59.36", percentage: "25"),
            _charDetailCard(title: "RVP", value: "3,65.5", percentage: "25"),
            _charDetailCard(
                title: "Inbound", value: "3,65.5", percentage: "25"),
          ],
        ),
      ),
    );
  }
}

Widget _charDetailCard(
    {required String title,
    required String value,
    required String percentage}) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 2.0.w),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 2.3.sp, fontWeight: FontWeight.w500),
      ),
      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4.w,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            "$percentage%",
            style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

class GridItem {
  final String title;
  final GestureTapCallback onTap;

  GridItem(this.title, this.onTap);
}

class ChartData {
  ChartData(this.title, this.value, this.color);

  final dynamic title;
  final dynamic value;
  final Color color;
}
