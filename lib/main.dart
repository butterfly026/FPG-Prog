import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/main_bindings.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, themeNotifier, child) {
      return ScreenUtilInit(
        designSize: const Size(540, 960),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'FPG-t002',
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            getPages: routes,
            theme: AppTheme.lightTheme, // Use light theme
            darkTheme: AppTheme.darkTheme, // Use dark theme
            themeMode: ThemeMode.system,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            initialBinding: MainBindings(),
          );
        },
      );
    });
  }
}
