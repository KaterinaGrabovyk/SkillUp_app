import 'package:flutter/material.dart';
import 'package:sequest_app/data/base_data.dart';
import 'package:sequest_app/widgets/input_with_autocomplete.dart';

class AdaptationOptions extends StatefulWidget {
  const AdaptationOptions({super.key, required this.colorScheme});

  final ColorScheme colorScheme;
  @override
  State<AdaptationOptions> createState() =>
      _AdaptationOptionsState();
}

class _AdaptationOptionsState extends State<AdaptationOptions> {
  var _selectedHobby = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Adaptation options...'),
        InputWithAutocomplete(
          inputText: 'Гоббі/Інтерес',
          autocomleteItemsList: baseHobbyList,
          onSelectedParam: (d) {},
          inputColor: widget.colorScheme.onPrimary,
        ),
      ],
    );
  }
}
