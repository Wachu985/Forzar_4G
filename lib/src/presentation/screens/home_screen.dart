import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forzar_4g/src/presentation/blocs/theme_cubit/theme_cubit.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const platform = MethodChannel('force4g');
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 20,
              top: 10,
              child: Row(
                children: [
                  IconButton(
                    onPressed: context.read<ThemeCubit>().changeTheme,
                    icon: Icon(
                      context.select((ThemeCubit value) => value.state.darkMode
                          ? Icons.mode_night_rounded
                          : Icons.wb_sunny_rounded),
                      size: 30,
                      color: colors.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push("/about");
                    },
                    icon: Icon(
                      Icons.question_mark_sharp,
                      size: 30,
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => getForce4G(context),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  fixedSize: Size(size.width * 0.4, size.height * 0.05),
                ),
                child: const Text(
                  "Forzar 4G",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getForce4G(BuildContext context) async {
    final cubit = context.read<ThemeCubit>();

    if (!cubit.state.acepted) {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Advertencia",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Al activar esta función para forzar la conexión a 4G, debes ser consciente de que podrías causar daños al dispositivo. Por favor, utiliza esta característica con rigurosidad y bajo tu propia responsabilidad.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    cubit.warningAcepted(false);
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text("Cancelar"),
                ),
                TextButton(
                    onPressed: () {
                      context.pop();
                      cubit.warningAcepted(true);
                    },
                    child: const Text("Continuar"))
              ],
            );
          });
    }
    if (cubit.state.acepted) {
      String successForce4G;
      if (Platform.isAndroid) {
        try {
          successForce4G = await platform.invokeMethod('getforce4g');
        } on PlatformException catch (e) {
          successForce4G = "Fallo al accceder a Ajustes: '${e.message}'.";
        }
      } else {
        successForce4G = 'Esta Funcion no esta Disponible para su Dispositivo';
      }
      debugPrint(successForce4G);
    }
  }
}
