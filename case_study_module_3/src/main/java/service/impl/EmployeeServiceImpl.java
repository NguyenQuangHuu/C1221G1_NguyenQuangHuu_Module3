package service.impl;

import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

public class EmployeeServiceImpl implements IEmployeeService {
    private final IEmployeeRepository repository = new EmployeeRepositoryImpl();
}
