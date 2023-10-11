import 'package:flutter/services.dart';

class InputFormatter{

static  List<TextInputFormatter>  arabicInputFormatter = [ FilteringTextInputFormatter.allow(RegExp("[0-9\u0621-\u064A ]+")), ];
static List<TextInputFormatter> englishInputFormatter =[FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),];
}