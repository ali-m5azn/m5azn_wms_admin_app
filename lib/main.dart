import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/locale_constant.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/home/controller/locale_controller.dart';

import 'consts/localization/localizations_delegate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProviderData = ref.watch(localeProvider);
    print('locale >> ${localeProviderData.locale}');
    return ScreenUtilInit(
      designSize: const Size(70.6, 146.6),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          title: 'M5AZN WMS',
          theme: ThemeData(
            useMaterial3: true,
            dividerColor: Colors.transparent,
            colorScheme: const ColorScheme.light(
              primary: Color(secondaryColor),
            ),
          ),
          locale: localeProviderData.locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          onGenerateRoute: (settings) => generateRoute(settings),
        );
      },
    );
  }
}
