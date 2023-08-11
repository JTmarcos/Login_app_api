import 'package:flutter/material.dart';
import 'package:login_screen/controller/home_controller.dart';
import 'package:login_screen/models/post_model.dart';
import 'package:login_screen/repository/home_reposutory_imp.dart';
import 'package:login_screen/routes/routes.dart';
import 'package:login_screen/services/prefs_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                PrefService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.loginPage, (route) => true);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (BuildContext context, value, __) {
          return ListView.separated(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(value[index].id.toString()),
                title: Text(value[index].title),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.detailsPage, arguments: value[index]);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2,
              );
            },
          );
        },
      ),
    );
  }
}
