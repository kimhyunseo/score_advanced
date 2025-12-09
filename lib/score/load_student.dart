import 'dart:io';
import 'package:score_advanced/score/score_class.dart';

// 2. 파일로부터 데이터 읽어오기 기능

// 2-1. students.txt 파일에서 학생들 점수 목록을 받아옴

List<StudentScore> loadStudentData(String path) {
  List<StudentScore> studentsList = [];
  try {
    final file = File(path);
    final lines = file.readAsLinesSync();

    // 2-2. split() 메서드를 사용하여 CSV 데이터를 분리한 후 변수(name, score)에 선언

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);

      studentsList.add(StudentScore(name, score));
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return studentsList;
}
