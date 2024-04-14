import 'package:flutter/material.dart';
import 'package:forzar_4g/src/core/router/app_router.dart';
import 'package:forzar_4g/src/core/shared_preferences/shared_preferences_singlenton.dart';
import 'package:forzar_4g/src/core/theme/theme_data.dart';
import 'package:forzar_4g/src/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = SharedPreferencesSinglenton();
  await prefs.initPrefs();
  runApp(BlocProvider(
    lazy: false,
    create: (context) => ThemeCubit()..initLoading(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Forzar 4G",
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        darkMode: context.select((ThemeCubit value) => value.state.darkMode),
      ).getTheme(),
      routerConfig: appRouter,
    );
  }
}
