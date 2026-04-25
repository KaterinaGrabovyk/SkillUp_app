import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_up_app/Providers/groq_provider.dart';
import 'package:skill_up_app/widgets/adaptation_options.dart';
import 'package:skill_up_app/widgets/generation_options.dart';

class TaskOptions extends ConsumerStatefulWidget {
  const TaskOptions({super.key});
  @override
  ConsumerState<TaskOptions> createState() => _TaskOptionsState();
}

class _TaskOptionsState extends ConsumerState<TaskOptions> {
  int _groupValue = 0;
  final _formKey = GlobalKey<FormState>();
  var _selectedTopic = '';
  var _selectedHobby = '';
  void _sendPrompt() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    ref
        .read(groqResponseProvider.notifier)
        .generateProblem(_selectedTopic, _selectedHobby);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final segmentTextStyle = theme.textTheme.bodyLarge?.copyWith(
      color: colorScheme.onTertiary,
    );

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onTertiaryFixedVariant,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _groupValue == 0
                      ? GenerationOptions(
                          colorScheme: colorScheme,
                          onTopicChanged: (value) {
                            _selectedTopic = value;
                          },
                          onHobbyChanged: (value) {
                            _selectedHobby = value;
                          },
                        )
                      : AdaptationOptions(colorScheme: colorScheme),

                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: _sendPrompt,
                        child: Text('Надіслати'),
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
