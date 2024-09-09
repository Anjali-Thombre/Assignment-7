import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class UserService {
  final String apiUrl = 'https://randomuser.me/api/?results=20';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
