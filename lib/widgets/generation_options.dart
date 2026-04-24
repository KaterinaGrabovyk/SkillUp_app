import 'package:flutter/material.dart';
import 'package:sequest_app/data/base_data.dart';
import 'package:sequest_app/widgets/hobby_input.dart';

class GenerationOptions extends StatefulWidget {
  const GenerationOptions({
    super.key,
    required this.theme,
    required this.colorScheme,
    required this.onTopicChanged,
    required this.onHobbyChanged,
  });
  final ThemeData theme;
  final ColorScheme colorScheme;
  final Function(String) onTopicChanged;
  final Function(String) onHobbyChanged;
  @override
  State<GenerationOptions> createState() =>
      _GenerationOptionsState();
}

class _GenerationOptionsState extends State<GenerationOptions> {
  int _selectedClass = 0;
  String _selectedDiscipline = '';
  final Map<String, List<String>> _disciplineMap = {
    'all': ['Алгебра', 'Геометрія', 'Математика'],
    'low': ['Математика'],
    'middle': ['Математика'],
    'high': ['Алгебра', 'Геометрія'],
  };
  final List<int> _schoolClasses = List.generate(
    11,
    (index) => index + 1,
  );
  List<String> get _schoolDisciplines {
    if (_selectedClass == 0) return _disciplineMap['all']!;
    if (_selectedClass <= 4) return _disciplineMap['low']!;
    if (_selectedClass <= 6) return _disciplineMap['middle']!;
    return _disciplineMap['high']!;
  }

  List<String> get _allSchoolTopics {
    if (_selectedDiscipline != '') {
      if (_selectedClass != 0) {
        return schoolProgram
            .firstWhere(
              (schoolClass) =>
                  schoolClass.clasNumber == _selectedClass,
            )
            .disciplines
            .firstWhere(
              (schoolDisc) =>
                  schoolDisc.title == _selectedDiscipline,
            )
            .topics
            .map((topic) => topic.title)
            .toList();
      }
    }
    return schoolProgram
        .expand((c) => c.disciplines)
        .expand((d) => d.topics)
        .map((topic) => topic.title)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: widget.colorScheme.onPrimary,
              child: DropdownButton(
                hint: Text('Клас'),
                padding: EdgeInsets.only(left: 12, right: 8),
                underline: SizedBox(),
                alignment: Alignment.center,
                menuMaxHeight: 250,
                borderRadius: BorderRadius.circular(20),
                value: _selectedClass == 0 ? null : _selectedClass,
                items: _schoolClasses.map((schoolClas) {
                  return DropdownMenuItem(
                    value: schoolClas,
                    child: Text('$schoolClas клас'),
                  );
                }).toList(),
                onChanged: (newClasValue) {
                  setState(() {
                    _selectedClass = newClasValue!;
                    _selectedDiscipline = '';
                  });
                },
              ),
            ),
            SizedBox(width: 30),
            Container(
              color: widget.colorScheme.onPrimary,
              child: DropdownButton(
                hint: Text('Дисципліна'),
                padding: EdgeInsets.only(left: 12, right: 8),
                underline: SizedBox(),
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(20),
                value: _selectedDiscipline == ''
                    ? null
                    : _selectedDiscipline,
                items: _schoolDisciplines.map((schoolDiscipline) {
                  return DropdownMenuItem(
                    value: schoolDiscipline,
                    child: Text(schoolDiscipline),
                  );
                }).toList(),
                onChanged: (newDisciplineValue) {
                  setState(() {
                    _selectedDiscipline = newDisciplineValue!
                        .toString();
                  });
                },
              ),
            ),
            Spacer(),
            IconButton(
              color: widget.colorScheme.onPrimary,
              onPressed: () {
                setState(() {
                  _selectedClass = 0;
                  _selectedDiscipline = '';
                });
              },
              icon: Icon(Icons.autorenew),
            ),
          ],
        ),
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEdVal) {
            if (textEdVal.text == '') {
              return Iterable.empty();
            }
            return _allSchoolTopics.where((String item) {
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
                  maxLength: 60,
                  onSaved: (value) {
                    widget.onTopicChanged(value!);
                    onFieldSubmitted();
                  },
                  validator: (value) {
                    if (value == null ||
                        value == '' ||
                        value.length < 10) {
                      return 'Тема має бути довше 10х символів';
                    }
                    return null;
                  },

                  style: TextStyle(
                    color: widget.colorScheme.onPrimary,
                  ),
                  cursorColor: widget.colorScheme.onPrimary,

                  decoration: InputDecoration(
                    labelText: 'Тема',
                    suffix: IconButton(
                      onPressed: () {
                        textEditingController.clear();
                        widget.onTopicChanged('');
                      },
                      icon: Icon(Icons.cancel),
                      style: IconButton.styleFrom(
                        foregroundColor: widget.colorScheme.error,
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    counterStyle: TextStyle(
                      color: widget.colorScheme.onPrimary,
                    ),
                    labelStyle: TextStyle(
                      color: widget.colorScheme.onPrimary,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.colorScheme.onPrimary,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              },
        ),
        HobbyInput(
          colorScheme: widget.colorScheme,
          onHobbyChanged: (hobby) => widget.onHobbyChanged(hobby),
        ),
      ],
    );
  }
}
