import 'package:flutter/material.dart';
import 'package:note_app/presentation/pages/goals_idea/goals_page.dart';
import 'package:note_app/presentation/routes/routes.dart';

import 'config/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      onGenerateRoute: (setting) => Routes.generateRoutes(setting),
      // home: const GoalsPage(),
    );
  }
}
