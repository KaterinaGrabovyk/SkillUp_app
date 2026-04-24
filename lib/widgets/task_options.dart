import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sequest_app/data/base_data.dart';
import 'package:sequest_app/models/topics.dart';
import 'package:sequest_app/widgets/adaptation_options.dart';
import 'package:sequest_app/widgets/generation_options.dart';

class TaskOptions extends StatefulWidget {
  const TaskOptions({super.key});

  @override
  State<TaskOptions> createState() => _TaskOptionsState();
}

class _TaskOptionsState extends State<TaskOptions> {
  int _groupValue = 0;
  final _formKey = GlobalKey<FormState>();
  var _selectedTopic = '';
  String _selectedHobby = '';

  void _sendPrompt() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    print(_selectedTopic);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final segmentTextStyle = theme.textTheme.bodyLarge?.copyWith(
      color: colorScheme.onTertiary,
    );

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onTertiaryFixedVariant,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl(
                groupValue: _groupValue,
                backgroundColor: colorScheme.tertiary,
                thumbColor: colorScheme.onTertiaryContainer,
                children: {
                  0: Text('Генерація', style: segmentTextStyle),
                  1: Text('Адаптація', style: segmentTextStyle),
                },
                onValueChanged: (value) =>
                    setState(() => _groupValue = value!),
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: _groupValue == 0
                        ? GenerationOptions(
                            theme: theme,
                            colorScheme: colorScheme,
                            onTopicChanged: (value) =>
                                _selectedTopic = value,
                          )
                        : const AdaptationOptions(),
                  ),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEdVal) {
                      if (textEdVal.text == '') {
                        return Iterable.empty();
                      }
                      return baseHobbyList.where((String item) {
                        return item.contains(
                          textEdVal.text.toLowerCase(),
                        );
                      });
                    },
                    fieldViewBuilder:
                        (
                          context,
                          textEditingController,
                          focusNode,
                          onFieldSubmitted,
                        ) {
                          return TextFormField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            validator: (value) {
                              if (value == null ||
                                  value == '' ||
                                  value.length < 3) {
                                return 'Гоббі має бути довше 3х символів';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _selectedHobby = value!;

                              onFieldSubmitted();
                            },
                            maxLength: 30,
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                            ),
                            cursorColor: colorScheme.onPrimary,

                            decoration: InputDecoration(
                              labelText: 'Введіть Хоббі...',

                              counterStyle: TextStyle(
                                color: colorScheme.onPrimary,
                              ),
                              labelStyle: TextStyle(
                                color: colorScheme.onPrimary,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          );
                        },
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        child: Text(
                          'Очистити',
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _sendPrompt,
                        child: const Text('Надіслати'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
