// import 'package:app/screen/mypage.dart';
// import 'package:app/screen/survey_detail.dart';
// import 'package:app/screen/survey_screen.dart';
// import 'package:app/widget/bottomNavbar.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             // Category Tabs
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: const <Widget>[
//                   CategoryTab(title: '전체'),
//                   CategoryTab(title: '라이프'),
//                   CategoryTab(title: '경제'),
//                   CategoryTab(title: '사용경험'),
//                 ],
//               ),
//             ),
//             // Survey List
//             Expanded(
//               child: ListView(
//                 children: <Widget>[
//                   SurveyCard(
//                     title: '식품 선호도 조사',
//                     duration: '3분',
//                     reward: '총 25,000원',
//                     deadline: 'D-7',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const SurveyDetailScreen(title: '식품 선호도 조사'),
//                         ),
//                       );
//                     },
//                   ),
//                   SurveyCard(
//                     title: '동아리 인지도 조사',
//                     duration: '3분',
//                     reward: '기프티콘',
//                     deadline: '54/100',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const SurveyDetailScreen(title: '동아리 인지도 조사'),
//                         ),
//                       );
//                     },
//                   ),
//                   SurveyCard(
//                     title: '운동 루틴',
//                     duration: '4분',
//                     reward: '포인트',
//                     deadline: 'D-3',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const SurveyDetailScreen(title: '운동 루틴'),
//                         ),
//                       );
//                     },
//                   ),
//                   SurveyCard(
//                     title: '생활 습관',
//                     duration: '3분',
//                     reward: '인당 250원',
//                     deadline: 'D-7',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const SurveyDetailScreen(title: '생활 습관'),
//                         ),
//                       );
//                     },
//                   ),
//                   SurveyCard(
//                     title: '교내 애로사항',
//                     duration: '3분',
//                     reward: '인당 500원',
//                     deadline: 'D-7',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const SurveyDetailScreen(title: '교내 애로사항'),
//                         ),
//                       );
//                     },
//                   ),
//                   SurveyCard(
//                     title: '주류 이용형태 조사',
//                     duration: '3분',
//                     reward: '25,000원',
//                     deadline: '100/100',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               const SurveyDetailScreen(title: '주류 이용형태 조사'),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(currentIndex: 1),
//     );
//   }
// }

// class CategoryTab extends StatelessWidget {
//   final String title;
//   const CategoryTab({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Chip(
//         label: Text(
//           title,
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.brown,
//       ),
//     );
//   }
// }

// class SurveyCard extends StatelessWidget {
//   final String title;
//   final String duration;
//   final String reward;
//   final String deadline;
//   final VoidCallback onTap;

//   const SurveyCard({
//     super.key,
//     required this.title,
//     required this.duration,
//     required this.reward,
//     required this.deadline,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('소요시간: $duration'),
//                   Text('리워드: $reward'),
//                   Text('마감: $deadline'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:app/design/colors.dart';
import 'package:app/models/survey.dart';
import 'package:app/screen/survey_detail.dart';
import 'package:app/services/api_service.dart';
import 'package:app/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            // Category Tabs
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CategoryTab(title: '전체'),
                  CategoryTab(title: '라이프'),
                  CategoryTab(title: '경제'),
                  CategoryTab(title: '사용경험'),
                ],
              ),
            ),
            // Survey List
            Expanded(
              child: FutureBuilder<List<Survey>>(
                future: apiService
                    .getSurveyList(), // getSurveyList() 메서드를 추가하여 목록을 가져옵니다.
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No survey data found.'));
                  } else {
                    List<Survey> surveys = snapshot.data!;
                    return ListView.builder(
                      itemCount: surveys.length,
                      itemBuilder: (context, index) {
                        Survey survey = surveys[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SurveyCard(
                            title: survey.surveyTitle,
                            duration:
                                '${survey.totalQuestions}분', // 예시로 totalQuestions를 duration으로 사용
                            reward: survey.reward,
                            deadline: 'D-7', // 임시로 D-7 사용
                            imageUrl: 'assets/thumbnail$index.jpg',
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          SurveyDetailScreen(survey: survey),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  const CategoryTab({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColors.secondary,
      ),
    );
  }
}

// class SurveyCard extends StatelessWidget {
//   final String title;
//   final String duration;
//   final String reward;
//   final String deadline;
//   final VoidCallback onTap;

//   const SurveyCard({
//     super.key,
//     required this.title,
//     required this.duration,
//     required this.reward,
//     required this.deadline,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('소요시간: $duration'),
//                   Text('리워드: $reward'),
//                   Text('마감: $deadline'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SurveyCard extends StatelessWidget {
  final String title;
  final String duration;
  final String reward;
  final String deadline;
  final VoidCallback onTap;
  final String imageUrl;

  const SurveyCard({
    super.key,
    required this.title,
    required this.duration,
    required this.reward,
    required this.deadline,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 358,
        height: 134,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('소요 시간: $duration',
                      style: const TextStyle(color: AppColors.third)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('리워드: $reward',
                      style: const TextStyle(color: AppColors.third)),
                  const SizedBox(height: 4),
                  Text('마감: $deadline',
                      style: const TextStyle(color: AppColors.third)),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Example placeholder for image
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey, // Placeholder color for image
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
