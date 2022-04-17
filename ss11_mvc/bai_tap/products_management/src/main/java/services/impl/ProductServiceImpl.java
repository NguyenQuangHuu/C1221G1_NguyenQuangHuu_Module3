package services.impl;

import models.Product;
import repositories.IProductRepository;
import repositories.impl.ProductRepository;
import services.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements IProductService {
    private final IProductRepository iProductRepository = new ProductRepository();
    @Override
    public void create(Product product) {
        iProductRepository.create(product);
    }

    @Override
    public List<Product> listProduct() {
        return iProductRepository.list();
    }

    @Override
    public Product findById(Integer id) {
        return iProductRepository.findById(id);
    }

    @Override
    public void updateProduct(Integer id,String name,String manufacturer,Double price, Integer quantity, Product product) {
        product.setProductName(name);
        product.setManufacturer(manufacturer);
        product.setProductPrice(price);
        product.setProductQuantity(quantity);
        iProductRepository.update(id,product);
    }

    @Override
    public void removeProduct(Product product) {
        this.iProductRepository.delete(product);
    }

    @Override
    public List<Product> searchByName(String search) {
        return this.iProductRepository.findByName(search);
    }
}
