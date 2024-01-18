class ActivityModel {
  final int id;
  final String userId;
  final String activity;
  final String description;
  final int totalSubActivity;
  final int finishedSubActivity;
  final bool isDone;
  final String image;
  final List<SubActivity> subActivities;
  final String createdAt;
  final String updatedAt;

  ActivityModel({
    required this.id,
    required this.userId,
    required this.activity,
    required this.description,
    required this.totalSubActivity,
    required this.finishedSubActivity,
    required this.isDone,
    required this.image,
    required this.subActivities,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    final List<SubActivity> subActivitiesList = [];
    if (json['sub_activities'] != null) {
      Map<String, dynamic> subActivities = json['sub_activities'];
      subActivities.forEach((key, value) {
        if (value != null && value is List) {
          for (var entry in value) {
            subActivitiesList.add(SubActivity.fromJson(entry));
          }
        }
      });
    }

    return ActivityModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? "",
      activity: json['activity'] ?? "",
      description: json['description'] ?? "",
      totalSubActivity: json['total_sub_activity'] ?? 0,
      finishedSubActivity: json['finished_sub_activity'] ?? 0,
      isDone: json['is_done'] ?? false,
      image: json['image'] ?? "",
      subActivities: subActivitiesList,
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'user_id': userId,
      'activity': activity,
      'description': description,
      'total_sub_activity': totalSubActivity,
      'finished_sub_activity': finishedSubActivity,
      'is_done': isDone,
      'image': image,
      'sub_activities':
          subActivities.map((subActivity) => subActivity.toJson()).toList(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    return data;
  }
}

class SubActivity {
  final int id;
  final int activityId;
  final String subActivity;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isDone;
  final String image;
  final String createdAt;
  final String updatedAt;

  SubActivity({
    required this.id,
    required this.activityId,
    required this.subActivity,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isDone,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubActivity.fromJson(Map<String, dynamic> json) {
    return SubActivity(
      id: json['id'] ?? 0,
      activityId: json['activity_id'] ?? 0,
      subActivity: json['sub_activity'] ?? "",
      description: json['description'] ?? "",
      ingredients: List<String>.from(json['ingredients'] ?? []),
      steps: List<String>.from(json['steps'] ?? []),
      duration: json['duration'] ?? 0,
      isDone: json['is_done'] ?? false,
      image: json['image'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'activity_id': activityId,
      'sub_activity': subActivity,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'is_done': isDone,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    return data;
  }
}
