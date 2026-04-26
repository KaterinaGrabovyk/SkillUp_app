import 'package:flutter/material.dart';
import 'package:skill_up_app/screens/drawer_item_data.dart';
import 'package:skill_up_app/widgets/main_drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    void openScreen(Widget screen) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (ctx, a, m) => screen,

          transitionsBuilder: (ctx, animation, an, child) {
            final tween = Tween(
              begin: Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOut));
            return SlideTransition(
              position: animation.drive(tween),
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: child,
              ),
            );
          },
        ),
      );
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.keyboard_double_arrow_up,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(width: 18),
                Text(
                  'SkillUp',
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ),

          MainDrawerItem(
            title: 'Теми',
            icon: Icons.category,
            onSelectScreen: () {
              openScreen(
                DrawerItemDataScreen(
                  title: 'Теми',
                  dbTitle: 'topics',
                ),
              );
            },
          ),
          MainDrawerItem(
            title: 'Гоббі/Інтереси',
            icon: Icons.interests,
            onSelectScreen: () {
              openScreen(
                DrawerItemDataScreen(
                  title: 'Гоббі/Інтереси',
                  dbTitle: 'hobbies',
                ),
              );
            },
          ),
          MainDrawerItem(
            title: 'Задачі',
            icon: Icons.assignment_turned_in,
            onSelectScreen: () {
              openScreen(
                DrawerItemDataScreen(
                  title: 'Задачі',
                  dbTitle: 'tasks',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
