// class Question {
//   final String question;
//   final String type;
//   final List<String> options;

//   Question({
//     required this.question,
//     required this.type,
//     required this.options,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) {
//     var optionsFromJson = json['options'] as List;
//     List<String> optionsList =
//         optionsFromJson.map((option) => option.toString()).toList();

//     return Question(
//       question: json['question'],
//       type: json['type'],
//       options: optionsList,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'question': question,
//       'type': type,
//       'options': options,
//     };
//   }
// }
