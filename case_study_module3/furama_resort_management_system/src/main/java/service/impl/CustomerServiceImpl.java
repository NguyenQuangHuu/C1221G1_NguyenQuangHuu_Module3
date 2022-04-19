package service.impl;

import models.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private final ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> showListCustomer() {
        return this.iCustomerRepository.showAll();
    }
}
