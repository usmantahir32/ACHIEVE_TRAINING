import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:training/constants/firebase.dart';
import '../views/pages/auth/subcription/subcription.dart';
import '../views/widgets/custom_snackbar.dart';
import 'auth.dart';

class OTPCont extends GetxController {
  final authCont = Get.find<AuthCont>();

  void otpVerification() async {
    try {
      authCont.isLoading.value = true;
      if (authCont.generatedOTP.value != authCont.userOTP.value) {
        showCustomSnackbar(true, 'OTP Wrong plzz check it!');
      } else {
        // Update Firestore document
        await firestore
            .collection('Users')
            .doc(authCont.userModel.value.id)
            .update({'isVerified': true});

        // Update local UserModel instance
        authCont.userModel.value.isVerified = true;

        showCustomSnackbar(false, 'OTP Verification Success');
        Get.to(() => SubcriptionScreen(), transition: Transition.rightToLeft);
        authCont.isLoading.value = false;
      }
    } catch (e) {
      authCont.isLoading.value = false;
      print(e.toString());
    }
  }
}
