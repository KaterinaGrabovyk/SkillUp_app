import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sequest_app/widgets/adaptation_options.dart';
import 'package:sequest_app/widgets/generation_options.dart';
import 'package:groq_sdk/groq_sdk.dart';

class TaskOptions extends StatefulWidget {
  const TaskOptions({super.key});

  @override
  State<TaskOptions> createState() => _TaskOptionsState();
}

class _TaskOptionsState extends State<TaskOptions> {
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
    final apiKey = dotenv.get('GROQ_API_KEY');

    try {
      final groq = Groq(apiKey);
      if (!await groq.canUseModel(
        GroqModels.llama33_70b_versatile,
      )) {
        return;
      }
      final chat = groq.startNewChat(
        GroqModels.llama33_70b_versatile,
      );
      final (response, usage) = await chat.sendMessage(
        'return only false',
      );
      print(response.choices.first.message);
    } on GroqException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ERROR: ${error.error}')),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
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
                          theme: theme,
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
