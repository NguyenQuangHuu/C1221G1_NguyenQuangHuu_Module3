package repository;

import model.Department;

import java.util.List;

public interface IDepartmentRepository extends ICrudRepository<Department> {
    List<Department> getListDepartment();
}
