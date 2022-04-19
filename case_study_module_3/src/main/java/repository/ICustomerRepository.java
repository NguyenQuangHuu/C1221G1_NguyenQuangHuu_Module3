package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository extends ICrudRepository<Customer>{
    List<Customer> showListCustomer();
}
