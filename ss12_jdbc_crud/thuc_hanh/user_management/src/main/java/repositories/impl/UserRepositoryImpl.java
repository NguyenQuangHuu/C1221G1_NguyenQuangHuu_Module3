package repositories.impl;

import models.User;
import repositories.BaseRepository;
import repositories.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {

    private final BaseRepository baseRepository = new BaseRepository();


    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from user where id =?";
    private static final String SELECT_ALL_USERS = "select * from user";
    private static final String DELETE_USERS_SQL = "delete from user where id = ?;";
    private static final String UPDATE_USERS_SQL = "update user set name = ?,email= ?, country =? where id = ?;";




    @Override
    public List<User> list() throws SQLException {
        List<User> userList = new ArrayList<>();

        PreparedStatement preparedStatement = this.baseRepository.getConn().prepareStatement(SELECT_ALL_USERS);
        ResultSet resultSet = preparedStatement.executeQuery();
        User user;
        while (resultSet.next()){
            user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("name"));
            user.setEmail(resultSet.getString("email"));
            user.setCountry(resultSet.getString("country"));
            userList.add(user);
        }
        return userList;
    }
}
