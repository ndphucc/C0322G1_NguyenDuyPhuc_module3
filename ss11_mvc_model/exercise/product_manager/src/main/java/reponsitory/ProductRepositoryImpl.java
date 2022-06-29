package reponsitory;

import model.Product;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepository {
    static Map<Integer, Product> productList = new LinkedHashMap<>();

    static {
        productList.put(1, new Product(1, "A", 20000, "abc", "abc"));
        productList.put(2, new Product(2, "B", 20000, "abc", "abc"));
        productList.put(3, new Product(3, "C", 20000, "abc", "abc"));
        productList.put(4, new Product(4, "D", 20000, "abc", "abc"));
    }

    @Override
    public List<Product> findAll() {
        return new LinkedList<>(productList.values());
    }

    @Override
    public void add(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void edit(Product product) {
        productList.put(product.getId(),product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> find(String find) {
        List<Product> productList = new LinkedList<>();
        for (Product product: findAll()) {
            if (product.getName().contains(find)) {
                productList.add(product);
            }
        }
        return productList;
    }

    public Product getProduct(int id) {
        return productList.get(id);
    }

    public int getId() {
        if (productList.isEmpty()) {
            return 1;
        } else {
            int id = 0;
            Set<Integer> integerList = productList.keySet();
            for (Integer temp : integerList) {
                if (id < temp) {
                    id = temp;
                }
            }
            return id + 1;
        }

    }

}
