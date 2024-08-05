import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UsersService {
  final String baseUrl;

  UsersService({required this.baseUrl});

  //user verilerini çekmek için;
  Future<UsersModel?> fetchUsers(int page) async {
    final response = await http.get(Uri.parse('URL YAZ BURAYA'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return UsersModel.fromJson(json);
    } else {
      throw Exception('Kullanıcılar yüklenemedi.');
    }
  }

  // yeni bir kullanıcı eklemek için kullanacağım fonksiyon
  Future<UsersModelData?> createUser(UsersModelData user) async {
    final response = await http.post(
      Uri.parse('URL'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return UsersModelData.fromJson(json);
    } else {
      throw Exception('Kullanıcı oluşturulamadı :(');
    }
  }

  //kullanıcı güncellemesinde kullanacağım fonk:
  Future<UsersModelData?> updateUser(int id, UsersModelData user) async {
    final response = await http.put(
      Uri.parse('URLLLL'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return UsersModelData.fromJson(json);
    } else {
      throw Exception('Kullanıcı güncellenemedi');
    }
  }

  // kullanıcı silme fonksiyonu:
  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('url yaz'));

    if (response.statusCode != 204) {
      throw Exception('Kullanıcı silinemedi');
    }
  }
}
