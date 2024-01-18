abstract class CholesterolRepository {
  Future<void> getCholesterolHistory();

  Future<bool> checkCholesterol(int triglycerides, int cholesterol,
      String bloodPressure, int heartRate, String cholesterolTestDate);
}
