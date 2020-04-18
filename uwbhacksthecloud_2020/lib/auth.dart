import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'globals.dart';

class AuthService {
  FirebaseUser globalUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Observable<FirebaseUser> user; // firebase user
  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  PublishSubject loading = PublishSubject();

  // constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return databaseReference
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }

  // handles bringing up of google sign in pop-up if user hasn't signed in already
  // if user already has an account within the database, then it remembers user
  // handles keeping user signed in
  // handles giving firebase credentials to the user so they can store things in the back end
  Future<FirebaseUser> googleSignIn() async {
    // Start
    loading.add(true);

    // Step 1
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();


    // Step 2
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    globalUser = user;

    // Step 3
    updateUserData(user);

    print('uid: ' + user.uid);

    // Done
    loading.add(false);
    print("signed in " + user.displayName);
    return user;
  }

  // updates user data in real time
  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = databaseReference.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  FirebaseUser getUser(){
    return globalUser;
  }

  // handles signing out of the user
  void signOut() {
    _auth.signOut();
  }


}

final AuthService authService = AuthService();