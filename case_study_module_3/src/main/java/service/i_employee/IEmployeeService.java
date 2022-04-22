package service.i_employee;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    void newEmployee(Employee employee);

    List<Employee> getList();

    Employee getEmployeeById(int id);

    void editEmployee(Employee employee);

    void deleteEmployee(int id);
}
