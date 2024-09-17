import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/chat_user.dart';
import '../models/message.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  static late ChatUser me;
  static late SharedPreferences prefx;
  // for checking if user exists or not?
  static Future<bool> userExists() async {
    prefx = await SharedPreferences.getInstance();
    String idKontak = prefx.getString('id_kontak') ?? '';
    return (await firestore.collection('users').doc(idKontak).get()).exists;
  }

  static Future<void> getSelfInfo() async {
    prefx = await SharedPreferences.getInstance();
    String idKontak = prefx.getString('id_kontak') ?? '';
    await firestore.collection('users').doc(idKontak).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        // await getFirebaseMessagingToken();

        //for setting user status to active
        // APIs.updateActiveStatus(true);
        log('My Data: ${user.data()}');
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  static Future<void> createUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idKontak = pref.getString('id_kontak') ?? '';
    String nama = pref.getString('nama') ?? '';
    String email = pref.getString('email') ?? '';
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = ChatUser(
        id: idKontak,
        name: nama,
        email: email,
        about: "",
        image: "",
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken: '');

    return await firestore
        .collection('users')
        .doc(idKontak)
        .set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(param0) {
    return firestore
        .collection('users')
        //because empty list throws an error
        .where('id', isNotEqualTo: param0)
        .snapshots();
  }

  // for updating user information
  static Future<void> updateUserInfo(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idKontak = pref.getString('id_kontak') ?? '';
    await firestore.collection('users').doc(idKontak).update({
      'name': name,
      'about': me.about,
    });
  }

// for getting specific user info
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
      ChatUser chatUser) {
    return firestore
        .collection('users')
        .where('id', isEqualTo: chatUser.id)
        .snapshots();
  }

  // update online or last active status of user
  static Future<void> updateActiveStatus(bool isOnline) async {
    String idKontak = prefx.getString('id_kontak') ?? '';
    firestore.collection('users').doc(idKontak).update({
      'is_online': isOnline,
      'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
      // 'push_token': me.pushToken,
    });
  }
//   static Future<void> updateActiveStatus(bool isOnline) async {
//   try {
//     // Retrieve shared preferences
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     String idKontak = pref.getString('id_kontak') ?? '';

//     if (idKontak.isEmpty) {
//       log('Error: id_kontak is empty. Cannot update status.');
//       return; // Exit if id_kontak is not set
//     }

//     // Update the Firestore document with the new status
//     await firestore.collection('users').doc(idKontak).update({
//       'is_online': isOnline,
//       'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
//       // 'push_token': me.pushToken,
//     });

//     log('User status updated successfully: ${isOnline ? "online" : "offline"}');
//   } catch (e) {
//     log('Error updating user status: $e');
//   }
// }

  // update profile picture of user
  static Future<void> updateProfilePicture(File file) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idKontak = pref.getString('id_kontak') ?? '';
    //getting image file extension
    final ext = file.path.split('.').last;
    log('Extension: $ext');

    //storage file ref with path
    final ref = storage.ref().child('profile_pictures/$idKontak.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });
  }

  ///************** Chat Screen Related APIs **************

  // useful for getting conversation id
  static String getConversationID(String id) {
    String idKontak = prefx.getString('id_kontak') ?? '';
    return int.parse(idKontak) < int.parse(id)
        ? '${idKontak}_$id'
        : '${id}_$idKontak';
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      ChatUser user) {
    return firestore
        // .collection('chats//messages/')
        // .snapshots();
        .collection('chats/${getConversationID(user.id)}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessagesFromId(
      String id) {
    return firestore
        // .collection('chats//messages/')
        // .snapshots();
        .collection('chats/${getConversationID(id)}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
  }

  // for sending message
  static Future<void> sendMessage(String toId, String msg, Type type) async {
    String idKontak = prefx.getString('id_kontak') ?? '';
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toId: toId,
        msg: msg,
        read: '',
        type: type,
        fromId: idKontak,
        sent: time);

    var chatRoomId = getConversationID(toId);
    print(chatRoomId);

    final ref = firestore.collection('chats/$chatRoomId/messages/');
    await ref.doc(time).set(message.toJson());
    // await ref.doc(time).set(message.toJson()).then((value) =>
    //     sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
  }

  //update read status of message
  static Future<void> updateMessageReadStatus(Message message) async {
    var chatRoomId = getConversationID(message.fromId);
    await firestore
        .collection('chats/$chatRoomId/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  //get only last message of a specific chat
  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
      ChatUser user) {
    return firestore
        .collection('chats/${getConversationID(user.id)}/messages/')
        .orderBy('sent', descending: true)
        .limit(1)
        .snapshots();
  }

  //send chat image
  static Future<void> sendChatImage(String toId, File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;

    //storage file ref with path
    var chatRoomId = getConversationID(toId);
    final ref = storage.ref().child(
        'images/$chatRoomId/${DateTime.now().millisecondsSinceEpoch}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    //updating image in firestore database
    final imageUrl = await ref.getDownloadURL();
    await sendMessage(toId, imageUrl, Type.image);
  }
}
