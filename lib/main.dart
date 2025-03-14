import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_board_screen/core/base/constants/app_constants.dart';
import 'package:on_board_screen/core/base/init/lang/language_manager.dart';
import 'package:on_board_screen/view/_autthanticate/onboard/view/onboard_view.dart';

//supported local : uygulama hangi dilleri destekleyecek
//biz bu işlerin initinin olması gerektiğini düşünüyoruz init/lang

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // EasyLocalization için gerekli
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocals,
      path: ApplicationConstants.LANG_ASSET_PATH,
      fallbackLocale: const Locale(
        "en",
        "US",
      ), // Eğer hata olursa kullanılacak dil
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deneme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: OnboardView(),
    );
  }
}
