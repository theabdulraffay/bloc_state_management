import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_management/Post%20API/Model/post_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>?> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as List;
        return jsonResponse.map((e) {
          return PostModel(
              postId: e['postId'] as int,
              id: e['id'] as int,
              name: e['name'] as String,
              email: e['email'] as String,
              body: e['body'] as String);
        }).toList();
      }
    } on SocketException {
      throw Exception('Failed to connect to the server');
    }
    return null;
  }
}
