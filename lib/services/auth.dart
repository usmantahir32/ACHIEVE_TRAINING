import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../constants/firebase.dart';
import '../models/user.dart';

class AuthService {
  static Future<void> createUser(UserModel user) async {
    try {
      await firestore.collection('Users').doc(user.id).set({
        'Name': user.name,
        'Email': user.email,
        'fcmToken': '',
        'Photo': user.photo,
        "isSubscribed": false,
        "isVerified": false,
        "gender": '',
        "age": '',
        "phone": '',
        "PaymentDate": DateTime.now().add(const Duration(days: 31)).toString(),
        'Password': user.password,
        'AllowNotifyOrEmails': {"Email": true, "PushNotifications": true},
        'CreatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<void> updateUser(UserModel user) async {
    try {
      await firestore.collection('Users').doc(user.id).update({
        'Name': user.name,
        'phone': user.phone ?? '',
        'gender': user.gender ?? '',
        'age': user.age ?? '',
        'Photo': user.photo,
        'searchKey': user.name!.toLowerCase(),
      });
    } catch (e) {
      //print(e);
    }
  }

  // static Future<void> doPremium(String whichPackage) async {
  //   try {
  //     await _updateWorkPlacePkg(whichPackage);
  //     await firestore.collection('Users').doc(authCont.userID).update({
  //       'WhichPackage': whichPackage,
  //       'isSubscribed': true,
  //     });
  //     await authCont.getUser();
  //     await authCont.getAllWorkPlaceEmployes();
  //     showCustomSnackbar(
  //         false, 'Package successfully subscribed!');
  //   } catch (e) {
  //     //print(e);
  //   }
  // }
  // static Future<void> doPremium() async {
  //   try {
  //     await firestore.collection('Users').doc(authCont.userID).update({
  //       'PaymentDate': DateTime.now().add(const Duration(days: 31)).toString(),
  //       'isSubscribed': true,
  //     });
  //     await authCont.getUser();
  //     Get.back();
  //     showCustomSnackbar(false, 'Package successfully subscribed!');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<void> changeAlertPrefs(bool email, bool notify) async {
  //   try {
  //     authCont.isLoading.value = true;
  //     Map<String, bool> data = {'Email': email, 'PushNotifications': notify};

  //     await firestore
  //         .collection('Users')
  //         .doc(authCont.userID)
  //         .update({'AllowNotifyOrEmails': data});
  //     await authCont.getUser();
  //     authCont.isLoading.value = false;
  //   } catch (e) {
  //     //print(e);
  //   }
  // }

  // static Future<void> _updateWorkPlacePkg(String whichPkg) async {
  //   await FirebaseFirestore.instance
  //       .collection('WorkPlaces')
  //       .doc(authCont.workPlaceID.value)
  //       .update({"WhichPackage": whichPkg, "isSubscribed": true});
  // }
}
