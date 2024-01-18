import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/api_config.dart';
import '../../models/cholesterol_model.dart';
import 'cholesterol_repo.dart';

class FirebaseCholesterolRepository implements CholesterolRepository {
  final Dio _dio = Dio();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> checkCholesterol(int triglycerides, int cholesterol,
      String bloodPressure, int heartRate, String cholesterolTestDate) async {
    try {
      final token = _firebaseAuth.currentUser!.getIdToken();

      final response = await _dio.post(
        ApiConfig.getCholesterolHistory,
        data: {
          "triglycerides": triglycerides,
          "cholesterol": cholesterol,
          "blood_pressure": bloodPressure,
          "heart_rate": heartRate,
          "cholesterol_test_date": cholesterolTestDate
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      e.message.toString();
    }
    return false;
  }

  @override
  @override
  Future<CholesterolModel> getCholesterolHistory() async {
    try {
      final token = await _firebaseAuth.currentUser!.getIdToken();

      final response = await _dio.get(
        ApiConfig.getCholesterolHistory,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        final cholesterolModel = CholesterolModel.fromJson(response.data);
        return cholesterolModel;
      } else {
        throw Exception('Failed to fetch cholesterol history');
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw Exception('Failed to fetch cholesterol history');
    }
  }
}
