// import 'dart:convert';

// import 'package:http/http.dart' as http; // <-- http라는 네임스페이스로 설정

// class ApiService {
//   final String baseUrl =
//       "http://10.0.2.2:3000"; //일반적으로 Android 에뮬레이터에서는 10.0.2.2를 로컬 호스트 주소로 사용한다.

//   void getPath(int surveyId) async {
//     final url =
//         Uri.parse('$baseUrl/survey/$surveyId'); // <-- Uri.parse()로 url을 파싱
//     final response = await http.get(
//         url); // <-- 비동기 , 비동기 함수 내에서만 사용 가능 : await로 인해 response 변수에는 response 자료형이 들어감
//     print('url: $url');

//     if (response.statusCode == 200) {
//       final List<dynamic> dataSet = jsonDecode(
//           response.body); // <-- jsonDecode()로 response.body를 json으로 변환
//       for (var data in dataSet) {
//         print(data);
//       }

//       return;
//     }
//     throw Error();
//   }
// }
// import 'package:app/models/survey.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // Survey 모델 클래스 파일을 임포트합니다.

// class ApiService {
//   final String baseUrl =
//       "http://10.0.2.2:3000"; // 일반적으로 Android 에뮬레이터에서는 10.0.2.2를 로컬 호스트 주소로 사용한다.

//   Future<Survey> getSurvey(int surveyId) async {
//     final url = Uri.parse('$baseUrl/survey/$surveyId'); // Uri.parse()로 url을 파싱
//     print('url: $url'); // URL 출력

//     final response = await http.get(
//         url); // 비동기, 비동기 함수 내에서만 사용 가능: await로 인해 response 변수에는 response 자료형이 들어감

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData =
//           jsonDecode(response.body); // jsonDecode()로 response.body를 json으로 변환
//       Survey survey = Survey.fromJson(jsonData); // Survey 객체로 변환

//       // Survey 데이터 출력
//       print('Survey Title: ${survey.surveyTitle}');
//       print('Survey Description: ${survey.surveyDescription}');
//       for (var question in survey.questions) {
//         print('Question: ${question.question}');
//         print('Options: ${question.options}');
//       }
//       return survey;
//     } else {
//       throw Exception('Failed to load survey');
//     }
//   }
// }

import 'package:app/models/survey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl =
      "http://10.0.2.2:3000"; // 일반적으로 Android 에뮬레이터에서는 10.0.2.2를 로컬 호스트 주소로 사용한다.

  Future<List<Survey>> getSurveyList() async {
    final url = Uri.parse('$baseUrl/surveys'); // 설문조사 목록을 가져오는 엔드포인트
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Survey.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load survey list');
    }
  }

  Future<Survey> getSurvey(int surveyId) async {
    final url = Uri.parse('$baseUrl/survey/$surveyId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      return Survey.fromJson(jsonData);
    } else {
      throw Exception('Failed to load survey');
    }
  }
}
