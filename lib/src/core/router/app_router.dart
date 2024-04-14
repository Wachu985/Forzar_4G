import 'package:forzar_4g/src/presentation/screens/about_screen.dart';
import 'package:forzar_4g/src/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "HomeScreen",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/about",
      name: "AboutScreen",
      builder: (context, state) => const AboutScreen(),
    )
  ],
);
