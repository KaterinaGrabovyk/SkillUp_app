import 'package:flutter/material.dart';
import 'package:sequest_app/widgets/main_drawer.dart';
import 'package:sequest_app/widgets/result.dart';
import 'package:sequest_app/widgets/task_options.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sequest'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Result(),

            Expanded(child: TaskOptions()),
          ],
        ),
      ),
    );
  }
}
