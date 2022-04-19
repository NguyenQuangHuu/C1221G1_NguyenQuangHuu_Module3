package repository.impl;

import model.Customer;
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
}
