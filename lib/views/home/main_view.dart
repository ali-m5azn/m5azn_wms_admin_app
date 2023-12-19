import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
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

  late final List<Widget> _pages = <Widget>[
    const DashboardView(),
    const MenuView()
  ];

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
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(secondaryColor).withOpacity(0.38),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              selectedFontSize: 2.3.sp,
              unselectedFontSize: 2.3.sp,
              showUnselectedLabels: true,
              selectedIconTheme: const IconThemeData(
                color: Color(secondaryColor),
              ),
              selectedItemColor: const Color(secondaryColor),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedIconTheme: const IconThemeData(
                color: Colors.black,
              ),
              unselectedItemColor: Colors.black,
              onTap: (index) => setState(() {
                    _selectedIndex = index;
                  }),
              currentIndex: _selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard", //Empty
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Menu", //Empty
                ),
              ]),
        ),
      ),
    );
  }
}
