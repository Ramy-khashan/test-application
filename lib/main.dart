import 'package:flutter/material.dart';
import 'package:test_application/core/utils/functions/shared_preferance_utils.dart';

import 'random_color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await PreferenceUtils.init();

  runApp(const RandomColor());
}
