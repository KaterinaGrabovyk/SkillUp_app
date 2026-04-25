import 'package:flutter_riverpod/legacy.dart';
import 'package:groq_sdk/groq_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroqProvider extends StateNotifier<String> {
  GroqProvider() : super('');
  GroqChat? _activeChat;
  Future<void> generateProblem(
  
    String topic,
    String hobby,
  ) async {
    final prompt =
        'Перевір наступні параметри: Тема: $topic; Інтерес/Гоббі:$hobby ;'
        'Якщо параметри не відповідають своїм назвам, поверни ЛИШЕ наступний текст:"Задана Тема чи Гоббі є некоректними";'
        'Інакше згенеруй унікальну задачу на вказану тему, адаптовану під гоббі, та поверни ЛИШЕ умову.';

    try {
      if (_activeChat == null) {
        final apiKey = dotenv.get('GROQ_API_KEY');
        final groq = Groq(apiKey);
        if (!await groq.canUseModel(
          GroqModels.llama33_70b_versatile,
        )) {
          return;
        }
        _activeChat = groq.startNewChat(
          GroqModels.llama33_70b_versatile,
        );
      }
      final (response, _) = await _activeChat!.sendMessage(prompt);
      state = response.choices.first.message;
    } catch (error) {
      state = 'Помилка: $error';
    }
  }
}

final groqResponseProvider =
    StateNotifierProvider<GroqProvider, String>(
      (ref) => GroqProvider(),
    );
