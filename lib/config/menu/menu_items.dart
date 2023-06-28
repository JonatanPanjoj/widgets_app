import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem> [
  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_sharp,
  ),
  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'General y controlados', 
    link: '/progress', 
    icon: Icons.local_cafe_rounded,
  ),
  MenuItem(
    title: 'Snackbars y diálogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info,
  ),
  MenuItem(
    title: 'Animated container', 
    subTitle: 'Stateful Widget Animado', 
    link: '/animated', 
    icon: Icons.all_inclusive_rounded,
  ),
  MenuItem(
    title: 'UI Controls + Tiles', 
    subTitle: 'Controles de UI', 
    link: '/ui-controls', 
    icon: Icons.check_box_outlined,
  ),
  MenuItem(
    title: 'Tutorial', 
    subTitle: 'Tutorial de la aplicación', 
    link: '/tutorial', 
    icon: Icons.drag_indicator_sharp,
  ),
];