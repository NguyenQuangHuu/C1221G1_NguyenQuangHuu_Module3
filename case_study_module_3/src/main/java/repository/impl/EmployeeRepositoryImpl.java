package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeRepositoryImpl implements IEmployeeRepository {
    private final BaseRepository baseRepository = new BaseRepository();

    @Override
    public void newEmployee(Employee employee) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "insert into employees(employee_name," +
                            "employee_dob," +
                            "employee_gender," +
                            "employee_passport_id,"+
                            "employee_salary," +
                            "employee_phone_number," +
                            "employee_email," +
                            "employee_address," +
                            "position_code," +
                            "level_code"+
                            "department_code,) value (?,?,?,?,?,?,?,?,?,?);"
            );

            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getDayOfBirth());
            preparedStatement.setInt(3,employee.getGender());
            preparedStatement.setString(4,employee.getPassport());
            preparedStatement.setDouble(5,employee.getSalary());
            preparedStatement.setString(6,employee.getPhone());
            preparedStatement.setString(7,employee.getEmail());
            preparedStatement.setString(8,employee.getAddress());
            preparedStatement.setInt(9,employee.getPositionCode());
            preparedStatement.setInt(10,employee.getLevelCode());
            preparedStatement.setInt(11,employee.getDepartmentCode());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
