import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInGoogle() async {
    try {
      // Sign in with Google
      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in to Firebase with Google credentials
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Access Firestore and add user data
      await addUserToFirestore(userCredential.user!);

      return userCredential.user;
    } catch (error) {
      print("Google Sign In Error: $error");
      return null;
    }
  }

  Future<void> addUserToFirestore(User user) async {
    // Get the GoogleSignInAccount to retrieve email
    GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signInSilently();
    String email = googleSignInAccount?.email ?? '';

    // Add user data to Firestore
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': email,
      // Add other user data as needed
    });
  }
}
