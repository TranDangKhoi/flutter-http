import 'package:http/http.dart' as http;
import "dart:convert";

class User {
  final String email;
  final String picture;
  // Vì ở trong data trả về, name là một object nên ta phải tạo một class Name để lưu trữ
  final Name name;
  const User({
    required this.email,
    required this.picture,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      picture: json['picture']['large'],
      name: Name.fromJson(json['name']),
    );
  }
}

// Tạo class Name ở đây nè hihi
class Name {
  final String first;
  final String last;
  const Name({
    required this.first,
    required this.last,
  });
  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json['first'],
      last: json['last'],
    );
  }
}

// Trong này là các thể loại hàm để GET POST PUT DELETE, nhưng mà hiện tại tôi mới làm GET thôi
class UserService {
  Future<List<User>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    if (response.statusCode == 200) {
      // Cách 1:
      final parsed = jsonDecode(response.body);
      final results = parsed['results'];
      return results.map<User>((json) => User.fromJson(json)).toList();
      // Cách 2:
      /*
      final List<User> list = [];
      for (var user in results) {
        list.add(User.fromJson(user));
      }
      return list;
       */
    } else {
      throw Exception('Failed to load users');
    }
  }
}
