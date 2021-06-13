import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository{
  final FirebaseAuth _firebaseAuth;
  final Firestore _firestore;


  UserRepository({
    FirebaseAuth firebaseAuth,
    Firestore firestore
}): _firebaseAuth = firebaseAuth?? FirebaseAuth.instance,
  _firestore = firestore ?? Firestore.instance;


  Future<void> signInWithEmail(String email, String password){
   return _firebaseAuth.signInWithEmailAndPassword(
       email: email, password: password);
  }

  Future<bool> isFirstTime(String userId) async{
    bool exist;
    await Firestore.instance.collection('users').document(userId).get().then((user){
      exist= user.exists;
    });

    return exist;
  }


  Future<void> signUpWithEmail(String email, String password) async{
    print(_firebaseAuth);
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }


Future<bool> isSignedIn() async{
    final currentUser = _firebaseAuth.currentUser();
    return currentUser !=null;
}

Future<String> getUser() async{
    return( await  _firebaseAuth.currentUser()).uid;
}

Future<void> avatarSetup(
    File avatar,
    String userId
    )
    async{
      StorageUploadTask storageUploadTask;
      storageUploadTask = FirebaseStorage.instance.ref()
      .child('userAvatar')
      .child(userId)
      .child(userId)
      .putFile(avatar);

      return await storageUploadTask.onComplete.then(
          (ref)async{
            await ref.ref.getDownloadURL().then((url)async{
              await _firestore.collection('users').document(userId).setData({
                "uid" : userId,
                "photourl" : url,

              });
            });
          }
      );
    }

  Future<void> nameSetup(
      String fname,
      String lname,
      String userId
      )
  async{
    return
            await _firestore.collection('users').document(userId).setData({
              "uid" : userId,
              "fname" : fname,
              "lname" : lname,

            });

  }

  Future<void> ageSetup(
      DateTime age,
      GeoPoint location,
      String userId
      )
  async{
    return
      await _firestore.collection('users').document(userId).setData({
        "uid" : userId,
        "age" : age,
        "location" : location,


      });

  }

  Future<void> genderSetup(
      String gender,
      String userId
      )
  async{
    return
      await _firestore.collection('users').document(userId).setData({
        "uid" : userId,
        "gender" : gender,
        });

  }

  Future<void> interestSetup(
      String interest,
      String userId
      )
  async{
    return
      await _firestore.collection('users').document(userId).setData({
        "uid" : userId,
        "interest": interest,

      });

  }

  Future<void> profileSetup(
      File photo,
      String userId,
      String fname,
      String lname,
      String gender,
      String interestedIn,
      DateTime age,
      String partner,
      String personality,
      //GeoPoint location
      ) async {
    StorageUploadTask storageUploadTask;
    storageUploadTask = FirebaseStorage.instance
        .ref()
        .child('userPhotos')
        .child(userId)
        .child(userId)
        .putFile(photo);

    return await storageUploadTask.onComplete.then((ref) async {
      await ref.ref.getDownloadURL().then((url) async {
        await _firestore.collection('users').document(userId).setData({
          'uid': userId,
          'photoUrl': url,
          'fname': fname,
          'lname': lname,
          //"location": location,
          'gender': gender,
          'interestedIn': interestedIn,
          'age': age,
          'personality': personality,
          'partner':partner
        });
      });
    });
  }
}
