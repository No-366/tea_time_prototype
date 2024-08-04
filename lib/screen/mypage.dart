// import 'package:app/screen/home_screen.dart';
// import 'package:app/screen/survey_screen.dart';
// import 'package:app/widget/bottomNavbar.dart';
// import 'package:flutter/material.dart';

// class MyPageScreen extends StatelessWidget {
//   const MyPageScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Page'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     '홍길동',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text('포인트: 1000p'),
//                   Text('보유 기프티콘: 5개'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               '당첨내역',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView(
//                 children: <Widget>[
//                   ListTile(
//                     title: const Text('기프티콘'),
//                     trailing: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.orange, // 텍스트 색상
//                       ),
//                       child: const Text('상세 내역'),
//                     ),
//                   ),
//                   ListTile(
//                     title: const Text('기프티콘'),
//                     trailing: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.orange, // 텍스트 색상
//                       ),
//                       child: const Text('상세 내역'),
//                     ),
//                   ),
//                   ListTile(
//                     title: const Text('기프티콘'),
//                     trailing: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.orange, // 텍스트 색상
//                       ),
//                       child: const Text('상세 내역'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(currentIndex: 0),
//     );
//   }
// }

import 'package:app/design/colors.dart';
import 'package:app/screen/home_screen.dart';
import 'package:app/screen/survey_screen.dart';
import 'package:app/widget/bottomNavbar.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page',
            style: TextStyle(color: AppColors.third, fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // User Information
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F2F2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/thumbnail3.jpg'), // 예시 이미지
                  ),
                  SizedBox(height: 10),
                  Text(
                    '홍길동',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '포인트: 1000p',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.third,
                    ),
                  ),
                  Text(
                    '보유 기프티콘: 5개',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.third,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Menu Options
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.list_alt),
                    title: const Text('당첨 내역'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.third,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('기록보기'),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_box),
                    title: const Text('설문 참여 내역'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.third,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('기록보기'),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.card_giftcard),
                    title: const Text('보유 기프티콘'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.third,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('기록보기'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
