import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
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
          Languages.of(context)?.totalOrders ?? '', //Empty
          '19',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.totalOrders}'),
          icons: Icons.add_shopping_cart),
      // GridItem(
      //     'Top-selling products', //Empty
      //     () => Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const TopSellingProductsPage()))),
      GridItem(
          Languages.of(context)?.customerReturns ?? '', //Empty
          '0',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.returns}',
              arguments: Languages.of(context)?.customerReturns ?? ''),
          icons: Icons.share),
      GridItem(
          Languages.of(context)?.totalSellers ?? '', //Empty
          '13',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.totalSellers}'),
          icons: Icons.group),
      GridItem(
          Languages.of(context)?.shippingOrders ?? '', //Empty
          '0',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.shippingOrders}'),
          icons: Icons.swap_horiz),
      GridItem(
          Languages.of(context)?.totalInventoryCost ?? '', //Empty
          'SAR 326.00',
          () => {},
          icons: Icons.attach_money_outlined),
      GridItem(
          Languages.of(context)?.expiredProducts ?? '',
          '0', //Empty
          () => {},
          icons: Icons.graphic_eq),
      GridItem(
          Languages.of(context)?.order24Hours ?? '', //Empty
          '0',
          () => {},
          icons: Icons.timer),
      GridItem(
          Languages.of(context)?.totalLocations ?? '',
          '14',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.totalLocations}'),
          icons: Icons.map_outlined),
      GridItem(
          Languages.of(context)?.returns ?? '', //Empty
          '0',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.returns}',
              arguments: Languages.of(context)?.returns),
          icons: Icons.share),
      GridItem(
          Languages.of(context)?.order48Hours ?? '',
          '0', //Empty
          () => {},
          icons: Icons.timer),
      GridItem(
          Languages.of(context)?.qcOrders ?? '', //Empty
          '0',
          () => {},
          icons: Icons.list),
      GridItem(
          Languages.of(context)?.backOrders ?? '', //Empty
          '0',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.backOrders}'),
          icons: Icons.lock_clock),
      GridItem(
          Languages.of(context)?.todayOrders ?? '', //Empty
          '0',
          () => {},
          icons: Icons.alarm),
      GridItem(
          Languages.of(context)?.totalProducts ?? '',
          '14',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.allProducts}'),
          icons: Icons.square),
      GridItem(
          Languages.of(context)?.inbound ?? '', //Empty
          '22',
          () => NavigationService.navigateTo(
              '/${Languages.of(context)?.inbound}'),
          icons: Icons.shopping_cart),
      GridItem(
          Languages.of(context)?.nearExpiryProducts ?? '', //Empty
          '0',
          () => {},
          icons: Icons.punch_clock),
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
                  Languages.of(context)?.selectWarehouse ?? '',
                  style: TextStyle(fontSize: 2.6.sp),
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  value:
                      _selectedWarehouse.isNotEmpty ? _selectedWarehouse : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1.2.sp)),
                    ),
                  ),
                  hint: Text(Languages.of(context)?.selectWarehouse ?? ''),
                  icon: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedWarehouse = '';
                          });
                        },
                        child: Icon(Icons.clear),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
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
              margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 1.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.5.w,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 3.h,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => items[index].onTap(),
                    child: GridTile(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 2),
                          child: Row(
                            children: [
                              Icon(
                                items[index].icons,
                                size: 4.5.w,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].title,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 2.6.sp,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        items[index].subtitle,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 2.5.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                  // color: const Color(secondaryColor),
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
                title: Languages.of(context)?.inbound ?? '',
                value: "3,65.5",
                percentage: "25"),
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
  final IconData? icons;
  final String subtitle;
  final GestureTapCallback onTap;

  GridItem(this.title, this.subtitle, this.onTap, {this.icons});
}

class ChartData {
  ChartData(this.title, this.value, this.color);

  final dynamic title;
  final dynamic value;
  final Color color;
}
