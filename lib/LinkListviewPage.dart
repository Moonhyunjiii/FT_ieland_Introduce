import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // URL Launcher 패키지 임포트

class LinkListviewPage extends StatelessWidget {
  LinkListviewPage({super.key});

  // 리스트에 표시될 항목 이름
  final List<String> itemList = [
    "도연우님의 말말말",
    "문현지님의 열정파워",
    "김나린님의 추억앨범",
    "장수진님의 우주여행",
    "이상현님의 주차장",
  ];

  // 각 항목이 이동할 URL 리스트
  final List<String> linkList = [
    "https://www.instagram.com/d.dusdn_/profilecard/?igsh=MW16M3Q0b3MxbjdoeQ==",
    "https://www.instagram.com/hyunji._.moon/profilecard/?igsh=MTI1NWR6YnN1ejJtMw==",
    "https://www.instagram.com/linakim_nalin/profilecard/?igsh=M3RuZG1rNTU1bmph",
    "https://www.instagram.com/tnwdlsdl/profilecard/?igsh=MXIzMWN4bjBxMzFmcQ==",
    "https://www.instagram.com/got_chahh/profilecard/?igsh=MWNyMjIyNnh4M2V2bQ==",
  ];

  // 각 항목에 표시될 로컬 이미지 파일 경로 리스트
  final List<String> imageList = [
    "images/horse.png",
    "images/fire.png",
    "images/camera.png",
    "images/rocket.png",
    "images/car.png",
  ];

  // 각 항목에 맞는 설명을 담은 리스트
  final List<String> descriptionList = [
    "도연우님의 최신 작품을 감상할 수 있어요.",
    "문현지님의 일상을 확인해 보세요!",
    "김나린님의 패션 인스타그램을 구경해 보세요.",
    "장수진님의 특별한 순간들을 확인해 보세요!",
    "이상현님의 여행 사진이 가득한 인스타그램입니다.",
  ];

  // 외부 URL을 여는 함수
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // URL을 Uri로 변환
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri'; // 실행할 수 없는 경우 예외 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // 전체 배경색을 하얀색으로 설정
      appBar: AppBar(
        title: Text(
          '인스타그램 링크',
          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFF166F),  // 앱바 색상 변경
      ),
      body: LayoutBuilder(  // 반응형 레이아웃 설정
        builder: (context, constraints) {
          return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _launchURL(linkList[index]); // 항목 클릭 시 해당 링크로 이동
                },
                child: Card(
                  color: Colors.white,  // 카드 배경색을 회색으로 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,  // 카드의 그림자 깊이 증가
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,  // 이미지와 텍스트가 컨테이너의 중앙에 정렬
                      children: [
                        // 로컬 이미지 표시, 반응형으로 크기 조정
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            imageList[index],
                            width: constraints.maxWidth * 0.22,  // 화면 크기에 맞춰 이미지 크기 조절
                            height: constraints.maxWidth * 0.22,  // 이미지 높이 조절
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20), // 이미지와 텍스트 사이 간격
                        Expanded(  // 텍스트 영역이 가변적으로 크기 변경되도록 설정
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemList[index],
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                descriptionList[index], // 항목마다 다른 설명을 표시
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

