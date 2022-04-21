package service.impl.employees;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.i_employee.IEmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {
    private final IEmployeeRepository repository = new EmployeeRepositoryImpl();

    @Override
    public void newEmployee(Employee employee) {
        this.repository.newEmployee(employee);
    }

    @Override
    public List<Employee> getList() {
        return this.repository.getListEmployee();
    }

    @Override
    public Employee getEmployeeById(int id) {
        return this.repository.getEmployeeById(id);
    }

    @Override
    public void editEmployee(Employee employee) {
        this.repository.editEmployee(employee);
    }
}
