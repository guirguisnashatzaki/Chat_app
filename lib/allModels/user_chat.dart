import 'package:chattingapp/allConstants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChat{
  String id;
  String photoURL;
  String nickname;
  String aboutMe;
  String phoneNumber;

  UserChat({
    required this.id,
    required this.photoURL,
    required this.nickname,
    required this.aboutMe,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.id: id,
      FirestoreConstants.photoUrl: photoURL,
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.phoneNumber: phoneNumber,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {

    String id = "";
    String photoURL = "";
    String nickname = "";
    String aboutMe = "";
    String phoneNumber = "";

    try{
      id = doc.get('id');
    }catch(e){}

    try{
      photoURL = doc.get('photoURL');
    }catch(e){}

    try{
      nickname = doc.get('nickname');
    }catch(e){}

    try{
      aboutMe = doc.get('aboutMe');
    }catch(e){}

    try{
      phoneNumber = doc.get('phoneNumber');
    }catch(e){}


    return UserChat(
      id:id,
      photoURL: photoURL,
      nickname: nickname,
      aboutMe: aboutMe,
      phoneNumber: phoneNumber,
    );
  }
}