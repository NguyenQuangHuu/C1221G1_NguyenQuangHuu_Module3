package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private final BaseRepository baseRepository = new BaseRepository();
    private String LIST_CUSTOMER_QUERY = "" +
            "select * from customers;";

    private String INSERT_CUSTOMER = "INSERT INTO customers(customer_name,customer_dob," +
            "customer_gender,customer_passport_id," +
            "customer_phone_number,customer_email,customer_address," +
            "customer_type_code) value(?,?,?,?,?,?,?,?);";


    @Override
    public List<Customer> showListCustomer() {
        List<Customer> customers = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(LIST_CUSTOMER_QUERY);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()){
                customer = new Customer();
                customer.setId(resultSet.getInt("customer_code"));
                customer.setName(resultSet.getString("customer_name"));
                customer.setDayOfBirth(String.valueOf(resultSet.getDate("customer_dob")));
                customer.setGender(resultSet.getInt("customer_gender"));
                customer.setPassport(resultSet.getString("customer_passport_id"));
                customer.setPhone(resultSet.getString("customer_phone_number"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setTypeCode(resultSet.getInt("customer_type_code"));
                customers.add(customer);
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
        return customers;
    }

    @Override
    public List<CustomerType> showListCustomerType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement("select * from customer_type;");
            ResultSet resultSet = preparedStatement.executeQuery();
            CustomerType customerType;
            while (resultSet.next()){
                customerType = new CustomerType();
                customerType.setTypeCode(resultSet.getInt("customer_type_code"));
                customerType.setTypeName(resultSet.getString("customer_type_name"));
                customerTypes.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerTypes;
    }

    @Override
    public void createCustomer(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDayOfBirth());
            preparedStatement.setInt(3,customer.getGender());
            preparedStatement.setString(4,customer.getPassport());
            preparedStatement.setString(5,customer.getPhone());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getTypeCode());
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
    public Customer findCustomerById(int id) {

        PreparedStatement preparedStatement = null;
        Customer customer = null;
        try {
            preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement("select * from customers where customer_code = ?;");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                customer = new Customer();
                customer.setId(resultSet.getInt("customer_code"));
                customer.setName(resultSet.getString("customer_name"));
                customer.setDayOfBirth(String.valueOf(resultSet.getDate("customer_dob")));
                customer.setGender(resultSet.getInt("customer_gender"));
                customer.setPassport(resultSet.getString("customer_passport_id"));
                customer.setPhone(resultSet.getString("customer_phone_number"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setTypeCode(resultSet.getInt("customer_type_code"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customer;
    }

    @Override
    public void removeCustomer(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement("delete from customers where customer_code = ?;");
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void editCustomer(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("" +
                    "update customers set customer_name = ?," +
                    "customer_dob = ?," +
                    "customer_gender = ?," +
                    "customer_passport_id = ?," +
                    "customer_phone_number = ?," +
                    "customer_email = ?," +
                    "customer_address = ?," +
                    "customer_type_code=? where customer_code = ?");
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDayOfBirth());
            preparedStatement.setInt(3,customer.getGender());
            preparedStatement.setString(4,customer.getPassport());
            preparedStatement.setString(5,customer.getPhone());
            preparedStatement.setString(6,customer.getEmail());
            preparedStatement.setString(7,customer.getAddress());
            preparedStatement.setInt(8,customer.getTypeCode());
            preparedStatement.setInt(9,customer.getId());
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
    public List<Customer> searchCustomer(String nameSearch, String addressSearch, String phoneSearch) {
        List<Customer> resultCustomer = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement("select * from customers where (customer_name like ? and customer_address like ? and customer_phone_number like ?);");
            preparedStatement.setString(1,'%'+nameSearch+'%');
            preparedStatement.setString(2,'%'+addressSearch+'%');
            preparedStatement.setString(3,'%'+phoneSearch+'%');
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()){
                customer = new Customer();
                customer.setId(resultSet.getInt("customer_code"));
                customer.setName(resultSet.getString("customer_name"));
                customer.setDayOfBirth(resultSet.getString("customer_dob"));
                customer.setGender(resultSet.getInt("customer_gender"));
                customer.setPassport(resultSet.getString("customer_passport_id"));
                customer.setPhone(resultSet.getString("customer_phone_number"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
                customer.setTypeCode(resultSet.getInt("customer_type_code"));
                resultCustomer.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return resultCustomer;
    }
}
