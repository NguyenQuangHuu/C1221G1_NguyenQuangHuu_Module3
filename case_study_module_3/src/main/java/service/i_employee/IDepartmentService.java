package service.i_employee;

import model.Department;
import service.IService;

import java.util.List;

public interface IDepartmentService extends IService<Department> {
    List<Department> getList();
}
