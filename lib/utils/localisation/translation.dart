import 'package:fixit/utils/localisation/translation/arabic.dart';
import 'package:fixit/utils/localisation/translation/english.dart';
import 'package:fixit/utils/localisation/translation/french.dart';
import 'package:get/get.dart';

class Translation extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
    'fr': fr
  };
}