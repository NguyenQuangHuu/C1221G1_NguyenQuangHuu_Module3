package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

public class EmployeeServiceImpl implements IEmployeeService {
    private final IEmployeeRepository repository = new EmployeeRepositoryImpl();

    @Override
    public void newEmployee(Employee employee) {
        this.repository.newEmployee(employee);
    }
}
