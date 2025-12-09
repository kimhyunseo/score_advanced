import 'dart:io';
import 'package:score_advanced/reports/extra_functions.dart';
import 'package:score_advanced/reports/random_art.dart';

void plusScore() {
  print(
    "메뉴를 선택하세요:\n1. 우수생 출력\n\n2. 전체 평균 점수 출력\n\n4. 학생과 점수 추가\n\n5. 귀여운 걸 보고 싶나요?\n\n3. 종료",
  );
  while (true) {
    String? input = stdin.readLineSync();
    switch (input) {
      case ("1"):
        {
          // 우수 학생 출력
          goodStudent();
        }
      case ("2"):
        {
          // 평균 점수 출력
          averageScore();
        }
      case ("3"):
        {
          // 학생과 점수 추가
          saveStudent('lib/reports/students_list.txt');
        }
      case ("4"):
        {
          // 랜덤 그림 보기
          print(randomArt());
        }
      case ("5"):
        {
          // 종료
          return;
        }
      default:
        {
          print("유효한 값이 아닙니다");
        }
    }
  }
}
