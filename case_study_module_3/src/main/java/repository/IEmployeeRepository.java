package repository;

import model.Employee;

import java.util.List;

public interface IEmployeeRepository extends ICrudRepository<Employee> {
    void newEmployee(Employee employee);

    List<Employee> getListEmployee();

    Employee getEmployeeById(int id);

    void editEmployee(Employee employee);
}
