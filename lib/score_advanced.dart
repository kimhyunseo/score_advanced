import 'dart:io';

class Score {
  int score;
  Score(this.score);

  void showInfo() {
    print("점수: $score");
  }
}

void loadStudentData(String input) {
  try {
    final file = File('lib/students.txt');
    final lines = file.readAsLinesSync();
    List<StudentScore> studentsList = [];

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);

      studentsList.add(StudentScore(name, score));
    }

    var result = studentsList
        .where((element) => element.name == input)
        .firstOrNull;

    if (result != null) {
      print("이름: ${result.name}, 점수: ${result.score}");
    } else if (result == null) {
      print("유효하지 않은 이름입니다.");
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

void saveResults(String content) {
  try {
    final file = File('lib/result.txt');
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}

void main() {
  print("어떤 학생의 점수를 확인하시겠습니까?");
  String? input = stdin.readLineSync();
  loadStudentData(input!);
}
