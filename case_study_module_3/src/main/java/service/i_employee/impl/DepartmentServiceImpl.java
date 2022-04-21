package service.i_employee.impl;

import model.Department;
import repository.IDepartmentRepository;
import repository.impl.DepartmentRepositoryImpl;
import service.i_employee.IDepartmentService;

import java.util.List;

public class DepartmentServiceImpl implements IDepartmentService {
    private final IDepartmentRepository departmentRepository = new DepartmentRepositoryImpl();

    @Override
    public List<Department> getList() {
        return this.departmentRepository.getListDepartment();
    }
}
