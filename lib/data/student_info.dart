/// Student information shown on the Home screen.
class StudentInfo {
  const StudentInfo({
    required this.name,
    required this.program,
    required this.school,
  });

  final String name;
  final String program;
  final String school;
}

const StudentInfo kStudent = StudentInfo(
  name: 'Snyd Jabines',
  program: 'BSIT-3',
  school: 'Cebu Institute of Technology - University',
);
