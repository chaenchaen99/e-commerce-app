import 'package:flutter/material.dart';
import 'core/theme/theme_data.dart';
import 'data/data_source/mock/display/display.mock_api.dart';
import 'data/repository_impl/display.repository_impl.dart';
import 'domain/usecase/display/display.usecase.dart';
import 'domain/usecase/display/menu/get_menus.usecase.dart';
import 'presentation/pages/main/cubit/mall_type_cubit.dart';
import 'presentation/routes/routes.dart';
import 'service_locator.dart';

void main() async {
  setLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: CustomThemeData.themeData,
    );
  }
}
