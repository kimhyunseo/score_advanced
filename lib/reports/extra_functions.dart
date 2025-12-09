import 'dart:io';
import 'package:score_advanced/score/load_student.dart';
import 'package:score_advanced/score/save_result.dart';
import 'package:score_advanced/score/score_class.dart';

// 1번 우수 학생 출력하기
void goodStudent() {
  var studentsList = loadStudentData('lib/reports/students_list.txt');
  StudentScore goodStudent = studentsList.reduce(
    (a, b) => a.score > b.score ? a : b,
  );
  print("우수생: ${goodStudent.name} (점수: ${goodStudent.score})");
}

// 2.전체 평균 점수 출력하기
void averageScore() {
  var studentsList = loadStudentData('lib/reports/students_list.txt');
  double sum =
      studentsList.map((s) => s.score).reduce((a, b) => a + b) /
      studentsList.length;
  print("전체 평균 점수: ${sum.toStringAsFixed(1)}");
}

// 3. 추가 기능 : 사용자의 입력값을 받아 학생 이름과 점수 추가하기
void saveStudent(String path) {
  String name = "";
  int inScore = 0;
  try {
    while (true) {
      print("추가할 학생의 이름을 작성해주세요.");
      String? inputName = stdin.readLineSync();

      if (inputName != null && inputName.trim().isNotEmpty) {
        name = inputName.trim();
        break;
      } else {
        print("올바른 이름이 입력되지 않았습니다. 다시 입력해주세요");
      }
    }
    while (true) {
      print("$name 학생의 점수를 입력해주세요.");
      String? inputScore = stdin.readLineSync();

      try {
        if (inputScore == null) {
          print("점수를 입력해주세요.");
          continue;
        }
        inScore = int.parse(inputScore.trim());
        break;
      } on Exception catch (e) {
        print("숫자로 입력해주세요. (예:80) : $e");
      }
    }

    List<StudentScore> studentsList = loadStudentData(path);
    studentsList.add(StudentScore(name, inScore));
    String data = studentsList.map((s) => "${s.name},${s.score}").join('\n');
    saveResults(data, path);
  } on Exception catch (e) {
    print("오류가 발생했습니다 : $e");
  }
}
