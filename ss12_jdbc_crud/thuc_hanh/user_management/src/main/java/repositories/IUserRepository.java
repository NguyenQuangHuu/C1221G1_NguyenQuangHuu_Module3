package repositories;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository extends ICrudRepository<User> {
    List<User> list() throws SQLException;
}
