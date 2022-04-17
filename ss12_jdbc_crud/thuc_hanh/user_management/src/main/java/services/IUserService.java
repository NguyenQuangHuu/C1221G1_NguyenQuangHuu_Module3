package services;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> list() throws SQLException;
}
