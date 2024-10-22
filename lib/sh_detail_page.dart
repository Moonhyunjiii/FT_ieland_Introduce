import 'package:flutter/material.dart';

class SHDetailPage extends StatefulWidget {
  final String name;
  final int age;
  final String imagePath;
  final int likeCount; // 좋아요 수를 받아오는 변수 추가

  const SHDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.age,
    required this.likeCount, // 생성자에 추가
  });

  @override
  State<SHDetailPage> createState() => _SHDetailPageState();
}

class _SHDetailPageState extends State<SHDetailPage> {
  late int likeCount; // 상태 변수로 변경

  @override
  void initState() {
    super.initState();
    likeCount = widget.likeCount; // 전달받은 좋아요 수로 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "산업디자인",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "#여행 #디자인 #자동차 #빈티지",

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // 좋아요 버튼
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              likeCount++; // 버튼을 누를 때마다 좋아요 수 증가
                            });
                          },
                          icon: const Icon(Icons.favorite, color: Colors.white),
                          label: const Text(
                            '좋아요',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$likeCount',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // 추가 정보
                  Column(
                    children: [
                      buildDetailRow("생일", "11월 11일"),
                      buildDetailRow("MBTI", "ENFP"),
                      buildDetailRow("역할", "시사📖"),
                      buildDetailRow("희망직무", "디자이너, 기획"),
                      buildDetailRow("한마디", "저는 커서 소방차가 될래요"),

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
