import 'package:score_advanced/score/check_score.dart';
import 'package:score_advanced/score/load_student.dart';

void mainScore() {
  var studentsList = loadStudentData('lib/score/students.txt');
  checkStudent(studentsList);
}
