package repositories;

import models.User;

import java.sql.SQLException;
import java.util.List;

public interface ICrudRepository<E> {
    List<E> list() throws SQLException;



    void edit(int id, String name, String email, String country);
}
