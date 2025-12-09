import 'package:score_advanced/score/score_class.dart';

void goodStudent(List<StudentScore> studentsList) {
  StudentScore goodStudent = studentsList.reduce(
    (a, b) => a.score > b.score ? a : b,
  );
  print("우수생: ${goodStudent.name} (점수: ${goodStudent.score})");
}

void averageScore(List<StudentScore> studentsList) {
  double sum =
      studentsList.map((s) => s.score).reduce((a, b) => a + b) /
      studentsList.length;
  print("전체 평균 점수: ${sum.toStringAsFixed(1)}");
}
