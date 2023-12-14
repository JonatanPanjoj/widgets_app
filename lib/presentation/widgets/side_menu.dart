import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldkey;

  const SideMenu({
    super.key, 
    required this.scaffoldkey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}


//Sería conveniente poder recibir el menu en una lista
class _SideMenuState extends State<SideMenu> {

  //Aquí podríamos usar un gestor de estado para saber cual esta seleccionada
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {

        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldkey.currentState?.closeDrawer();
      },
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(30, hasNotch ? 0 : 15, 16, 5),
          child: const Text('Main'),
        ),

        ...appMenuItems
        .sublist(0,3) //SOLO LOS PRIMEROS 3 ELEMENTOS DEL LISTADO
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
        )
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text('More options'),
        ),

        ...appMenuItems
        .sublist(3) //SOLO LOS PRIMEROS 3 ELEMENTOS DEL LISTADO
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon), 
          label: Text(item.title)
        )
        ),

      ],
    );
  }
}