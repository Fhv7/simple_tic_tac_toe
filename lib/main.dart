import 'package:flutter/material.dart';
import 'screens/tictactoe.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // Limiting window size 
    DesktopWindow.setMinWindowSize(const Size(500, 750));
    DesktopWindow.setMaxWindowSize(const Size(1980, 1200));
    DesktopWindow.setWindowSize(const Size(500, 750));
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TicTacToe(),
      },
      // Reescaling for different screen sizes
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1980, name: DESKTOP),
          const ResponsiveBreakpoint.resize(1980, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
    );
  }
}
