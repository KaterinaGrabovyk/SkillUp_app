import 'package:flutter/material.dart';
import 'package:sequest_app/data/base_data.dart';

class HobbyInput extends StatefulWidget {
  const HobbyInput({
    super.key,

    required this.colorScheme,
    required this.onHobbyChanged,
  });

  final ColorScheme colorScheme;
  final Function(String) onHobbyChanged;
  @override
  State<StatefulWidget> createState() => _HobbyInputState();
}

class _HobbyInputState extends State<HobbyInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEdVal) {
        if (textEdVal.text == '') {
          return Iterable.empty();
        }
        return baseHobbyList.where((String item) {
          return item.contains(textEdVal.text.toLowerCase());
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
                widget.onHobbyChanged(value!);

                onFieldSubmitted();
              },
              maxLength: 30,
              style: TextStyle(color: colorScheme.onPrimary),
              cursorColor: colorScheme.onPrimary,
              decoration: InputDecoration(
                labelText: 'Хоббі',
                suffix: IconButton(
                  onPressed: () {
                    textEditingController.clear();
                    widget.onHobbyChanged('');
                  },
                  icon: Icon(Icons.cancel),
                  style: IconButton.styleFrom(
                    foregroundColor: colorScheme.error,
                  ),
                ),
                counterStyle: TextStyle(
                  color: colorScheme.onPrimary,
                ),
                labelStyle: TextStyle(color: colorScheme.onPrimary),
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
    );
  }
}
