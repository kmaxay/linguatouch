import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';// Import permission_handler package
import 'core/app_export.dart';
import 'dart:convert';


var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  requestPermissions(); // Request necessary permissions
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

Future<void> requestPermissions() async {
  await Permission.storage.request(); // Request storage permission
  // Add more permissions if needed
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'linguatouch',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
