import 'package:flutter/material.dart';
import 'package:flutter_fetch_api/detailsPage.dart';
import 'package:flutter_fetch_api/userService.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("User Details Page")),
        body: Center(
          child: FutureBuilder<List<User>>(
            future: futureUsers,
            initialData: [],
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      User user = snapshot.data![index];
                      return ListTile(
                        title: Text('${user.name.first} ${user.name.last}'),
                        subtitle: Text(user.email),
                        onTap: () {
                          openPage(context, user);
                        },
                      );
                    },
                    separatorBuilder: ((context, index) {
                      return const Divider(color: Colors.black26);
                    }),
                    itemCount: snapshot.data!.length);
              } else if (snapshot.hasError) {
                return Text('ERROR: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
          ),
        ));
  }

  openPage(context, User user) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailsPage()));
  }
}
