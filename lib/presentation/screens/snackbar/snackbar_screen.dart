import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('Hola mundo'),
      action: SnackBarAction(label: 'Acción!', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void opendDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('¿Estas Seguro?'),
        content: Text('Magna ullamco tempor aliquip duis cillum duis sunt in excepteur aliquip veniam sunt. Ullamco velit est irure non magna reprehenderit culpa et consectetur dolore qui incididunt. Aliquip non voluptate consectetur officia magna velit do nostrud minim minim incididunt. Nulla et qui amet dolore veniam officia consectetur tempor consectetur nostrud fugiat proident magna.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: Text('Aceptar')),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Minim do nisi laborum tempor ex commodo incididunt culpa est est sunt aliquip. Labore consequat ex duis enim dolor do cillum veniam commodo proident laboris duis cillum ea. Eiusmod reprehenderit minim aute officia pariatur aliquip amet eu culpa ullamco duis occaecat minim commodo. Dolor officia minim minim laborum incididunt.')
                  ]
                );
              }, 
              child: const Text('Licencias Usadas')
            ),
            FilledButton.tonal(
              onPressed: ()=> opendDialog(context), 
              child: const Text('Mostrar Diálogo')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        icon: const Icon(Icons.remove_red_eye_rounded),
        label: const Text('Mostrar Snackbar')
      ),
    );
  }
}