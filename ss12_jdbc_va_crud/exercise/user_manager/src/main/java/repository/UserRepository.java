package repository;

import model.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();

    List<User> findName(String str);

    void edit(int id);

    void add(String name, String email,String address);

    void remove(int id);

    User getUser(int id);

    void sortByName();
}
