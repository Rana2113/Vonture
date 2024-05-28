import 'package:hive/hive.dart';

String? token = '';
String? id = '';
const kTokenBoxString = 'token';
var kIdBoxString = 'id';
var kTokenBox = Hive.box(kTokenBoxString);
var kIdBox = Hive.box(kIdBoxString);
