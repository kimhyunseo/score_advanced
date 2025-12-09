// 1. Score와 StudentScore 클래스를 구성하기

// 1-1. 점수를 표현하는 Score 클래스를 정의
class Score {
  int score;
  Score(this.score);

  void showInfo() {
    print("점수: $score");
  }
}

// 1-2. 이를 상속받아 학생의 정보를 포함하는 StudentScore 클래스를 구현
class StudentScore extends Score {
  String name;
  StudentScore(this.name, int score) : super(score);
  @override
  // 1-3. 부모 메서드를 재정의, 이름과 점수 출력
  void showInfo() {
    print("이름: $name, 점수: $score");
  }

  @override
  String toString() {
    return "($name $score)";
  }
}
