
import 'package:intl/intl.dart';

extension StringExtension on String {
  String get splitByFirst {
    
    return this.split(' ')[0];
  }
  String get splitBySecond {
    
    return this.split(' ')[1];
  }
}