import 'package:dart_application_3/dart_application_3.dart' as dart_application_3;
import 'dart:io';

void main(List<String> arguments) {
 StudentList studentList = StudentList();
 for (int i = 1; i <= 20; i++) {
      Student student = Student(
        i,
        5, 
        "2-10",
        3.00,
        surname: "Иванов", 
        middle: "Михаил",
        firstName: "Петрович"
      );
      studentList.addStudent(student);
    }
 while(true){
  print ('Выберите действие: \n 1. Просмотр списка студентов \n 2. Добавить студента \n 3. Изменить информацию о студенте \n 4. Удалить студента \n 5. Вывод студента с максимальным/минимальным сред.баллом \n 6. Фильтрация списка студентов \n 7. Вывод общего среднего балла');
  var input = stdin.readLineSync();
  int num = int.parse(input!);
  switch(num){
    case 1: 
    studentList.getStudentList();
    break;
    case 2:
    print('Введите фамилию студента');
    var inputSurname  = stdin.readLineSync();
    print('Введите имя студента');
    var inputMiddle = stdin.readLineSync();
    print('Введите отчество студента');
    var inputLastName = stdin.readLineSync();
    print('Введите возраст студента');
    var inputAge = stdin.readLineSync();
    print('Введите группу студента');
    var inputGroup = stdin.readLineSync();
    print('Введите средний балл студента');
    var inputGrade = stdin.readLineSync();
    studentList.addStudent(Student(studentList.students.length+1, int.parse(inputAge!), inputGroup!, double.parse(inputGrade!), surname: inputSurname, middle: inputMiddle, firstName: inputLastName));
    break;
    case 3:
    print('Введите id студента, которого необходимо изменить');
    var inputUpId = stdin.readLineSync();
    print('Введите фамилию студента');
    var inputUpSurname  = stdin.readLineSync();
    print('Введите имя студента');
    var inputUpMiddle = stdin.readLineSync();
    print('Введите отчество студента');
    var inputUpLastName = stdin.readLineSync();
    print('Введите возраст студента');
    var inputUpAge = stdin.readLineSync();
    print('Введите группу студента');
    var inputUpGroup = stdin.readLineSync();
    print('Введите средний балл студента');
    var inputUpGrade = stdin.readLineSync();
    studentList.updateStudentData(int.parse(inputUpId!), inputUpSurname!, inputUpMiddle!, inputUpLastName!, int.parse(inputUpAge!), inputUpGroup!, double.parse(inputUpGrade!));
    case 4:
    print('Введите id студента, которого необходимо удалить');
    var inputDelId = stdin.readLineSync();
    studentList.deleteStudentById(int.parse(inputDelId!));
    case 5:
    print('Введите true/false');
    var inputTrue = stdin.readLineSync();
    studentList.getStudentWithHighestGrade(bool.parse(inputTrue!));
    case 6:
    print('Введите сред.балл');
    var inputGrade = stdin.readLineSync();
    studentList.filtStudentList(double.parse(inputGrade!));
    case 7:
    print(studentList.getAverageGrade());


  }

 }
}

class Student {
  int id; 
  String? surname, middle, firstName;
  int age;
  String group;
  double grade;

  Student(this.id, this.age, this.group, this.grade, {required this.surname, this.middle, this.firstName});
}


class StudentList{
  List<Student> students = [];
  void addStudent(Student student) {
    students.add(student);
  }

   void getStudentWithHighestGrade(bool isHighest) {
    if (students.isEmpty) {
    }

    Student studentWithHighestGrade = students[0];

    for (var student in students) {
      if (isHighest) {
        if (student.grade > studentWithHighestGrade.grade) {
          studentWithHighestGrade = student;          
        }
      } else {
        if (student.grade < studentWithHighestGrade.grade) {
          studentWithHighestGrade = student;
        }
      }
    }
    print('ID: ${studentWithHighestGrade.id}, Имя: ${studentWithHighestGrade.surname} ${studentWithHighestGrade.middle} ${studentWithHighestGrade.firstName}, Возраст: ${studentWithHighestGrade.age}, Группа: ${studentWithHighestGrade.group}, Средний балл: ${studentWithHighestGrade.grade}');
  }

  double getAverageGrade() {
  if (students.isEmpty) {
    return 0.0;
  }

  double totalGrade = 0.0;
  for (var student in students) {
    totalGrade += student.grade;
  }

  double averageGrade = totalGrade / students.length;
  return averageGrade;
  }

  void deleteStudentById(int id) {
  students.removeWhere((student) => student.id == id);
  }

  void updateStudentData(int id, String newSurName, String newMiddle, String newFirstName, int newAge, String newGroup, double newGrade) {
  for (var student in students) {
    if (student.id == id) {
      student.surname = newSurName;
      student.middle = newMiddle;
      student.firstName = newFirstName;
      student.age = newAge;
      student.group = newGroup;
      student.grade = newGrade;
    }
  }
  }

  void getStudentList(){
    for (var student in students ) {
    print('ID: ${student.id}, Имя: ${student.surname} ${student.middle} ${student.firstName}, Возраст: ${student.age}, Группа: ${student.group}, Средний балл: ${student.grade}');
  }
  }

  void filtStudentList(double filter){
    if (filter != null) {
    List<Student> filteredStudents =
        students.where((student) => student.grade == filter).toList();
    for (Student student in filteredStudents) {
      print("Name: ${student.middle}, Age: ${student.age}, Grade: ${student.grade}");
    }
  } else {
    for (Student student in students) {
      print("Name: ${student.middle}, Age: ${student.age}, Grade: ${student.grade}");
    }
  }
  }
}