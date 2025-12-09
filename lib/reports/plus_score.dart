import 'package:score_advanced/reports/extra_functions.dart';
import 'package:score_advanced/score/load_student.dart';
import 'dart:io';

void main() {
  var studentsList = loadStudentData('lib/score/students.txt');
  print("메뉴를 선택하세요:\n1. 우수생 출력\n\n2. 전체 평균 점수 출력\n\n3. 종료\n\n4. 귀여운 걸 보고 싶나요?");
  while (true) {
    String? input = stdin.readLineSync();
    switch (input) {
      case ("1"):
        {
          // 우수 학생 출력
          goodStudent(studentsList);
        }
      case ("2"):
        {
          // 평균 점수 출력
          averageScore(studentsList);
        }
      case ("3"):
        {
          // 종료
          return;
        }
      case ("4"):
        {
          print(r'''
.　/)/) 　 ∧,,∧
.／・　 ﾐ(＾ο＾)
(＿ノ＼　ﾐ⊂　)
　　　(　 .しﾉ⌒)～
　　　 .ＵJ~ＵJ
''');
        }
      default:
        {
          print("유효한 값이 아닙니다");
        }
    }
  }
}
