package repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository{
    private String jdbcUrl = "jdbc:mysql://localhost:3306/ss12_jdbc_crud";
    private String username = "root";
    private String password = "03121994";

    private Connection conn;

    public BaseRepository() {
    }

    public Connection getConn() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl,username,password);
            return conn;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return null;
    }


}
