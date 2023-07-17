import 'package:flutter/material.dart';
import 'package:tiles_app/ui/notes_screens/create_screen.dart';
import 'package:tiles_app/drawer.dart';

import '../../notes_screens/main_screen.dart';
import '../../notes_screens/present_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/presentation_screen': (context) => const PresentatationPage(),
  '/main_screen': (context) => const MainScreen(),
  '/create_screen': (context) => const CreateScreen(),
  '/drawer_screen': (context) => const MyHomePage()
};
