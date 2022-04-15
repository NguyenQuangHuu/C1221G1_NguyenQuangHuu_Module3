package services;

import models.Product;

import java.util.List;

public interface IProductService extends IService {
    void create(Product product);

    List<Product> listProduct();

    Product findById(Integer id);


    void updateProduct(Integer id, Product product);

    void removeProduct(Product product);

    List<Product> searchByName(String search);
}
