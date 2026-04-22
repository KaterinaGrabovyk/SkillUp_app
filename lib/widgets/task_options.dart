import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sequest_app/widgets/adaptation_options.dart';
import 'package:sequest_app/widgets/generation_options.dart';

class TaskOptions extends StatefulWidget {
  const TaskOptions({super.key});
  @override
  State<TaskOptions> createState() {
    return _TaskOptionsState();
  }
}

class _TaskOptionsState extends State<TaskOptions> {
  int _groupValue = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  groupValue: _groupValue,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.tertiary,
                  thumbColor: Theme.of(
                    context,
                  ).colorScheme.onTertiaryContainer,
                  children: {
                    0: Text(
                      'Генерація',
                      style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onTertiary,
                          ),
                    ),
                    1: Text(
                      'Адаптація',
                      style: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onTertiary,
                          ),
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _groupValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 200,
                child: _groupValue == 0
                    ? GenerationOptions()
                    : AdaptationOptions(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  decoration: InputDecoration(
                    label: Text(
                      'Введіть Хоббі...',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Очистити',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Надіслати'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
