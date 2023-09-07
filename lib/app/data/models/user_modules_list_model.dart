class UserModulesListModel {
  List<UserModulesModel> userModulesList;
  UserModulesListModel({
    required this.userModulesList,
  });
  factory UserModulesListModel.fromJson(List<dynamic>? json) =>
      UserModulesListModel(
        userModulesList: json == null || json.isEmpty
            ? []
            : json.map((e) => UserModulesModel.fromJson(e)).toList(),
      );
}

class UserModulesModel {
  final int? id;
  final String? title;

  UserModulesModel({
    this.id,
    this.title,
  });

  factory UserModulesModel.fromJson(Map<String, dynamic> json) =>
      UserModulesModel(
        id: json["id"],
        title: json["title"],
      );
}
