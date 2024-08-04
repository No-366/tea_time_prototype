// import 'package:flutter/material.dart';

// class SurveyDetailScreen extends StatelessWidget {
//   final String title;

//   const SurveyDetailScreen({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               '설명 :',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 color: Colors.grey[200],
//                 child: const Center(
//                   child: Text(
//                     '여기에 설문에 대한 상세 설명이 표시됩니다.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // 참여하기 버튼 클릭 시 처리 로직
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.orange, // 글자 색상
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                 ),
//                 child: const Text('참여하기'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:app/models/survey.dart';
// import 'package:app/screen/survey_screen.dart';
// import 'package:flutter/material.dart';
// import 'make_survey_screen.dart'; // SurveyScreen 파일을 import 합니다.

// class SurveyDetailScreen extends StatelessWidget {
//   final Survey survey;

//   const SurveyDetailScreen({super.key, required this.survey});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(survey.surveyTitle),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               '설명 :',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 color: Colors.grey[200],
//                 child: Center(
//                   child: Text(
//                     survey.surveyDescription,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const SurveyScreen(
//                           surveyId: 1), // surveyId를 사용하여 SurveyScreen으로 이동
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.orange, // 글자 색상
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                 ),
//                 child: const Text('참여하기'),
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
// import 'survey_screen.dart';

// class SurveyDetailScreen extends StatelessWidget {
//   final Survey survey;

//   const SurveyDetailScreen({super.key, required this.survey});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(survey.surveyTitle),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               '설명 :',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 color: Colors.grey[200],
//                 child: Center(
//                   child: Text(
//                     survey.surveyDescription,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => SurveyScreen(survey: survey),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.orange, // 글자 색상
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                 ),
//                 child: const Text('참여하기'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:app/design/colors.dart';
import 'package:app/models/survey.dart';
import 'package:flutter/material.dart';
import 'survey_screen.dart';

class SurveyDetailScreen extends StatelessWidget {
  final Survey survey;

  const SurveyDetailScreen({super.key, required this.survey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          survey.surveyTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '설명:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100, // 설명 박스의 높이를 줄임
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Text(
                survey.surveyDescription,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(), // 버튼을 아래쪽으로 밀어줌
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SurveyScreen(survey: survey),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      const Color(0xFF3B2D2D), // Button background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 트렌디한 모서리 반경
                  ),
                  elevation: 5, // 그림자 효과
                ),
                child: const Text(
                  '참여하기',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20), // 버튼과 하단의 간격을 줌
          ],
        ),
      ),
    );
  }
}
