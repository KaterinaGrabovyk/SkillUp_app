import 'package:flutter/material.dart';

class GenerationOptions extends StatefulWidget {
  const GenerationOptions({super.key});

  @override
  State<GenerationOptions> createState() =>
      _GenerationOptionsState();
}

class _GenerationOptionsState extends State<GenerationOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextFormField(decoration: InputDecoration())],
    );
  }
}
