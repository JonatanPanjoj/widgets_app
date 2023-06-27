import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // Wrap similar solo que cuando no hay mas espacio añade otra linea
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.add_alert_rounded), 
              label: const Text('Elevated Icon')
            ),
            FilledButton(onPressed: (){}, child: Text('Filled')),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.wifi_tethering_rounded), 
              label: Text('Filled Icon')
            ),
            OutlinedButton(onPressed: (){}, child: Text('Outline')),
            OutlinedButton.icon(
              onPressed: (){},
              label: const Text('Outlined Icon'),
              icon: const Icon( Icons.account_balance_rounded),
            ),
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.workspaces), 
              label: const Text('Text Icon')
            ),
            const CustomButton(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.add_chart)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add_chart),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
            child: Text(
              'Custom',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}