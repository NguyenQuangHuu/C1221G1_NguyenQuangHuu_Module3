package service.icustomer;

import model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> listCustomer();


    Map<String, String> createCustomer(Customer customer);

    Customer findCustomerById(int id);

    void removeCustomer(int id);

    Map<String, String> editCustomer(Customer customer);

    List<Customer> searchCustomer(String nameSearch, Integer typeCustomerSearch, String emailSearch);

}
