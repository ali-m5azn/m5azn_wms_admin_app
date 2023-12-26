import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/dashboard_view.dart';
import 'package:m5azn_app_wms/views/home/menu/menu_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = <Widget>[const DashboardView(), MenuView()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: customAppBar(context: context),
        drawerEdgeDragWidth: 0,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: SafeArea(child: _pages.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            selectedFontSize: 2.3.sp,
            unselectedFontSize: 2.3.sp,
            showUnselectedLabels: true,
            // selectedItemColor: const Color(secondaryColor),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedIconTheme: const IconThemeData(
              color: Colors.black,
            ),
            unselectedItemColor: Colors.black,
            onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard),
                label: Languages.of(context)?.dashboard ?? "", //Empty
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.menu),
                label: Languages.of(context)?.menu ?? "", //Empty
              ),
            ]),
      ),
    );
  }
}
