import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_flutter/core/constant/static_constant.dart';
import 'package:simple_flutter/feature/splash_screen/presentation/splash_screen.dart';
import 'package:simple_flutter/injection_container.dart';
import 'package:simple_flutter/translations/codegen_loader.g.dart';

Future<void> mainInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDepInject();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')],
      assetLoader: CodegenLoader(),
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          return MainApp();
        },
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: StaticConstant.baseUrlDev,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
