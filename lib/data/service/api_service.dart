import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import '../../core/constants.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse(AppConstants.apiUrl);

    final res = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': 'FlutterApp', // ✅ Add User-Agent to avoid 403
      },
    );

    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts: ${res.statusCode}');
    }
  }
}
