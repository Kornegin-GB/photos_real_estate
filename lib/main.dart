import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photos_real_estate/presentation/application.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Application());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
