import 'package:score_advanced/score/load_student.dart';
import 'dart:io';

import 'package:score_advanced/score/score_class.dart';

void main() {
  var studentsList = loadStudentData('lib/score/students.txt');
  print("메뉴를 선택하세요:\n1. 우수생 출력\n\n2. 전체 평균 점수 출력\n\n3. 종료");
  while (true) {
    String? input = stdin.readLineSync();
    switch (input) {
      case ("1"):
        {
          StudentScore goodStudent = studentsList.reduce(
            (a, b) => a.score > b.score ? a : b,
          );
          print(goodStudent.name);
        }
      case ("2"):
        {
          double sum =
              studentsList.map((s) => s.score).reduce((a, b) => a + b) /
              studentsList.length;
          print("전체 평균 점수: ${sum.toStringAsFixed(1)}");
        }
      case ("3"):
        {
          return;
        }
      default:
        {
          print("유효한 값이 아닙니다");
        }
    }
  }
}
