import 'package:flutter/material.dart';
import 'team_cowork_page.dart';
import 'LinkListviewPage.dart';
import 'home.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({super.key});

  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {
  int _selectedNaviIndex = 1; // 기본 선택 인덱스

  // 페이지 리스트
  final List<Widget> pages = [
    LinkListviewPage(), // 인스타그램 페이지
    HomeTitle(), // 메인화면 페이지
    TeamCoworkPage(), // 노션 페이지
  ];

  // 바텀바 아이템 선택 시 색상 변화 및 페이지 변경
  void _onBottomNaviItemTapped(int index) {
    setState(() {
      _selectedNaviIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedNaviIndex], // 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedNaviIndex,
        selectedItemColor: Color(0xFFFF166F), // 선택된 아이콘 색상
        unselectedItemColor: Color(0xFFD9D9D9), // 선택되지 않은 아이콘 색상
        backgroundColor: Colors.white,
        onTap: _onBottomNaviItemTapped, // 탭 시 페이지 변경
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // UI에 맞는 아이콘 설정
            label: 'SNS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // UI에 맞는 아이콘 설정
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // UI에 맞는 아이콘 설정
            label: 'TEAM INFO',
          ),
        ],
      ),
    );
  }
}