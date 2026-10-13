import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Este es un mensaje de notificación'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {
          // Si presiona el botón, también se oculta
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      // Mantenemos la duración por buena práctica
      duration: const Duration(seconds: 2),
    );

    // Muestra el SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Fuerza la desaparición a los 2 segundos pase lo que pase
    Timer(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // No se cierra al tocar fuera
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Este es el contenido del diálogo'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), // Cierra el diálogo
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(), // Cierra el diálogo
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Para poder realizar este proyecto se usaron las siguientes licencias, por favor revisa las licencias de los componentes utilizados dando clic en el botón de licencias View Licenses.'),
                  ],
                );
              },
              child: const Text('Licencias usadas en el proyecto'),
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
