import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCoworkPage extends StatelessWidget {
  TeamCoworkPage({super.key});

  // 아이콘 이미지 리스트와 각각의 URL, 제목 및 설명
  var iconList = [
    {
      "icon": "images/figma_icon.png",
      "url": "https://www.figma.com/files/team/1398144569210633302/project/291420179?fuid=1402814263637571135",
      "title": "Figma",
      "subtitle": "팀 디자인 관리 Tool",
    },
    {
      "icon": "images/notion_icon.png",
      "url": "https://www.notion.so/FT-ie-land-c14643e952884a6b904c2b2e88364634",
      "title": "Notion",
      "subtitle": "팀 문서 관리 Tool",
    },
    {
      "icon": "images/git_icon.png",
      "url": "https://github.com/Moonhyunjiii/FT_ieland_Introduce",
      "title": "GitHub",
      "subtitle": "프로젝트 코드 관리 Tool",
    },
  ];

  // URL 실행 함수
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "우리의 협업 Tool",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          // 상단에 이미지를 추가하는 부분
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              'images/cowork_icon.jpg', // 상단에 표시할 이미지 경로
              width: double.infinity, // 화면 전체 너비로 설정
              height: 200, // 이미지 높이
              fit: BoxFit.cover, // 이미지를 화면에 맞게 조절
            ),
          ),
          const SizedBox(height: 16), // 이미지와 리스트뷰 사이에 간격 추가

          // ListView.builder를 아래로 내리고 스크롤 가능하게 만들기 위해 Expanded 사용
          Expanded(
            child: ListView.builder(
              itemCount: iconList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _launchURL(iconList[index]['url']!),
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            iconList[index]['icon']!,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 16), // 아이콘과 텍스트 사이에 간격 추가
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  iconList[index]['title']!, // 제목 표시
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4), // 제목과 설명 사이 간격
                                Text(
                                  iconList[index]['subtitle']!, // 설명 표시
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
