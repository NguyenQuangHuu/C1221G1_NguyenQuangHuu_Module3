package service.icustomer.customer;

import model.CustomerType;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerTypeRepositoryImpl;
import service.icustomer.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    private final ICustomerTypeRepository repository = new CustomerTypeRepositoryImpl();
    @Override
    public List<CustomerType> listCustomerType() {
        return this.repository.showListCustomerType();
    }
}
