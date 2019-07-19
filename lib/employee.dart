class Employee{
  int _id;
  String _name;
  double _salary;

  Employee(this._id,this._name,this._salary);

  set id(int id){
    this._id = id;
  }
  set name(String Name){
    this._name = Name;
  }
set salary(double salary){
  this._salary = salary;
}
int get id => this._id;
String get name => this._name;
double get salary => this._salary;
}