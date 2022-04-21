package service.icustomer;

import model.CustomerType;
import service.IService;

import java.util.List;

public interface ICustomerTypeService extends IService<CustomerType> {
    List<CustomerType> listCustomerType();
}
