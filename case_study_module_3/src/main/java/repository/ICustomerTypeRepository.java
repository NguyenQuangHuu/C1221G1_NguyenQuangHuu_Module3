package repository;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository extends  ICrudRepository<CustomerType> {
    List<CustomerType> showListCustomerType();
}
