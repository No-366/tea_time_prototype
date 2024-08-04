// import 'package:app/models/survey.dart';
// import 'package:flutter/material.dart';
// import 'home_screen.dart';

// class SurveyScreen extends StatefulWidget {
//   final Survey survey;

//   const SurveyScreen({super.key, required this.survey});

//   @override
//   _SurveyScreenState createState() => _SurveyScreenState();
// }

// class _SurveyScreenState extends State<SurveyScreen> {
//   Map<int, String> selectedOptions = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.survey.surveyTitle),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: <Widget>[
//             Text(
//               widget.survey.surveyTitle,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(widget.survey.surveyDescription),
//             const SizedBox(height: 20),
//             ...widget.survey.questions.asMap().entries.map((entry) {
//               int questionIndex = entry.key;
//               Question question = entry.value;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     children: [
//                       Text('Q${questionIndex + 1}'),
//                       Text(
//                         question.question,
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   ...question.options.map((option) {
//                     return ListTile(
//                       title: Text(option),
//                       leading: Radio<String>(
//                         value: option,
//                         groupValue: selectedOptions[questionIndex],
//                         onChanged: (value) {
//                           setState(() {
//                             selectedOptions[questionIndex] = value!;
//                           });
//                         },
//                       ),
//                     );
//                   }).toList(),
//                   const SizedBox(height: 20),
//                 ],
//               );
//             }).toList(),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // 설문조사 제출 로직 (예시로 팝업 메시지 표시 후 홈 화면으로 돌아가기)
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('감사합니다!'),
//                         content: const Text('설문에 응해주셔서 감사합니다! 리워드를 확인해 보세요!!'),
//                         actions: <Widget>[
//                           TextButton(
//                             child: const Text('확인'),
//                             onPressed: () {
//                               Navigator.of(context).pushAndRemoveUntil(
//                                 MaterialPageRoute(
//                                   builder: (context) => const HomeScreen(),
//                                 ),
//                                 (route) => false,
//                               );
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.orange,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                 ),
//                 child: const Text('제출하기'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:app/models/survey.dart';
// import 'package:flutter/material.dart';
// import 'home_screen.dart';

// class SurveyScreen extends StatefulWidget {
//   final Survey survey;

//   const SurveyScreen({super.key, required this.survey});

//   @override
//   _SurveyScreenState createState() => _SurveyScreenState();
// }

// class _SurveyScreenState extends State<SurveyScreen> {
//   Map<int, List<String>> selectedOptions = {};
//   int currentQuestionIndex = 0;

//   void nextQuestion() {
//     setState(() {
//       if (currentQuestionIndex < widget.survey.questions.length - 1) {
//         currentQuestionIndex++;
//       } else if(currentQuestionIndex == widget.survey.questions.length - 1){

//       }else {
//         // 설문조사 제출 로직 (예시로 팝업 메시지 표시 후 홈 화면으로 돌아가기)
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('감사합니다!'),
//               content: const Text('설문에 응해주셔서 감사합니다! 리워드를 확인해 보세요!!'),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('확인'),
//                   onPressed: () {
//                     Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(
//                         builder: (context) => const HomeScreen(),
//                       ),
//                       (route) => false,
//                     );
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Question currentQuestion = widget.survey.questions[currentQuestionIndex];
//     bool isLastQuestion =
//         currentQuestionIndex == widget.survey.questions.length - 1;
//     bool isSingleChoice = currentQuestion.type == 'single';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.survey.surveyTitle),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Question ${currentQuestionIndex + 1}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               currentQuestion.question,
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             if (isSingleChoice)
//               ...currentQuestion.options.map((option) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedOptions[currentQuestionIndex] = [option];
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 20),
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       color: selectedOptions[currentQuestionIndex]
//                                   ?.contains(option) ==
//                               true
//                           ? Colors.orange.withOpacity(0.5)
//                           : Colors.transparent,
//                       border: Border.all(color: Colors.orange),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Radio<String>(
//                           value: option,
//                           groupValue:
//                               selectedOptions[currentQuestionIndex]?.first,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedOptions[currentQuestionIndex] = [value!];
//                             });
//                           },
//                         ),
//                         Expanded(child: Text(option)),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             if (!isSingleChoice)
//               ...currentQuestion.options.map((option) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (selectedOptions[currentQuestionIndex]
//                               ?.contains(option) ==
//                           true) {
//                         selectedOptions[currentQuestionIndex]?.remove(option);
//                       } else {
//                         selectedOptions[currentQuestionIndex] =
//                             (selectedOptions[currentQuestionIndex] ?? [])
//                               ..add(option);
//                       }
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 20),
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       color: selectedOptions[currentQuestionIndex]
//                                   ?.contains(option) ==
//                               true
//                           ? Colors.orange.withOpacity(0.5)
//                           : Colors.transparent,
//                       border: Border.all(color: Colors.orange),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Checkbox(
//                           value: selectedOptions[currentQuestionIndex]
//                                   ?.contains(option) ??
//                               false,
//                           onChanged: (value) {
//                             setState(() {
//                               if (value == true) {
//                                 selectedOptions[currentQuestionIndex] =
//                                     (selectedOptions[currentQuestionIndex] ??
//                                         [])
//                                       ..add(option);
//                               } else {
//                                 selectedOptions[currentQuestionIndex]
//                                     ?.remove(option);
//                               }
//                             });
//                           },
//                         ),
//                         Expanded(child: Text(option)),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed:
//                     (selectedOptions[currentQuestionIndex]?.isNotEmpty ?? false)
//                         ? nextQuestion
//                         : null,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.brown, // 변경된 버튼 색상
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text(isLastQuestion ? '설문종료' : '다음'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:app/models/survey.dart';
// import 'package:flutter/material.dart';
// import 'home_screen.dart';

// class SurveyScreen extends StatefulWidget {
//   final Survey survey;

//   const SurveyScreen({super.key, required this.survey});

//   @override
//   _SurveyScreenState createState() => _SurveyScreenState();
// }

// class _SurveyScreenState extends State<SurveyScreen> {
//   Map<int, List<String>> selectedOptions = {};
//   int currentQuestionIndex = 0;
//   bool showRatingPage = false;
//   String? selectedEmoji;

//   void nextQuestion() {
//     setState(() {
//       if (currentQuestionIndex < widget.survey.questions.length - 1) {
//         currentQuestionIndex++;
//       } else {
//         showRatingPage = true;
//       }
//     });
//   }

//   void selectEmoji(String emoji) {
//     setState(() {
//       selectedEmoji = emoji;
//       Future.delayed(const Duration(seconds: 1), () {
//         // 설문조사 제출 로직 (예시로 팝업 메시지 표시 후 홈 화면으로 돌아가기)
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('감사합니다!'),
//               content: const Text('설문에 응해주셔서 감사합니다! 리워드를 확인해 보세요!!'),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('확인'),
//                   onPressed: () {
//                     Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(
//                         builder: (context) => const HomeScreen(),
//                       ),
//                       (route) => false,
//                     );
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showRatingPage) {
//       return Scaffold(
//         body: Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               if (selectedEmoji != null)
//                 AnimatedPositioned(
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.easeInOut,
//                   top: selectedEmoji != null
//                       ? MediaQuery.of(context).size.height / 2 - 50
//                       : MediaQuery.of(context).size.height / 2 - 150,
//                   child: AnimatedScale(
//                     duration: const Duration(milliseconds: 500),
//                     scale: selectedEmoji != null ? 3.0 : 1.0,
//                     child: Opacity(
//                       opacity: selectedEmoji != null ? 0.5 : 1.0,
//                       child: Image.asset(
//                         'assets/$selectedEmoji.gif', // 실제 이미지 경로에 맞게 수정
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                   ),
//                 ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     '마지막 질문이에요!',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     '설문은 맘에 드셨나요?',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   const SizedBox(height: 40),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       GestureDetector(
//                         onTap: () => selectEmoji('angry'),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'assets/upset.gif',
//                               width: 5,
//                               height: 5,
//                             ),
//                             const Text('별로예요'),
//                           ],
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => selectEmoji('neutral'),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'assets/hmm.gif',
//                               width: 5,
//                               height: 5,
//                             ),
//                             const Text('보통이에요'),
//                           ],
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => selectEmoji('happy'),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'assets/happy.gif',
//                               width: 5,
//                               height: 5,
//                             ),
//                             const Text('좋아요'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     Question currentQuestion = widget.survey.questions[currentQuestionIndex];
//     bool isSingleChoice = currentQuestion.type == 'single';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.survey.surveyTitle),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Question ${currentQuestionIndex + 1}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               currentQuestion.question,
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             if (isSingleChoice)
//               ...currentQuestion.options.map((option) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedOptions[currentQuestionIndex] = [option];
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 20),
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       color: selectedOptions[currentQuestionIndex]
//                                   ?.contains(option) ==
//                               true
//                           ? Colors.orange.withOpacity(0.5)
//                           : Colors.transparent,
//                       border: Border.all(color: Colors.orange),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Radio<String>(
//                           value: option,
//                           groupValue:
//                               selectedOptions[currentQuestionIndex]?.first,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedOptions[currentQuestionIndex] = [value!];
//                             });
//                           },
//                         ),
//                         Expanded(child: Text(option)),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             if (!isSingleChoice)
//               ...currentQuestion.options.map((option) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (selectedOptions[currentQuestionIndex]
//                               ?.contains(option) ==
//                           true) {
//                         selectedOptions[currentQuestionIndex]?.remove(option);
//                       } else {
//                         selectedOptions[currentQuestionIndex] =
//                             (selectedOptions[currentQuestionIndex] ?? [])
//                               ..add(option);
//                       }
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 20),
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       color: selectedOptions[currentQuestionIndex]
//                                   ?.contains(option) ==
//                               true
//                           ? Colors.orange.withOpacity(0.5)
//                           : Colors.transparent,
//                       border: Border.all(color: Colors.orange),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Checkbox(
//                           value: selectedOptions[currentQuestionIndex]
//                                   ?.contains(option) ??
//                               false,
//                           onChanged: (value) {
//                             setState(() {
//                               if (value == true) {
//                                 selectedOptions[currentQuestionIndex] =
//                                     (selectedOptions[currentQuestionIndex] ??
//                                         [])
//                                       ..add(option);
//                               } else {
//                                 selectedOptions[currentQuestionIndex]
//                                     ?.remove(option);
//                               }
//                             });
//                           },
//                         ),
//                         Expanded(child: Text(option)),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             const Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed:
//                     (selectedOptions[currentQuestionIndex]?.isNotEmpty ?? false)
//                         ? nextQuestion
//                         : null,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.brown, // 변경된 버튼 색상
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text(showRatingPage ? '설문종료' : '다음'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
  bool showRatingPage = false;
  String? selectedEmoji;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.survey.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        showRatingPage = true;
      }
    });
  }

  void selectEmoji(String emoji) {
    setState(() {
      selectedEmoji = emoji;
      Future.delayed(const Duration(seconds: 2), () {
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showRatingPage) {
      return Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (selectedEmoji != null)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  top: selectedEmoji != null
                      ? MediaQuery.of(context).size.height / 2 - 50
                      : MediaQuery.of(context).size.height / 2 - 150,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: selectedEmoji != null ? 3.0 : 1.0,
                    child: Opacity(
                      opacity: selectedEmoji != null ? 0.5 : 1.0,
                      child: Image.asset(
                        'assets/$selectedEmoji.gif', // 실제 이미지 경로에 맞게 수정
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '마지막 질문이에요!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '설문은 맘에 드셨나요?',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => selectEmoji('upset'),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/upset.gif',
                              width: 60,
                              height: 60,
                            ),
                            const Text('별로예요'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => selectEmoji('hmm'),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/hmm.gif',
                              width: 60,
                              height: 60,
                            ),
                            const Text('보통이에요'),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => selectEmoji('happy'),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/happy.gif',
                              width: 60,
                              height: 60,
                            ),
                            const Text('좋아요'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Question currentQuestion = widget.survey.questions[currentQuestionIndex];
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptions[currentQuestionIndex] = [option];
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: selectedOptions[currentQuestionIndex]
                                  ?.contains(option) ==
                              true
                          ? Colors.orange.withOpacity(0.5)
                          : Colors.transparent,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: option,
                          groupValue:
                              selectedOptions[currentQuestionIndex]?.first,
                          onChanged: (value) {
                            setState(() {
                              selectedOptions[currentQuestionIndex] = [value!];
                            });
                          },
                        ),
                        Expanded(child: Text(option)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            if (!isSingleChoice)
              ...currentQuestion.options.map((option) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedOptions[currentQuestionIndex]
                              ?.contains(option) ==
                          true) {
                        selectedOptions[currentQuestionIndex]?.remove(option);
                      } else {
                        selectedOptions[currentQuestionIndex] =
                            (selectedOptions[currentQuestionIndex] ?? [])
                              ..add(option);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: selectedOptions[currentQuestionIndex]
                                  ?.contains(option) ==
                              true
                          ? Colors.orange.withOpacity(0.5)
                          : Colors.transparent,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: selectedOptions[currentQuestionIndex]
                                  ?.contains(option) ??
                              false,
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedOptions[currentQuestionIndex] =
                                    (selectedOptions[currentQuestionIndex] ??
                                        [])
                                      ..add(option);
                              } else {
                                selectedOptions[currentQuestionIndex]
                                    ?.remove(option);
                              }
                            });
                          },
                        ),
                        Expanded(child: Text(option)),
                      ],
                    ),
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
                child: Text(showRatingPage ? '설문종료' : '다음'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
