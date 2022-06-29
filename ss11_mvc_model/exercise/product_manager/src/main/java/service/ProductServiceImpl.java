package service;

import model.Product;
import reponsitory.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductRepositoryImpl productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void edit(Product product) {
        productRepository.edit(product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public Product getProduct(int id) {
        return productRepository.getProduct(id);
    }


    @Override
    public List<Product> find(String find) {
        return productRepository.find(find);
    }

    public int getId() {
        return productRepository.getId();
    }

}
