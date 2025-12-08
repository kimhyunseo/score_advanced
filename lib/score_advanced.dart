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

    // for (var a in studentsList) {
    //   print("${a.name}, ${a.score}");
    // }
    for (var a in studentsList) {
      if (input == a.name) {
        print("${a.name}, ${a.score}");
      } else if ((input != a.name)) {
        print("유효하지 않은 이름입니다.");
      }
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
  // var s = Score(90);
  // s.showInfo();

  // var ss = StudentScore;
  // ss.showInfo();
  print("어떤 학생의 점수를 확인하시겠습니까?");
  String? input = stdin.readLineSync();
  loadStudentData(input!);
  saveResults("예시 콘텐츠11");
}
