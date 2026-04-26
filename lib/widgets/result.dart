import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_up_app/Providers/groq_provider.dart';

class Result extends ConsumerWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(groqResponseProvider);
    
    // Визначаємо контент залежно від стану
    Widget content;

    if (response == 'loading') {
      content = const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    } else if (response.isEmpty) {
      content = const Text(
        'Ще не має задачі, згенеруйте нову!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      );
    } else {
      content = SingleChildScrollView(
        child: Text(
          response,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: content, // Вставляємо підготовлений контент
    );
  }
}