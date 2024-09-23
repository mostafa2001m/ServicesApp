import 'package:demo_app/core/localization/arabic.dart';
import 'package:demo_app/core/localization/english.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': english,
        'ar': arabic,
      };
}
