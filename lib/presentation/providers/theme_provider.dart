import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores inmutable
//PROVIDER PARA VALORES INMUTABLES
final colorListProvider = Provider((ref) => colorList);

//Un simple booleano
//stateProvider Mantener una pieza de estado
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  //                     ... Aquí se puede mandar parametros como la semmilla o el modo, dependiendo de la clase
  (ref) => ThemeNotifier(  ),
);

//Controller o Notifier
//Se encarga de mantener el estado de la clase
//El estado es igual a una nueva instancia del AppTheme
class ThemeNotifier extends StateNotifier <AppTheme> {

  //Esto le dice:
  //Necesito que crees la primera instancia de mi AppTheme 
  //Con sus valores por defecto con lo que yo tengo alli
  ThemeNotifier(): super (AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(value){
    state = state.copyWith(selectedColor: value);

  }
}

