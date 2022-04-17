package repositories;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository extends ICrudRepository<User> {
    List<User> list() throws SQLException;

    void removeUser(int id);
    void createUser(User user);

    User findUserById(Integer id);

    List<User> findUserByCountry(String searchText);

    List<User> sortUserByName();
}
