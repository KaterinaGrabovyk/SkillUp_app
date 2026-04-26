import 'package:flutter/material.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onSelectScreen,
  });

  final IconData icon;
  final String title;
  final void Function() onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onSelectScreen,
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 24,
        ),
      ),
    );
  }
}
