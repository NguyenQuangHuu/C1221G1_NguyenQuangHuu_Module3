package repositories.impl;

import models.Product;
import repositories.IProductRepository;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    Map<Integer,Product> productList = new LinkedHashMap();

    @Override
    public List<Product> list() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void create(Product product) {
        productList.put(product.getId(),product);
    }

    @Override
    public void update(int id, Product product) {
        productList.replace(id,product);
    }

    @Override
    public void delete(Product product) {
        productList.remove(product.getId(),product);
    }


    @Override
    public Product findById(int id) {

        return productList.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        for(Map.Entry<Integer,Product> product : productList.entrySet()){
            if(product.getValue().getProductName().contains(name)){
                result.add(product.getValue());
            }
        }
        return result.size()!=0 ? result : null ;
    }
}
