import 'package:flutter/material.dart';
import 'package:sequest_app/data/base_data.dart';
import 'package:sequest_app/widgets/input_with_autocomplete.dart';

class GenerationOptions extends StatefulWidget {
  const GenerationOptions({
    super.key,
    required this.colorScheme,
    required this.onTopicChanged,
    required this.onHobbyChanged,
  });
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
    if (_selectedClass.toInt() == 0) return _disciplineMap['all']!;
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
              color: widget.colorScheme.onTertiary,
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
              color: widget.colorScheme.onTertiary,
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
              color: widget.colorScheme.onTertiary,
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
        InputWithAutocomplete(
          inputText: 'Тема',
          autocomleteItemsList: _allSchoolTopics,
          onSelectedParam: widget.onTopicChanged,
          inputColor: widget.colorScheme.onTertiary,
        ),
        InputWithAutocomplete(
          inputText: 'Гоббі/Інтерес',
          autocomleteItemsList: baseHobbyList,
          onSelectedParam: widget.onHobbyChanged,
          inputColor: widget.colorScheme.onTertiary,
        ),
      ],
    );
  }
}
