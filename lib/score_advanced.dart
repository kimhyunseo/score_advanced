import 'dart:io';

class Score {
  int score;
  Score(this.score);

  void showInfo() {
    print("점수: $score");
  }
}

void loadStudentData(String filePath) {
  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();
    List<StudentScore> studentsList = [];

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);

      studentsList.add(StudentScore(name, score));
    }

    // print(studentsList);
    for (var a in studentsList) {
      print("${a.name}, ${a.score}");
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return;
}

class StudentScore extends Score {
  String name;
  StudentScore(this.name, int score) : super(score);
  @override
  void showInfo() {
    print("이름: $name, 점수: $score");
  }

  @override
  String toString() {
    return "($name $score)";
  }
}

var students = 'lib/students.txt';

void main() {
  // var s = Score(90);
  // s.showInfo();

  // var ss = StudentScore("홍길동", 68);
  // ss.showInfo();

  loadStudentData(students);
}
