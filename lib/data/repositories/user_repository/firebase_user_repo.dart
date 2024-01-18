import 'package:cordova/data/config/api_config.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final Dio _dio = Dio();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> updateUser(
    String birthday,
    bool gender,
    int weight,
    int height,
    int exercise,
    int physicalActivity,
    int sleepHours,
    bool smoking,
    bool alcoholConsumption,
    int sedentaryHours,
    bool diabetes,
    bool familyHistory,
    bool previousHeartProblem,
    bool medicationUse,
  ) async {
    try {
      final token = _firebaseAuth.currentUser!.getIdToken();

      final response = await _dio.post(
        ApiConfig.updateUser,
        data: {
          'birthday': birthday,
          'gender': gender,
          'weight': weight,
          'height': height,
          'exercise': exercise,
          'physical_activity': physicalActivity,
          'sleep_hours': sleepHours,
          'smoking': smoking,
          'alcohol_consumption': alcoholConsumption,
          'sedentary_hours': sedentaryHours,
          'diabetes': diabetes,
          'family_history': familyHistory,
          'previous_heart_problem': previousHeartProblem,
          'medication_use': medicationUse,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      return response.statusCode == 200;
    } catch (error) {
      print('Error updating user: $error');
      return false;
    }
  }
}
