import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String gptKey = dotenv.env['GPT_KEY'] ?? 'No hay api key';

}