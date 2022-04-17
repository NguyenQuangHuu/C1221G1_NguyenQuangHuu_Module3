package repositories;

import java.sql.SQLException;
import java.util.List;

public interface ICrudRepository<E> {
    List<E> list() throws SQLException;
}
