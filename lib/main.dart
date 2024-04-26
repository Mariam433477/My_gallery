import 'package:flutter/material.dart';
import 'package:gellary_app/core/bindings.dart';
import 'package:get/get.dart';

import 'core/middleware/app_middleware.dart';
import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routingCallback:(routing)=> checkAuthMiddleware(routing!),
      initialRoute: Routes.initialRoute,
      getPages:Routes.pages,
    );
  }
}

