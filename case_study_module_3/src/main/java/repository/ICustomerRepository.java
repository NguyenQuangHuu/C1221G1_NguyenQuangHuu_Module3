package repository;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerRepository extends ICrudRepository<Customer>{
    List<Customer> showListCustomer();

    List<CustomerType> showListCustomerType();

    void createCustomer(Customer customer);

    Customer findCustomerById(int id);

    void removeCustomer(int id);

    void editCustomer(Customer customer);

    List<Customer> searchCustomer(String nameSearch, Integer typeCustomerSearch, String emailSearch);
}
