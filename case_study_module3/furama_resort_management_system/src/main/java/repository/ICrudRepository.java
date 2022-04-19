package repository;

import models.Customer;

import java.util.List;

public interface ICrudRepository<E> {
    List<Customer> showAll();
    void create(E e);
    void delete(int id);
    void update(int id);
}
