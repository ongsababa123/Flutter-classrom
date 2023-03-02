import 'dart:convert';

// main() {
//   var data = '{"key1":"value1","key2":"value2"}';

//   Map<String, dynamic> user_data = jsonDecode(data);
//   print(user_data['key']);
//   print(user_data['key2']);
// }

List<QuizModel> quizmodelFormJson(String str) =>
    List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

class QuizModel {
  String title;
  List<ChoiceModel> choice;
  int answer;
  QuizModel({required this.title, required this.choice, required this.answer});
  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      title: json["title"],
      choice: List<ChoiceModel>.from(
          json["choice"].map((x) => ChoiceModel.fromJson(x))),
      answer: json["answer"],
    );
  }
}

class ChoiceModel {
  int id;
  String value;
  ChoiceModel({required this.id, required this.value});
  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
      id: json["ID"],
      value: json["value"],
    );
  }
}
