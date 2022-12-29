import 'package:http/http.dart' as http;

import '../model/github_users.dart';

class GithubUsersServices {
  // Future<List<GithubUsers>> fetchDataGithubUsers() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse("https://api.github.com/users"),
  //     );
  //     final result = githubUsersFromJson(response.body);
  //     return result;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<List<GithubUsers>> fetchDataGithubUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/users'),
      );
      print(response.body);

      final List<GithubUsers> result = githubUsersFromJson(response.body);

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
