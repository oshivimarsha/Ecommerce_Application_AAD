package lk.ijse.assignment_01_aad.controller.user;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_aad.dto.UserDTO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "UserUpdateServlet", value = "/user-update")
public class UserUpdateServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("update");
        String id = req.getParameter("userId");
        String name = req.getParameter("userName");
        String email = req.getParameter("userEmail");
        String position = req.getParameter("userPosition");
        System.out.println(id);
        System.out.println(name);
        System.out.println(email);
        System.out.println(position);

        try {
            System.out.println("TRY");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("forname ");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "UPDATE users SET name = ?, email = ?, position = ? WHERE user_id = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, position);
            pstm.setString(4, id);

            int effectedRows = pstm.executeUpdate();
            if (effectedRows > 0) {

                //success
                resp.sendRedirect("user-save?massage=Customer Updated Successfully");
            }
            else {
                //fail
                resp.sendRedirect("user-save?error=Customer Update Failed");
            }
            connection.close();
        }catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("user-save?error=Customer Update Successfully");
        }
    }
}
