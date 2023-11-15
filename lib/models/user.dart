import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, name, email, fcmToken, photo, createdAt, password;

  //FOR NOTIFICATIONS
  bool? isSubscribed, isVerified, emailNotify, pushNotify;

  DateTime? paymentDate;

  UserModel({
    this.photo,
    this.createdAt,
    this.email,
    this.password,
    this.emailNotify,
    this.pushNotify,
    this.isSubscribed,
    this.isVerified,
    this.paymentDate,
    this.fcmToken,
    this.id,
    this.name,
  });
  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    var permissionsForNotify = doc['AllowNotifyOrEmails'];
    id = doc.id;
    // team=doc['Team'];
    name = doc['Name'];
    password = doc['Password'];

    email = doc['Email'];

    if (doc['PaymentDate'] != null) {
      paymentDate = DateTime.parse(doc['PaymentDate']);
    }

    photo = doc['Photo'];

    fcmToken = doc['fcmToken'];

    emailNotify = permissionsForNotify['Email'];
    pushNotify = permissionsForNotify['PushNotifications'];
    createdAt = doc['CreatedAt'].toString();
    isVerified = doc['isVerified'];
    isSubscribed = doc['isSubscribed'];
  }
}
