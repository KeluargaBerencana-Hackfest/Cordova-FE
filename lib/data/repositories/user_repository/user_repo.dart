abstract class UserRepository {
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
  );
}
