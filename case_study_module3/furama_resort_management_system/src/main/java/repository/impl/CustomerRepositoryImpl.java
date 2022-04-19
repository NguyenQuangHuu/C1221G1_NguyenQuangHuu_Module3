package repository.impl;

import models.Customer;
import models.CustomerDTO;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private final BaseRepository baseRepository = new BaseRepository();
    private final String SELECT_ALL_CUSTOMER = "select customer_code,customer_name," +
            "customer_dob," +
            "customer_gender," +
            "customer_passport_id," +
            "customer_phone_number," +
            "customer_email," +
            "customer_address," +
            "customer_type_code from customers " +
            "inner join customer_type on " +
            "customers.customer_type_code = customer_type.customer_type_code;";
    @Override
    public List<Customer> showAll() {
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConn()
                    .prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()){
                customer = new Customer();
                int id = Integer.parseInt(String.valueOf(resultSet.getInt("customer_code")));
                String name = resultSet.getString("customer_name");
                String dayOfBirth = String.valueOf(resultSet.getDate("customer_dob"));
                int gender = resultSet.getInt("customer_gender");
                String passportId = resultSet.getString("customer_passport_id");
                String phoneNumber = resultSet.getString("customer_phone_number");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int typeCode = resultSet.getInt("customer_type_code");
                customer.setCustomerCode(id);
                customer.setCustomerName(name);
                customer.setCustomerDOB(dayOfBirth);
                customer.setCustomerGender(gender);
                customer.setCustomerPassportId(passportId);
                customer.setCustomerPhoneNumber(phoneNumber);
                customer.setCustomerEmail(email);
                customer.setCustomerAddress(address);
                customer.setCustomerTypeCode(typeCode);
                customerList.add(customer);
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

        return customerList;
    }

    @Override
    public void create(Customer customer) {

    }


    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id) {

    }
}
