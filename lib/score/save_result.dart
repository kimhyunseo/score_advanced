import 'dart:io';

// 4.  프로그램 종료 후, 결과를 파일에 저장하는 기능

void saveResults(String content, String path) {
  try {
    final file = File(path);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}
