// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GmailSignUpController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<void> signUpWithGoogle() async {
//     try {
//       // Initialize Firebase if not already initialized
//       // await Firebase.initializeApp();

//       // Trigger Google Sign-In
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         // User cancelled the sign-in process
//         return;
//       }

//       // Obtain GoogleSignInAuthentication to authenticate with Firebase
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // Create a new credential using the GoogleSignInAuthentication
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in with the credential to Firebase
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);

//       // Access the FirebaseUser object from the UserCredential
//       final User? user = userCredential.user;

//       if (user != null) {
//         // User signed in successfully
//         print('User signed in with Google: ${user.displayName}');
//         // You can save user data or navigate to the next screen here
//       } else {
//         // Failed to sign in
//         print('Failed to sign in with Google.');
//       }
//     } catch (e) {
//       print('Error during Google sign-in: $e');
//     }
//   }
// }
