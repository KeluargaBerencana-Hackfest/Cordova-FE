class CholesterolModel {
  final String userId;
  final Map<String, List<CholesterolData>> cholesterols;

  CholesterolModel({
    required this.userId,
    required this.cholesterols,
  });

  factory CholesterolModel.fromJson(Map<String, dynamic> json) {
    final Map<String, List<CholesterolData>> cholesterols = {};

    if (json['data'] != null && json['data']['cholesterols'] != null) {
      Map<String, dynamic> cholesterolData = json['data']['cholesterols'];

      cholesterolData.forEach((key, value) {
        List<CholesterolData> data = [];
        for (var entry in value) {
          data.add(CholesterolData.fromJson(entry));
        }
        cholesterols[key] = data;
      });
    }

    return CholesterolModel(
      userId: json['data']['user_id'] ?? "",
      cholesterols: cholesterols,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'user_id': userId,
      'cholesterols': cholesterols.map((key, value) =>
          MapEntry(key, List<dynamic>.from(value.map((e) => e.toJson())))),
    };
    return data;
  }
}

class CholesterolData {
  final int averageCholesterol;
  final int lastCholesterolRecord;
  final String cholesterolLevel;
  final int triglycerides;
  final int heartRate;
  final String bloodPressure;
  final int month;
  final int heartRiskPercentage;
  final String cholesterolTestDate;
  final String createdAt;
  final String updatedAt;

  CholesterolData({
    required this.averageCholesterol,
    required this.lastCholesterolRecord,
    required this.cholesterolLevel,
    required this.triglycerides,
    required this.heartRate,
    required this.bloodPressure,
    required this.month,
    required this.heartRiskPercentage,
    required this.cholesterolTestDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CholesterolData.fromJson(Map<String, dynamic> json) {
    return CholesterolData(
      averageCholesterol: json['average_cholesterol'] ?? 0,
      lastCholesterolRecord: json['last_cholesterol_record'] ?? 0,
      cholesterolLevel: json['cholesterol_level'] ?? "",
      triglycerides: json['triglycerides'] ?? 0,
      heartRate: json['heart_rate'] ?? 0,
      bloodPressure: json['blood_pressure'] ?? "",
      month: json['month'] ?? 0,
      heartRiskPercentage: json['heart_risk_percentage'] ?? 0,
      cholesterolTestDate: json['cholesterol_test_date'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average_cholesterol': averageCholesterol,
      'last_cholesterol_record': lastCholesterolRecord,
      'cholesterol_level': cholesterolLevel,
      'triglycerides': triglycerides,
      'heart_rate': heartRate,
      'blood_pressure': bloodPressure,
      'month': month,
      'heart_risk_percentage': heartRiskPercentage,
      'cholesterol_test_date': cholesterolTestDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
