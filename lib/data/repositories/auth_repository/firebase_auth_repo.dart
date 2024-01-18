import 'package:cordova/data/config/api_config.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repo.dart';

class FirebaseAuthRepository implements AuthRepository {
  final Dio _dio = Dio();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signUp(String name, String email, String password,
      String confirmPassword) async {
    try {
      final response = await _dio.post(ApiConfig.signUp, data: {
        "name": name,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword
      });
      if (response.statusCode == 200) {}
    } catch (error) {
      throw Exception("Error at Sign Up ${error.toString()}");
    }
  }

  @override
  Future<void> signInWithEmailAndPasswordRepository(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final token = await _firebaseAuth.currentUser!.getIdToken();

      final response = await _dio.post(
        ApiConfig.signIn,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      print(response.data);
      print("daaaaaaaa");
      print(response.statusCode);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException during sign in: ${e.message}");
      throw Exception("Error during sign in with email and password");
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final token = await _firebaseAuth.currentUser!.getIdToken();

      final response = await _dio.post(
        ApiConfig.signIn,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      print(response);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException during sign in with Google: ${e.message}");
      throw Exception("Error during sign in with Google");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("Error during log out: ${e.toString()}");
      throw Exception("Error during log out");
    }
  }
}
