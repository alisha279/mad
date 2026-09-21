void printWelcome(String appName) {
  print('=== $appName ===');
}

String generateCode(String title) {
  return title.substring(0, 2).toUpperCase() + '101';
}

int safeLength(String? email) {
  return email?.length ?? 0;
}

List<String>? keepNullable(List<String>? notes) {
  return notes;
}

void main() {
  // ---------- Part 1 ----------

  printWelcome('Course Roster Manager');


  // ---------- Part 2 ----------

  const int maxCapacity = 4;

  final DateTime createdAt = DateTime.now();

  String courseTitle = 'CS201: Mobile App Development';
  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;

  List<String> enrolledStudents = [
    'Aiden',
    'Maria',
    'Jamal',
  ];

  Set<String> waitlist = {
    'Priya',
    'Noah',
  };

  Map<String, int> attendanceCount = {
    'Aiden': 3,
    'Maria': 4,
    'Jamal': 2,
  };

  print(
    '$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}',
  );


  // ---------- Part 3 ----------

  String? instructorEmail;

  print(instructorEmail ?? 'TBA');

  late String enrollmentCode;

  enrollmentCode = generateCode(courseTitle);

  print('Enrollment code: $enrollmentCode');

  safeLength(instructorEmail);


  // ---------- Part 4 ----------

  String rawNames = ' Aiden , maria ,JAMAL , Priya ';

  List<String> cleanNames = [];

  for (String name in rawNames.split(',')) {
    cleanNames.add(name.trim());
  }

  String courseDescription = '''
Course: $courseTitle
Credit Hours: $creditHours
Created At: $createdAt
Students: $cleanNames
''';

  courseDescription.trim();

  String seatsSummary =
      'Seats left: ${capacity - enrolledStudents.length}';

  seatsSummary.trim();


  // ---------- Part 5 ----------

  int fullGroups = enrolledStudents.length ~/ 3;

  int leftover = enrolledStudents.length % 3;

  print(
    'Full groups of 3: $fullGroups, leftover: $leftover',
  );

  Object formInput = 'twenty-two';

  if (formInput is String) {
    print('This is text!');
  }

  if (formInput is! int) {
    String typeMessage = 'This is not an integer.';
    typeMessage.trim();
  }

  var report = StringBuffer()
    ..write('Report: $courseTitle')
    ..write(' | Cap: $capacity')
    ..write(' | Roster: ${enrolledStudents.length}');

  print(report.toString());

  List<String>? extraNotes;

  extraNotes = keepNullable(extraNotes);

  extraNotes?..add('Room change pending');

  print('Extra notes: $extraNotes');

  int? bonusSeats;

  bonusSeats ??= 0;

  print('Bonus seats: $bonusSeats');


  // ---------- Part 6 ----------

  isOpen = enrolledStudents.length < capacity;

  if (isOpen && enrolledStudents.length < capacity) {
    print("You're in! Welcome aboard.");
  } else {
    print('Course is full.');
  }

  int enrollmentStatusCode = 200;

  switch (enrollmentStatusCode) {
    case 200:
      print('Enrolled');
      break;

    case 404:
      print('Course not found');
      break;

    default:
      print('Unknown error');
      break;
  }

  String statusTag = isOpen ? 'OPEN' : 'FULL';

  print(statusTag);


  // ---------- Part 7 ----------

  for (String student in enrolledStudents) {
    print(student);
  }

  attendanceCount.forEach((name, count) {
    print('$name: $count');
  });

  List<String> announcements = [
    'Welcome to $courseTitle',

    if (!isOpen)
      'Course is FULL — waitlist open',

    for (var student in waitlist)
      'Reminder: $student, please confirm attendance',
  ];

  for (String announcement in announcements) {
    print(announcement);
  }
}
