import 'package:flutter/material.dart';
import 'package:skill_up_app/widgets/main_drawer.dart';
import 'package:skill_up_app/widgets/result.dart';
import 'package:skill_up_app/widgets/task_options.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sequest',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primaryContainer,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info,
              color: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(
        context,
      ).colorScheme.primaryContainer,
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
