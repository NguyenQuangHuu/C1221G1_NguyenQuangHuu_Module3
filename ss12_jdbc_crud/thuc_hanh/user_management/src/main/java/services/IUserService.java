package services;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> list() throws SQLException;

    void createUser(User user);

    User findUserById(Integer id);

    void editUser(int id, String name, String email, String country);

    void deleteUser(int id);

    List<User> searchUserByCountryName(String searchText);

    List<User> sortByName();
}
