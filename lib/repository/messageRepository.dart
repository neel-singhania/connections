import 'package:connections_inc/models/message.dart';
import 'package:connections_inc/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  final Firestore _firestore;

  MessageRepository({Firestore firestore})
      : _firestore = firestore ?? Firestore.instance;

  Stream<QuerySnapshot> getChats({userId}) {
    return _firestore
        .collection('users')
        .document(userId)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future deleteChat({currentUserId, selectedUserId}) async {
    await _firestore
        .collection('users')
        .document(currentUserId)
        .collection('chats')
        .document(selectedUserId)
        .delete();
  }

  Future<User> getUserDetail({userId}) async {
    User _user = User();

    await _firestore.collection('users').document(userId).get().then((user) {
      _user.uid = user.documentID;
      _user.fname = user['name'];
      _user.avatar = user['photoUrl'];
      _user.age = user['age'];
//      _user.location = user['location'];
      _user.gender = user['gender'];
      _user.interest = user['interest'];
    });
    return _user;
  }

  Future<Message> getLastMessage({currentUserId, selectedUserId}) async {
    Message _message = Message();

    await _firestore
        .collection('users')
        .document(currentUserId)
        .collection('chats')
        .document(selectedUserId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .first
        .then((doc) async {
      await _firestore
          .collection('messages')
          .document(doc.documents.first.documentID)
          .get()
          .then((message) {
        _message.text = message['text'];
        _message.photoUrl = message['photoUrl'];
        _message.timestamp = message['timestamp'];
      });
    });

    return _message;
  }
}
