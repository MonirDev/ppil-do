import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/data/service/dio_base_service.dart';
import 'package:ppildo/app/theme/app_theme.dart';
import 'package:ppildo/app/utils/constants.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await DioBaseService.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppThemeData.themeData,
    ),
  );
}
