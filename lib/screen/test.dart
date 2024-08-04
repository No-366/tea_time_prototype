import 'package:app/models/survey.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SurveyScreen extends StatefulWidget {
  final Survey survey;

  const SurveyScreen({super.key, required this.survey});

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  Map<int, List<String>> selectedOptions = {};
  int currentQuestionIndex = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.survey.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // 설문조사 제출 로직 (예시로 팝업 메시지 표시 후 홈 화면으로 돌아가기)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('감사합니다!'),
              content: const Text('설문에 응해주셔서 감사합니다! 리워드를 확인해 보세요!!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.survey.questions[currentQuestionIndex];
    bool isLastQuestion =
        currentQuestionIndex == widget.survey.questions.length - 1;
    bool isSingleChoice = currentQuestion.type == 'single';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.survey.surveyTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Question ${currentQuestionIndex + 1}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            if (isSingleChoice)
              ...currentQuestion.options.map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: selectedOptions[currentQuestionIndex]?.first,
                    onChanged: (value) {
                      setState(() {
                        selectedOptions[currentQuestionIndex] = [value!];
                      });
                    },
                  ),
                );
              }).toList(),
            if (!isSingleChoice)
              ...currentQuestion.options.map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Checkbox(
                    value: selectedOptions[currentQuestionIndex]
                            ?.contains(option) ??
                        false,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedOptions[currentQuestionIndex] =
                              (selectedOptions[currentQuestionIndex] ?? [])
                                ..add(option);
                        } else {
                          selectedOptions[currentQuestionIndex]?.remove(option);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed:
                    (selectedOptions[currentQuestionIndex]?.isNotEmpty ?? false)
                        ? nextQuestion
                        : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.brown, // 변경된 버튼 색상
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(isLastQuestion ? '설문종료' : '다음'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final String
      type; // 'single' for single choice, 'multiple' for multiple choice

  Question({
    required this.question,
    required this.options,
    required this.type,
  });
}

class Survey {
  final String surveyTitle;
  final List<Question> questions;

  Survey({
    required this.surveyTitle,
    required this.questions,
  });
}

void main() {
  runApp(MaterialApp(
    home: SurveyScreen(
      survey: Survey(
        surveyTitle: '직업 만족도 및 직장 생활 설문조사',
        questions: [
          Question(
            question: '현재 직업에 얼마나 만족하십니까?',
            options: ['매우 만족한다', '만족한다', '보통이다', '불만족하다', '매우 불만족하다'],
            type: 'single',
          ),
          Question(
            question: '현재 직장에서의 업무량은 적절하다고 생각하십니까?',
            options: ['매우 적절하다', '적절하다', '보통이다', '많다'],
            type: 'single',
          ),
          Question(
            question: 'What do you like about our service?',
            options: [
              'Fairly cheaper price',
              'Clear tracking system',
              'Easy to use',
              'Friendly customer service'
            ],
            type: 'multiple',
          ),
        ],
      ),
    ),
  ));
}
