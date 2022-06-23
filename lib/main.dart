import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/home_screen.dart';
import 'package:petzarus/screens/welcome_screen.dart';
import 'package:petzarus/services/auth_service.dart';
import 'package:petzarus/utils/create_swatch.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await AuthService.initialize();
  await Future.delayed(const Duration(milliseconds: 1000), () => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );
    return MaterialApp(
      title: 'Petzarus',
      theme: ThemeData(
        primarySwatch: createSwatch(const Color(0xFF007AFF)),
        textTheme: GoogleFonts.sourceSansProTextTheme(textTheme),
      ),
      home: PreferenceBuilder<bool>(
        preference: AuthService.authPreference,
        builder: (context, auth) => auth ? const HomeScreen() : const WelcomeScreen(),
      ),
    );
  }
}
