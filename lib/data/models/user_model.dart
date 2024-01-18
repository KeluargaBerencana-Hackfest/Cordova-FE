class UserModel {
  final String id;
  final String name;
  final String email;
  final String birthday;
  final bool gender;
  final int weight;
  final int height;
  final int exercise;
  final int physicalActivity;
  final int sleepHours;
  final bool smoking;
  final bool alcoholConsumption;
  final int sedentaryHours;
  final bool diabetes;
  final bool familyHistory;
  final bool previousHeartProblem;
  final bool medicationUse;
  final String photoProfile;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.birthday,
    required this.gender,
    required this.weight,
    required this.height,
    required this.exercise,
    required this.physicalActivity,
    required this.sleepHours,
    required this.smoking,
    required this.alcoholConsumption,
    required this.sedentaryHours,
    required this.diabetes,
    required this.familyHistory,
    required this.previousHeartProblem,
    required this.medicationUse,
    required this.photoProfile,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      birthday: json['birthday'] ?? "",
      gender: json['gender'] ?? false,
      weight: json['weight'] ?? 0,
      height: json['height'] ?? 0,
      exercise: json['exercise'] ?? 0,
      physicalActivity: json['physical_activity'] ?? 0,
      sleepHours: json['sleep_hours'] ?? 0,
      smoking: json['smoking'] ?? false,
      alcoholConsumption: json['alcohol_consumption'] ?? false,
      sedentaryHours: json['sedentary_hours'] ?? 0,
      diabetes: json['diabetes'] ?? false,
      familyHistory: json['family_history'] ?? false,
      previousHeartProblem: json['previous_heart_problem'] ?? false,
      medicationUse: json['medication_use'] ?? false,
      photoProfile: json['photo_profile'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
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
      'photo_profile': photoProfile,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, birthday: $birthday, gender: $gender, weight: $weight, height: $height, exercise: $exercise, physicalActivity: $physicalActivity, sleepHours: $sleepHours, smoking: $smoking, alcoholConsumption: $alcoholConsumption, sedentaryHours: $sedentaryHours, diabetes: $diabetes, familyHistory: $familyHistory, previousHeartProblem: $previousHeartProblem, medicationUse: $medicationUse, photoProfile: $photoProfile, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
