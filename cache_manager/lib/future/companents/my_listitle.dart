import 'package:chace_maneger/future/model/user_model.dart';
import 'package:chace_maneger/product/cache_manager.dart';
import 'package:flutter/material.dart';

class MyListTitle extends StatelessWidget {
  final Data data;
  const MyListTitle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        icon: Icon(Icons.bookmark),
        onPressed: () {
          CacheManager.instance.addCacheItem('${data.id}', data);
        },
      ),
      title: Text(data.firstName.toString() + " " + data.lastName.toString()),
      subtitle: Text(data.email.toString()),
      leading: CircleAvatar(child: Image.network(data.avatar.toString())),
    );
  }
}
