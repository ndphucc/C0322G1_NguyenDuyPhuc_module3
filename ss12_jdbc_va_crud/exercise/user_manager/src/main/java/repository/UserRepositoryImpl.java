package repository;

import model.User;

import java.sql.*;
import java.util.LinkedList;

public class UserRepositoryImpl implements UserRepository {
    private final String FIND_ALL = " call sp_display()";
    private final String FIND_BY_NAME = " select * from `user` where name like %?%";
    private final String ADD = " insert into `user` (name, email, address) VALUE ( ?, ?, ?) ";
    private final String UPDATE = " call edit(?,?,?,?)";
    private final String REMOVE = "call `delete`(?)";
    private final String FIND_BY_ID = "select * from user where id=?";
    private final String SORT_BY_NAME = "select * from user order by name";
    private List<User> list = new LinkedList<>();

    @Override
    public List<User> findAll() {
        list.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            CallableStatement preparedStatement;
            preparedStatement = connection.prepareCall(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("address");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<User> findName(String str) {
        list.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1, str);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                list.add(new User(id, name, email, address));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void edit(int id, String name, String email, String address) {
        Connection connection = new BaseRepository().getConnection();
        try {
            CallableStatement preparedStatement = connection.prepareCall(UPDATE);
            preparedStatement.setInt(1,id);
            preparedStatement.setString(2,name);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,address);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(String name, String email, String address) {
        String msg = "ok, transaction successfully";
        Connection connection = new BaseRepository().getConnection();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, address);
            preparedStatement.executeUpdate();
            connection.commit();


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void remove(int id) {
        Connection connection = new BaseRepository().getConnection();
        try {
            CallableStatement preparedStatement = connection.prepareCall(REMOVE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUser(int id) {
        for (User user: findAll()) {
            if (user.getId()==id) {
                return user;
            }
        }
        return null;
    }

    @Override
    public List<User> sortByName() {
        list.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("address");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
}
