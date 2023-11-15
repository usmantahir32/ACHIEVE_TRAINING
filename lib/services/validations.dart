import 'package:get/get.dart';
import '../constants/firebase.dart';

class ValidationService {
  static String fullName(String val) {
    if (val.isEmpty) {
      return 'Full name is required';
    } else {
      return '';
    }
  }

  static Future<String> emailAddress(String val, bool isUpdate) async {
    if (val.isEmpty) {
      return 'Email address is required';
    } else if (!val.isEmail) {
      return 'Email address is badly formatted';
    } else {
      if (isUpdate) {
        return '';
      } else {
        final _users = await firestore
            .collection('Users')
            .where('Email', isEqualTo: val.trim())
            .get();
        if (_users.docs.isEmpty) {
          return '';
        } else {
          return 'Email address already exists';
        }
      }
    }
  }

  static String loginEmailAddress(String val) {
    if (val.isEmpty) {
      return 'Email address is required';
    } else if (!val.isEmail) {
      return 'Email address is badly formatted';
    } else {
      return '';
    }
  }

  static String password(String val) {
    if (val.isEmpty) {
      return 'Password is required';
    } else if (val.length < 8) {
      return 'Password should be atleast 8 characters';
    } else {
      return '';
    }
  }
}
