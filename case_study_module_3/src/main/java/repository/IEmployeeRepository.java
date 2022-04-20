package repository;

import model.Employee;

public interface IEmployeeRepository extends ICrudRepository<Employee> {
    void newEmployee(Employee employee);
}
