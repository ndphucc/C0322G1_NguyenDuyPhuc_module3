package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void add(Product product);

    void edit(Product product);

    void remove(int id);

    Product getProduct(int id);
    List<Product> find(String find);
}
