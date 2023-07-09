import 'package:chace_maneger/future/companents/my_listitle.dart';
import 'package:chace_maneger/future/model/user_model.dart';
import 'package:chace_maneger/future/service/user_service.dart';
import 'package:chace_maneger/future/view/cache_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late final IUserService _userService;
  List<Data> userList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userService = UserService(Dio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CacheView()));
              },
              icon: Icon(Icons.cached))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fechUseritem();
        },
        child: Icon(Icons.abc),
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, index) {
            return MyListTitle(data: userList[index]);
          }),
    );
  }

  Future<void> fechUseritem() async {
    userList = await _userService.fechuser();
    setState(() {});
  }
}
