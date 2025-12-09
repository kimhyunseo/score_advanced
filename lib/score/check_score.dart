import 'dart:io';
import 'package:score_advanced/score/save_result.dart';
import 'package:score_advanced/score/score_class.dart';

void checkStudent(List<StudentScore> studentsList) {
  print("어떤 학생의 점수를 확인하시겠습니까?");

  while (true) {
    // 3-1. 사용자가 "홍길동", "김철수"중 하나를 입력하면 해당 학생의 점수를 계산

    String? input = stdin.readLineSync();
    var result = studentsList
        .where((element) => element.name == input)
        .firstOrNull;

    if (result != null) {
      result.showInfo();
      saveResults(
        "이름: ${result.name}, 점수: ${result.score}",
        "lib/score/result.txt",
      );
      break;
    }
    // 3-2 다른 값이 입력되면 "잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요."를 출력하고 다시 입력을 받음
    else {
      print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
    }
  }
}
