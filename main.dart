import 'dart:io';
import 'employee.dart'; 
class EmployeeManagementSystem {
  List<Employee> employees = [];

  void addNewEmployee(Employee employee) {
    employees.add(employee);
    print('Employee added.');
  }

  List<Employee> getAllEmployees() {
    return employees;
  }


  void updateEmployee(int id, Employee updatedEmployee) {
    for (int i = 0; i < employees.length; i++) {
      if (employees[i].id == id) {
        employees[i] = updatedEmployee;
        print('Employee updated.');
        return;
      }
    }
    print('Employee with ID $id not found.');
  }

  void showAllEmployees() {
    if (employees.isEmpty) {
      print('No employees found.');
    } else {
      for (var employee in employees) {
        print('Employee ID: ${employee.id}');
        print('Full Name: ${employee.fullName}');
        print('Birthday: ${employee.birthday}');
        print('Address: ${employee.address}');
        print('Phone Number: ${employee.phoneNumber}');
        print('------------------------');
      }
    }
  }
}
//test func
void main() {
  var employeeSystem = EmployeeManagementSystem();

  while (true) {
    print('Employee Management System');
    print('1. Add New Employee');
    print('2. Get All Employees');
    print('3. Update Employee');
    print('4. Show All Employees');
    print('5. Exit');
    print('Enter your choice: ');

    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print('Enter Employee ID: ');
        var id = int.parse(stdin.readLineSync()!);
        print('Enter Full Name: ');
        var fullName = stdin.readLineSync()!;
        print('Enter Birthday (yyyy-mm-dd): ');
        var birthday = DateTime.parse(stdin.readLineSync()!);
        print('Enter Address: ');
        var address = stdin.readLineSync()!;
        print('Enter Phone Number: ');
        var phoneNumber = stdin.readLineSync()!;

        var newEmployee = Employee(
          id: id,
          fullName: fullName,
          birthday: birthday,
          address: address,
          phoneNumber: phoneNumber,
        );

        employeeSystem.addNewEmployee(newEmployee);
        break;

      case 2:
        var allEmployees = employeeSystem.getAllEmployees();
        for (var employee in allEmployees) {
          print('Employee ID: ${employee.id}, Full Name: ${employee.fullName}');
        }
        break;

      case 3:
        print('Enter Employee ID to update: ');
        var id = int.parse(stdin.readLineSync()!);
        print('Enter New Full Name: ');
        var fullName = stdin.readLineSync()!;
        print('Enter New Birthday (yyyy-mm-dd): ');
        var birthday = DateTime.parse(stdin.readLineSync()!);
        print('Enter New Address: ');
        var address = stdin.readLineSync()!;
        print('Enter New Phone Number: ');
        var phoneNumber = stdin.readLineSync()!;
        var updatedEmployee = Employee(
          id: id,
          fullName: fullName,
          birthday: birthday,
          address: address,
          phoneNumber: phoneNumber,
        );
        employeeSystem.updateEmployee(id, updatedEmployee);
        break;

      case 4:
        employeeSystem.showAllEmployees();
        break;

      case 5:
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
