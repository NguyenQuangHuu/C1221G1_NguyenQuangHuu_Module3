package repository.impl;

import model.Department;
import model.Level;
import repository.BaseRepository;
import repository.IDepartmentRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartmentRepositoryImpl implements IDepartmentRepository {
    private final BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Department> getListDepartment() {
        List<Department> departments = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select * from departments");
            ResultSet resultSet = preparedStatement.executeQuery();
            Department department;
            while (resultSet.next()){
                department = new Department();
                department.setId(resultSet.getInt("position_code"));
                department.setName(resultSet.getString("position_name"));
                departments.add(department);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return departments;
    }
}
