package service.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> listCustomer() {
        return iCustomerRepository.showListCustomer();
    }

    @Override
    public List<CustomerType> listCustomerType() {
        return this.iCustomerRepository.showListCustomerType();
    }

    @Override
    public void createCustomer(Customer customer) {
        this.iCustomerRepository.createCustomer(customer);
    }

    @Override
    public Customer findCustomerById(int id) {
        return this.iCustomerRepository.findCustomerById(id);
    }

    @Override
    public void removeCustomer(int id) {
        this.iCustomerRepository.removeCustomer(id);
    }


}
