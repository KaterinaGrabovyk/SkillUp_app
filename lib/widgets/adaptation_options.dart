import 'package:flutter/material.dart';
import 'package:sequest_app/widgets/hobby_input.dart';

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
        HobbyInput(
          colorScheme: widget.colorScheme,
          onHobbyChanged: (hobby) => _selectedHobby = hobby,
        ),
      ],
    );
  }
}
