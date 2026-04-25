import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sequest_app/Providers/groq_provider.dart';

class Result extends ConsumerWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String result = 'Ще не має задачі, згенеруйте нову!';
    if (ref.watch(groqResponseProvider).isNotEmpty) {
      result = ref.watch(groqResponseProvider);
    }
    return Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.symmetric(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Text(
          result,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
//ref.watch(groqResponseProvider)