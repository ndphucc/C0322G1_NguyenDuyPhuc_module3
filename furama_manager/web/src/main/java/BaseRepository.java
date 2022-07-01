import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private String jdbcDriver ="com.mysql.jdbc.Driver";
    private String jdbcURL = "jdbc:mysql://localhost:3306/user_manager";
    private String jdbcUsername ="root";
    private String jdbcPass ="matkhau12";
    private static Connection connection;

    Connection getConnection() {
        try {
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
