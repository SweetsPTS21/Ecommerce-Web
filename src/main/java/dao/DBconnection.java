package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBconnection {
    protected Connection connection;

    public DBconnection () {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://bd7f0ef6fd7b22:5fe8f4b2@us-cdbr-east-06.cleardb.net/heroku_e48fe58979a3f42?reconnect=true";
                String username="bd7f0ef6fd7b22";
                String password = "5fe8f4b2";
                connection=DriverManager.getConnection (url, username, password);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }

    }
}
