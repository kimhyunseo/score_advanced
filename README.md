# 성적 분석 프로그램

Dart 언어의 **객체 지향 문법(상속)** 과 **파일 입출력**, **컬렉션**을 활용하여 구현한 학생 성적 분석 콘솔 프로그램입니다.
기본적인 성적 조회 및 저장 기능과 데이터 분석 리포트 기능을 포함하고 있습니다.

## 프로젝트 구조

과제의 요구사항에 따라 기능을 모듈화하여 `score`(필수 과제)와 `reports`(도전 과제)로 분리하였습니다.

```text
📦 project_root
├── 📂 bin
│   └── 📄 score_advanced.dart            # [Entry Point] 프로그램 시작 및 메뉴 분기
├── 📂 lib
│   ├── 📂 score                # [Essential] 필수 과제 구현
│   │   ├── 📄 score_class.dart       # Score, StudentScore 클래스 (상속 구현)
│   │   ├── 📄 load_student.dart      # students.txt CSV 파싱 및 로드
│   │   ├── 📄 check_score.dart       # 특정 학생 성적 조회 로직
│   │   ├── 📄 save_result.dart       # 결과 파일(result.txt) 저장 로직
│   │   ├── 📄 main_score.dart        # 필수 과제 흐름 관리
│   │   ├── 📄 students.txt           # (Input) 학생 성적 데이터
│   │   └── 📄 result.txt             # (Output) 결과 저장 파일
│   └── 📂 reports              # [Challenge] 도전 과제 구현
│       ├── 📄 plus_score.dart        # 도전 과제 기능 관리자 (Menu)
│       ├── 📄 extra_functions.dart   # 우수생 선발, 평균 계산, 새로운 학생 저장 알고리즘 구현
│       ├── 📄 random_art.dart        # 랜덤 ASCII Art
│       └── 📄 students_list.txt      # 추가 학생 성적 데이터
└── 📄 README.md
```

---

## 구현 기능

### 필수 과제 - lib/score

#### 1. 클래스 상속 및 오버라이딩 (score_class.dart)

Score 클래스를 정의하고 이를 상속받는 StudentScore 클래스 구현
@override 사용하여 showInfo() 메서드 재정의

#### 2. 파일 데이터 로드 (load_student.dart)

students.txt의 CSV 데이터(이름,점수)를 읽어 List<StudentScore>로 변환
예외 처리를 통해 파일이 없거나 형식이 잘못된 경우를 방지

#### 3. 성적 조회 (check_score.dart)

사용자 입력을 받아 특정 학생(예: 홍길동)의 점수를 검색 및 출력
잘못된 입력에 대한 재입력 요구 로직 구현

#### 4. 결과 파일 저장 (save_result.dart)

조회된 결과를 result.txt 파일에 형식(이름: 홍길동, 점수: 90)에 맞춰 저장

### 도전 과제 (Challenge) - lib/reports

#### 1. 성적 우수생 선발 (extra_functions.dart - goodStudent)

reduce를 사용하여 가장 높은 점수의 학생을 자동 선발

#### 2. 전체 평균 계산 (extra_functions.dart - averageScore)

reduce를 활용하여 전체 학생의 점수 합계 및 평균(소수점 제어) 계산

#### 추가 기능 : 학생 데이터 추가 (extra_functions.dart - saveStudent)

사용자로부터 새로운 학생 이름과 점수를 입력받아 데이터 파일에 추가
try-catch와 while문을 사용하여 유효한 이름과 숫자(점수)가 입력될 때까지 검증하는 방어 코드 구현

#### 추가 기능 : 랜덤 아트 생성 (random_art.dart)

프로그램 실행의 재미를 더하기 위한 시각적 요소 추가

---

## 실행 방법

터미널에서 프로젝트 루트 경로로 이동한 후 아래 명령어를 입력합니다.

```Bash
dart run
```

> 기본적으로 **필수 과제**가 실행됩니다. 도전 과제 기능을 확인하려면 bin/score_advanced.dart 파일에서 주석을 해제해주세요.

```Dart
// bin/score_advanced.dart
void main() {
mainScore();
// plusScore(); // 주석 해제 시 도전 과제 기능 실행
}
```

---

## 트러블 슈팅 (Trouble Shooting)

개발 과정에서 마주친 문제와 해결 과정입니다.

List<Object\> 활용: List에는 기본 타입(String, int)뿐만 아니라 커스텀 객체(StudentScore)도 담을 수 있음을 이해하고 적용하여 데이터를 객체 단위로 관리했습니다.

toString 오버라이딩: 객체 출력 시 `Instance of...`가 나오는 문제를 해결하기 위해 `toString()`을 재정의(@override)하여 데이터가 직관적으로 보이도록 개선했습니다.

검색 로직 최적화: for문 사용 시 "유효하지 않은 값" 메시지가 중복 출력되는 문제를 `where`와 `firstOrNull`을 사용하여 단일 결과만 깔끔하게 반환하도록 로직을 수정했습니다.

reduce를 통한 객체 반환: 점수(int)를 비교하되 결과값은 학생 객체(StudentScore) 전체를 반환해야 하는 로직을 reduce 고차 함수를 활용하여 구현했습니다.
