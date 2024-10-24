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
        selectedItemColor: const Color(0xFFFF166F), // 선택된 아이콘 색상
        unselectedItemColor: const Color(0xFFD9D9D9), // 선택되지 않은 아이콘 색상
        onTap: _onBottomNaviItemTapped, // 탭 시 페이지 변경
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,  // Bold 버전 적용
          fontFamily: 'NanumGothic',    // Bold 폰트 패밀리
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,  // Regular 버전 적용
          fontFamily: 'NanumGothic',    // Regular 폰트 패밀리
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedNaviIndex == 0 ? 'images/ui1-01.png' : 'images/ui1-02.png',  // 선택 여부에 따라 다른 이미지 표시
              width: 30,
              height: 30,
            ),
            label: 'SNS',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedNaviIndex == 1 ? 'images/ui2-01.png' : 'images/ui2-02.png',  // 선택 여부에 따라 다른 이미지 표시
              width: 30,
              height: 30,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _selectedNaviIndex == 2 ? 'images/ui3-01.png' : 'images/ui3-02.png',  // 선택 여부에 따라 다른 이미지 표시
              width: 30,
              height: 30,
            ),
            label: 'TEAM INFO',
          ),
        ],
      )
    );
  }
}