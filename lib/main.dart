import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:knovator/config/constant/app_strings.dart';
import 'package:knovator/config/theme/app_colors.dart';
import 'package:knovator/config/theme/app_themes.dart';
import 'package:knovator/get_it.dart';
import 'package:knovator/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getItSetup();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.background,
      systemNavigationBarDividerColor: AppColors.background,
      systemNavigationBarColor: AppColors.background,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        EasyLoading.instance
          ..indicatorType = EasyLoadingIndicatorType.doubleBounce
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = Colors.yellow
          ..backgroundColor = Colors.green
          ..indicatorColor = Colors.yellow
          ..textColor = Colors.yellow
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = false
          ..dismissOnTap = false;

        return EasyLoading.init(builder: BotToastInit())(context, widget);
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: AppPages.getInitialRoute(),
      onGenerateRoute: AppPages.onGenerateRoute,
      theme: AppThemes.appTheme,
    );
  }
}
