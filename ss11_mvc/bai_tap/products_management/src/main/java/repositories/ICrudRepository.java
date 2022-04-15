package repositories;

import models.Product;

import java.util.List;

public interface ICrudRepository<E> {
    List<E> list();
    void create(E e);
    void update(int id,E e);
    void delete(E e);
    E findById(int id);
    List<E> findByName(String name);
}
