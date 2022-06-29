package reponsitory;

import model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();

    void add(Product product);

    void edit(Product product);

    void remove(int id);

    List<Product> find(String find);
}
