import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffolKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffolKey,
      appBar: AppBar(
        title: const Text('Flutter God')
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldkey: scaffolKey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    
    return ListView.builder(
      itemCount: appMenuItems.length ,
      itemBuilder: (BuildContext context, int index) {  
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },

    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap:() {

        // context.pushNamed(CardsScreen.name);
        context.push(menuItem.link);


      },
    );
  }
}