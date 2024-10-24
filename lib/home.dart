import 'package:flutter/material.dart';
import 'yw_detail_page.dart';
import 'hj_detail_page.dart';
import 'nl_detail_page.dart';
import 'sj_detail_page.dart';
import 'sh_detail_page.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeamGrid(),
    );
  }
}


class TeamGrid extends StatefulWidget {
  @override
  _TeamGridState createState() => _TeamGridState();
}

class _TeamGridState extends State<TeamGrid> {
  final List<Map<String, dynamic>> members = [
    {
      'name': '문현지',
      'homeImage': 'images/현지.png',
      'detailImage': 'images/현지_i.jpg',
      'notifications': '1',
      'page': (String name, String imagePath, int age, int likeCount) =>
          HJDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '27',
      'likeCount': 0
    },
    {
      'name': '김나린',
      'homeImage': 'images/나린.jpg',
      'detailImage': 'images/나린_i.jpg',
      'notifications': '3',
      'page': (String name, String imagePath, int age, int likeCount) =>
          NLDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '24',
      'likeCount': 0
    },
    {
      'name': '도연우',
      'homeImage': 'images/연우.png',
      'detailImage': 'images/연우_i.jpg',
      'notifications': '0',
      'page': (String name, String imagePath, int age, int likeCount) =>
          YWDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '24',
      'likeCount': 0
    },
    {
      'name': '장수진',
      'homeImage': 'images/수진.jpg',
      'detailImage': 'images/수진_i.png',
      'notifications': '2',
      'page': (String name, String imagePath, int age, int likeCount) =>
          SJDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '26',
      'likeCount': 0
    },
    {
      'name': '이상현',
      'homeImage': 'images/상현.png',
      'detailImage': 'images/상현_i.jpg',
      'notifications': '5',
      'page': (String name, String imagePath, int age, int likeCount) =>
          SHDetailPage(name: name, imagePath: imagePath, age: age, likeCount: likeCount),
      'age': '26',
      'likeCount': 0
    },
  ];

  int _selectedNaviIndex = 1; // 기본 선택 인덱스

  // 바텀바 아이템 선택 시 색상 변화 함수
  _onBottomNaviItemTapped(int index) {
    setState(() {
      _selectedNaviIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // 화면을 균일하게 나누기 위해 설정
        children: [
          SizedBox(height: screenHeight * 0.05), // 여백 추가
          const Text(
            'FT ie-land',
            style: TextStyle(
              fontSize: 40,
              color: Color(0xFFFF166F),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: screenWidth * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMemberProfile(context, members[0], screenHeight, screenWidth),
              SizedBox(width: screenWidth * 0.07),
              buildMemberProfile(context, members[1], screenHeight, screenWidth),
            ],
          ),
          buildMemberProfile(context, members[2], screenHeight, screenWidth),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMemberProfile(context, members[3], screenHeight, screenWidth),
              SizedBox(width: screenWidth * 0.07),
              buildMemberProfile(context, members[4], screenHeight, screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMemberProfile(BuildContext context, Map<String, dynamic> member, double screenHeight, double screenWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => member['page'](
              member['name']!,
              member['detailImage']!,
              int.parse(member['age']!),
              member['likeCount'],
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: member['name']!,
                child: CircleAvatar(
                  radius: screenHeight * 0.08,
                  backgroundImage: AssetImage(member['homeImage']!),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: screenHeight * 0.08,
                      color: Color(0xFFFF166F),
                    ),
                    Positioned(
                      child: Text(
                        member['notifications']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            member['name']!,
            style: const TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}