import 'package:flutter/material.dart';

class HJDetailPage extends StatefulWidget {
  final String name;
  final int age;
  final String imagePath;
  final int likeCount; // 좋아요 수를 받아오는 변수 추가

  const HJDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.age,
    required this.likeCount, // 생성자에 추가
  });

  @override
  State<HJDetailPage> createState() => _HJDetailPageState();
}

class _HJDetailPageState extends State<HJDetailPage> {
  late int likeCount; // 상태 변수로 변경

  @override
  void initState() {
    super.initState();
    likeCount = widget.likeCount; // 전달받은 좋아요 수로 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 이미지
            Image.asset(
              widget.imagePath,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // 이름 및 세부 정보
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.name}, ${widget.age}",
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "컴퓨터정보공학부/문화콘텐츠",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "#침대좋아요 #운동좋아요 #취업하고싶어요",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // 좋아요 버튼
                  Row(
                    children: [
                      // '좋아요' 버튼 박스
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(304, 45),  // width: 304px, height: 45px
                            backgroundColor: const Color(0xFFFF166F), // 배경색: #FF166F
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),  // border-radius: 10px
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                          onPressed: () {
                            setState(() {
                              likeCount++; // 버튼을 누를 때마다 좋아요 수 증가
                            });
                          },
                          icon: const Icon(Icons.favorite, color: Colors.white),
                          label: const Text(
                            '좋아요',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NanumGothic',  // 폰트 패밀리 이름
                              fontWeight: FontWeight.w700,  // Bold 폰트 적용
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // likeCount 박스
                      Container(
                        width: 45,   // width: 45px
                        height: 45,  // height: 45px
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF166F), // 배경색: #FF166F
                          borderRadius: BorderRadius.circular(10), // border-radius: 10px
                        ),
                        child: Center(
                          child: Text(
                            '$likeCount',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white, // 흰색 텍스트
                              fontFamily: 'NanumGothic',  // 폰트 패밀리 이름
                              fontWeight: FontWeight.w700,  // Bold 폰트 적용
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // 추가 정보
                  Column(
                    children: [
                      buildDetailRow("생일", "12월 13일"),
                      buildDetailRow("MBTI", "ISFP"),
                      buildDetailRow("역할", "규알✅"),
                      buildDetailRow("희망직무", "백엔드/IT기획"),
                      buildDetailRow("한마디", "안녕하세요! dx 프로젝트 화이팅~"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 세부 정보 행 구성 함수
  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
