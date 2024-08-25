import 'package:field_training_app/student_features/chat_gpt/presentation/widgets/custom_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatCubit extends Cubit<List<CustomMessage>> {
  ChatCubit() : super([]);

  final chatAPIKey = 'AIzaSyDItXrIiIFrcSwFOmtfv6LwB4X4IIs8IJE';

  Future<void> addMessage(String text, bool isUser) async {
    final message = CustomMessage(
      message: text,
      isUser: isUser,
      date: DateTime.now().toString(),
    );
    emit(List.from(state)..add(message));

    final model = GenerativeModel(model: 'gemini-pro', apiKey: chatAPIKey);
    final content = [Content.text(text)];
    final response = await model.generateContent(content);

    final responseMessage = CustomMessage(
      message: response.text ?? '',
      isUser: false,
      date: DateTime.now().toString(),
    );
    emit(List.from(state)..add(responseMessage));
  }
}
