import 'package:tugas8/login/login_ui.dart';
import 'package:tugas8/services/github_users_services.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  GithubUsersServices services = GithubUsersServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar User"),
          backgroundColor: Colors.black54,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: services.fetchDataGithubUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minVerticalPadding: 24,
                          leading: Image.network(
                              '${snapshot.data?[index].avatarUrl}'),
                          title: Text(snapshot.data?[index].login ??
                              "username not found"),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
