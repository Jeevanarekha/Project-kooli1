// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import './pages/splash_page.dart';
// import './services/navigation_service.dart';
// import './pages/login_page.dart';
// import './providers/authentication_provider.dart';
// import './pages/home_page.dart';
// import './pages/register_page.dart';

// void main() {
//   runApp(
//     SplashPage(
//       key: UniqueKey(),
//       onInitializationComplete: () {
//         runApp(
//           const MainApp(),
//         );
//       },
//     ),
//   );
// }

// class MainApp extends StatelessWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AuthenticationProvider>(
//           create: (BuildContext context) {
//             return AuthenticationProvider();
//           },
//         )
//       ],
//       child: MaterialApp(
//         title: "Project-Kooli1",
//         theme: ThemeData(
//           scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
//           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//             backgroundColor: Color.fromRGBO(36, 35, 37, 1.0),
//           ),
//           colorScheme: const ColorScheme.dark(
//             background: Color.fromRGBO(36, 35, 49, 1.0),
//           ),
//         ),
//         navigatorKey: NavigationService.navigatorKey,
//         initialRoute: '/login',
//         routes: {
//           '/login': (BuildContext context) => const LoginPage(),
//           '/register': (BuildContext context) => RegisterPage(),
//           '/home': (BuildContext context) => HomePage(),
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//Packages
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

//Services
import './services/navigation_service.dart';

//Providers
import './providers/authentication_provider.dart';

//Pages
import './pages/splash_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';
import './pages/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          MainApp(),
        );
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Chatify',
        theme: ThemeData(
          backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => LoginPage(),
          '/register': (BuildContext _context) => RegisterPage(),
          '/home': (BuildContext _context) => HomePage(),
        },
      ),
    );
  }
}
