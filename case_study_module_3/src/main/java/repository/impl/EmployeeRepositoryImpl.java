package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                            "level_code,"+
                            "department_code) value (?,?,?,?,?,?,?,?,?,?,?);"
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

    @Override
    public List<Employee> getListEmployee() {
        List<Employee> employees = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select * from employees;"
            );
            ResultSet resultSet =  preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()){
                employee = new Employee();
                employee.setId(resultSet.getInt("employee_code"));
                employee.setName(resultSet.getString("employee_name"));
                employee.setDayOfBirth(resultSet.getString("employee_dob"));
                employee.setGender(resultSet.getInt("employee_gender"));
                employee.setPassport(resultSet.getString("employee_passport_id"));
                employee.setSalary(resultSet.getDouble("employee_salary"));
                employee.setPhone(resultSet.getString("employee_phone_number"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPositionCode(resultSet.getInt("position_code"));
                employee.setLevelCode(resultSet.getInt("level_code"));
                employee.setDepartmentCode(resultSet.getInt("department_code"));
                employees.add(employee);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return employees;
    }

    @Override
    public Employee getEmployeeById(int id) {
        Employee employee = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("" +
                    "select * from employees where employee_code = ?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                employee = new Employee();
                employee.setId(resultSet.getInt("employee_code"));
                employee.setName(resultSet.getString("employee_name"));
                employee.setDayOfBirth(resultSet.getString("employee_dob"));
                employee.setGender(resultSet.getInt("employee_gender"));
                employee.setPassport(resultSet.getString("employee_passport_id"));
                employee.setSalary(resultSet.getDouble("employee_salary"));
                employee.setPhone(resultSet.getString("employee_phone_number"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));
                employee.setPositionCode(resultSet.getInt("position_code"));
                employee.setLevelCode(resultSet.getInt("level_code"));
                employee.setDepartmentCode(resultSet.getInt("department_code"));
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public void editEmployee(Employee employee) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "update employees set employee_name = ?," +
                            "employee_dob = ?," +
                            "employee_gender = ?," +
                            "employee_passport_id = ?,"+
                            "employee_salary = ?," +
                            "employee_phone_number = ?," +
                            "employee_email = ?," +
                            "employee_address = ?," +
                            "position_code = ?," +
                            "level_code = ?,"+
                            "department_code = ? where employee_code = ?;"
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
            preparedStatement.setInt(12,employee.getId());
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

    @Override
    public void deleteEmployee(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("delete from employees where employee_code = ?");
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
