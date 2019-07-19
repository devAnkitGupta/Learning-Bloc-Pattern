import 'dart:async';
import 'employee.dart';

class EmployeeBloc{
  List<Employee> _employeeList = [
    Employee(1, "Tom", 1000.0),
    Employee(2,"Harry",2000.0),
    Employee(3,"Sam",3000.0),
    Employee(4,"Jay",2400.0),
    Employee(5,"Ram",5000.0),
    Employee(6,"Som",6000.0),
    Employee(7,"Edge",70000.0),
  ];
 final _employeeListStreamController = StreamController<List<Employee>>();

 final _employeeSalaryIncrementController = StreamController<Employee>();
 final _employeeSalaryDecrementController = StreamController<Employee>();

 Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
 StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;
 StreamSink<Employee> get employeeIncrement => _employeeSalaryIncrementController.sink;
 StreamSink<Employee> get employeeDecrement => _employeeSalaryDecrementController.sink;

 EmployeeBloc(){
   _employeeListStreamController.add(_employeeList);
   _employeeSalaryIncrementController.stream.listen(_incrementSalary);
   _employeeSalaryDecrementController.stream.listen(_decrementSalary);
 }
 _incrementSalary(Employee employee){
   double salary = employee.salary;
   double incrementedSalary = salary * 20/100;
   _employeeList[employee.id-1].salary = salary + incrementedSalary;
   employeeListSink.add(_employeeList);
 }
 _decrementSalary(Employee employee){
   double salary = employee.salary;
   double decrementedSalary = salary*20/100;
   _employeeList[employee.id-1].salary = salary - decrementedSalary;
   employeeListSink.add(_employeeList);
 }
 void dispose(){
   _employeeSalaryIncrementController.close();
   _employeeSalaryDecrementController.close();
   _employeeListStreamController.close();
 }
}