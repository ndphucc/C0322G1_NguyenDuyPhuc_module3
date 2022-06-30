package service;

import model.User;
import repository.UserRepository;
import repository.UserRepositoryImpl;

import java.util.List;

public class ServiceImpl implements Service{
    UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> findName(String str) {
        return userRepository.findName(str);
    }

    @Override
    public void edit(int id) {

    }

    @Override
    public void add(String name, String email, String address) {
        userRepository.add(name,email,address);
    };

    @Override
    public void remove(int id) {

    }

    @Override
    public User getUser(int id) {
        return userRepository.getUser(id);
    }

    @Override
    public void sortByName() {

    }
}
