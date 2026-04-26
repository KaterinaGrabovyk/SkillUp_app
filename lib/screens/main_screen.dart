import 'package:flutter/material.dart';
import 'package:skill_up_app/screens/about.dart';
import 'package:skill_up_app/widgets/main_drawer.dart';
import 'package:skill_up_app/widgets/result.dart';
import 'package:skill_up_app/widgets/options_widgets/task_options.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AboutScreen(),
              );
            },
            icon: Icon(
              Icons.info,
              color: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Result(),
              Expanded(child: TaskOptions()),
            ],
          ),
        ),
      ),
    );
  }
}
