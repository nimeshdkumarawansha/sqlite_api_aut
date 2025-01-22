import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke';

  Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'API_Body': [
            {
              'Unique_Id': '',
              'Pw': password,
            }
          ],
          'Api_Action': 'GetUserData',
          'Company_Code': username,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['Status_Code'] == 200 && data['Response_Body'].isNotEmpty) {
          return User.fromJson(data['Response_Body'][0]);
        }
      }
      return null;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}
