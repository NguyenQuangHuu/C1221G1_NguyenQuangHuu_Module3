package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> listCustomer();

    List<CustomerType> listCustomerType();

    void createCustomer(Customer customer);

    Customer findCustomerById(int id);

    void removeCustomer(int id);
}
