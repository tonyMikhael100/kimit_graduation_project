import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  GlobalKey<FormState> signUpKey = GlobalKey();
  String signUpName = '';
  String signUpemail = '';
  String signUpPassowrd = '';
  String signInPassword = '';
  String signInemail = '';
  String homeName = '';
  String homeImage = '';
  String homeEmail = '';
  String? imageUrl;
  CollectionReference? users;

  void chooseImageAndUploadInCloudStorage() async {
    emit(AuthLoadingState());
    final ImagePicker picker = ImagePicker();

// Pick an image.
    var image = await picker.pickImage(source: ImageSource.gallery);
    FirebaseStorage storage = FirebaseStorage.instanceFor(
        bucket: 'gs://graduation-project-52094.appspot.com');
    if (image == null) {
      emit(AuthImageUploadedState());
      return null;
    } else {
      final storageRef = FirebaseStorage.instance.ref().child(image!.name);
      await storageRef.putFile(File(image.path));
      imageUrl = await storageRef.getDownloadURL();
      print(imageUrl);
      emit(AuthImageUploadedState());
    }
  }

  void signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpemail,
        password: signUpPassowrd,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      //add user information to firestore
      users = FirebaseFirestore.instance.collection('users');
      users!
          .add({
            'name': signUpName,
            'email': signUpemail,
            'password': signUpPassowrd,
            'image': imageUrl,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      emit(AuthSignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthSignUpFailState(errMsg: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthSignUpFailState(errMsg: 'email already in use'));
      } else {
        emit(AuthSignUpFailState(errMsg: 'enter valid email'));
      }
    } catch (e) {
      print(e);
    }
  }

  void signIn() async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInemail,
        password: signInPassword,
      );
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        emit(AuthSignInSuccessState());
      } else {
        emit(AuthSignInFailState(errMsg: 'please verify your email'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthSignInFailState(errMsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthSignInFailState(errMsg: 'wrong password.'));
      }
    }
  }

  void getUserInformation() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email',
            isEqualTo: signInemail) // Assuming signUpName is already defined
        .get();
    // This will loop through all documents returned by the query
    for (var doc in querySnapshot.docs) {
      var userName = doc.data()['name'];
      // Get the 'name' field from each document
      var userEmail = doc.data()['email'];
      var userImage = doc.data()['image'];
      homeName = userName;
      homeImage = userImage;
      homeEmail = userEmail;
      // log(userName); // Log the name
      // log(userImage); // Log the name
      // log(userEmail); // Log the email
    }
    emit(AuthSignInSuccessState());
  }
}
