import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:postgen_app/core/constants/app_color.dart';
import 'package:postgen_app/core/manager/language_manager.dart';
import 'product/constant/app_contanst.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  runApp(ProviderScope(
      child: EasyLocalization(
          supportedLocales: LanguageManager.instance.supportedLocales,
          path: LanguageManager.instance.languagePath,
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppConstant.appRouter.config(),
      title: 'PostGen',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.black,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
