package repositories.impl;

import models.User;
import repositories.BaseRepository;
import repositories.IUserRepository;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {

    private final BaseRepository baseRepository = new BaseRepository();


    private  final String INSERT_USERS_SQL = "INSERT INTO user (name, email, country) VALUES (?, ?, ?);";
    private  final String SELECT_USER_BY_ID = "select id,name,email,country from user where id =?";
    private  final String SELECT_ALL_USERS = "select * from user";
    private  final String DELETE_USERS_SQL = "delete from user where id = ?;";
    private  final String UPDATE_USERS_SQL = "update user set name = ?,email= ?, country =? where id = ?;";
    private  final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from user where country = ?;";
    private  final String SELECT_USER_SORT_BY_NAME = "select id,name,email,country from user order by name asc;";




    @Override
    public List<User> list() {
        List<User> userList = new ArrayList<>();

//        PreparedStatement preparedStatement = null;
        CallableStatement callableStatement = null;

        try {
//            preparedStatement = this.baseRepository.getConn().prepareStatement(SELECT_ALL_USERS);
            callableStatement = this.baseRepository.getConn().prepareCall("call show_users");
            ResultSet resultSet = callableStatement.executeQuery();
            User user;
            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                callableStatement.close();
//                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        
        return userList;
    }

    @Override
    public void removeUser(int id) {
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = this.baseRepository.getConn().prepareStatement(DELETE_USERS_SQL);
//            preparedStatement.setInt(1,id);
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }finally {
//            try {
//                preparedStatement.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }
        CallableStatement callableStatement = null;
        try {
            callableStatement = this.baseRepository.getConn().prepareCall("call delete_user(?)");
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                callableStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }

    @Override
    public void createUser(User user) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConn().prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public User findUserById(Integer id) {
        PreparedStatement preparedStatement = null;

        User user = new User();
        try {
            preparedStatement = this.baseRepository.getConn().prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1,id);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idResult = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user.setId(idResult);
                user.setName(name);
                user.setEmail(email);
                user.setCountry(country);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {

            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public List<User> findUserByCountry(String searchText) {
        PreparedStatement preparedStatement = null;
        List<User> userList = new ArrayList<>();
        User user;
        try {
            preparedStatement = this.baseRepository.getConn().prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1,searchText);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                user = new User();
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setCountry(country);
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {

            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return userList;
    }

    @Override
    public List<User> sortUserByName() {
        PreparedStatement preparedStatement = null;
        List<User> userList = new ArrayList<>();
        User user;
        try {
            preparedStatement = this.baseRepository.getConn().prepareStatement(SELECT_USER_SORT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                user = new User();
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setCountry(country);
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {

            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return userList;
    }

    @Override
    public void edit(int id, String name, String email, String country) {

//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = this.baseRepository.getConn().prepareStatement(UPDATE_USERS_SQL);
//            preparedStatement.setString(1,name);
//            preparedStatement.setString(2,email);
//            preparedStatement.setString(3,country);
//            preparedStatement.setInt(4,id);
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }finally {
//            try {
//                preparedStatement.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }

        CallableStatement callableStatement = null;

        try {
            callableStatement = this.baseRepository.getConn().prepareCall("call edit_user(?,?,?,?)");
            callableStatement.setInt(1,id);
            callableStatement.setString(2,name);
            callableStatement.setString(3,email);
            callableStatement.setString(4,country);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }
}
