import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/config/app_constants.dart';
import 'package:weather_app/config/theme.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/utils/globalFunction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstants.appSettingsBox);
  await Hive.openBox(AppConstants.locationBox);

  runApp(const ProviderScope(child: MyApp()));
}

// ignore: must_be_immutable
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 838),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(AppConstants.appSettingsBox).listenable(),
          builder: (BuildContext context, Box appSettingsBox, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              onGenerateRoute: generatedRoutes,
              navigatorKey: GlobalFunction.navigatorKey,
              initialRoute: Routes.home,
            );
          },
        );
      },
    );
  }
}
