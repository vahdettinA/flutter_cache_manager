import 'package:chace_maneger/future/model/user_model.dart';
import 'package:chace_maneger/product/cache_manager.dart';
import 'package:flutter/material.dart';

class CacheView extends StatelessWidget {
  final items = CacheManager.instance.getCacheList<Data>(Data());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text('${items[index].email}'),
              subtitle: Text('${items[index].firstName}'),
              leading: CircleAvatar(
                child: Image.network(items[index].avatar.toString()),
              ),
            );
          }),
    );
  }
}
