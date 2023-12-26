class LoginResponse {
  String? m5aznToken;
  String? username;
  bool? status;
  String? userId;
  String? avatar;
  String? message;

  LoginResponse({this.m5aznToken, this.username, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    m5aznToken = json['m5azn_token'];
    username = json['username'];
    status = json['status'];
    userId = json['user_id'] is String
        ? json['user_id']
        : json['user_id'].toString();
    avatar = json['avatar'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['m5azn_token'] = m5aznToken;
    data['username'] = username;
    data['status'] = status;
    data['message'] = message;
    data['user_id'] = userId;
    data['avatar'] = avatar;
    return data;
  }
}
