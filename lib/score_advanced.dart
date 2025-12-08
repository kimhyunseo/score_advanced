import 'dart:io';

class Score {
  int score;
  Score(this.score);

  void showInfo() {
    print("점수: $score");
  }
}

class StudentScore extends Score {
  String name;
  StudentScore(this.name, int score) : super(score);
  @override
  void showInfo() {
    super.showInfo();
    print("추가된 내용");
  }
}

void main() {
  var s = Score(90);
  s.showInfo();
}
