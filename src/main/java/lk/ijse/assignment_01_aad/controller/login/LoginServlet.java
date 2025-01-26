package lk.ijse.assignment_01_aad.controller.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_aad.dto.UserDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Login request received");

        String email = req.getParameter("loginEmail");
        String password = req.getParameter("loginPassword");

        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            resp.sendRedirect("login.jsp?error=Invalid Credentials");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                PreparedStatement pstm = connection.prepareStatement(sql);
                pstm.setString(1, email);
                pstm.setString(2, password);

                ResultSet resultSet = pstm.executeQuery();

                if (resultSet.next()) {
                    // Populate the UserDTO object
                    UserDTO userDTO = new UserDTO();
                    userDTO.setUser_id(resultSet.getInt("id")); // Assuming 'id' is the column name
                    userDTO.setEmail(resultSet.getString("email"));
                    userDTO.setPosition(resultSet.getString("position"));

                    if ("Admin".equalsIgnoreCase(userDTO.getPosition())) {
                        // Redirect Admin to adminDashboard.jsp
                        resp.sendRedirect("adminDashboard.jsp?userId=" + userDTO.getUser_id());
                    } else if ("Customer".equalsIgnoreCase(userDTO.getPosition())) {
                        // Redirect Customer to index.jsp
                        resp.sendRedirect("index.jsp?userId=" + userDTO.getUser_id());
                    } else {
                        // Unknown position, redirect to login with error
                        resp.sendRedirect("login.jsp?error=Invalid User Role");
                    }
                } else {
                    // Invalid credentials
                    resp.sendRedirect("login.jsp?error=Invalid Credentials");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=An unexpected error occurred");
        }
    }
}
