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

@WebServlet(name = "RegistrationServlet", value = "/register")
public class RegistrationServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("registerName");
        String email = req.getParameter("registerEmail");
        String password = req.getParameter("registerPassword");
        String confirmPassword = req.getParameter("registerConfirmPassword");

        System.out.println(name + " " + email + " " + password + " " + confirmPassword);


        if (!password.equals(confirmPassword)) {
            resp.sendRedirect("index.jsp?errorpassword=failed");
            return;
        }

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");


            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO users (name, email, password, position) VALUES (?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, password);
                    preparedStatement.setString(4, "customer");

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        System.out.println("User registration successful");
                        resp.sendRedirect("adminDashboard.jsp?status=success");
                    } else {
                        System.out.println("User registration failed");
                        resp.sendRedirect("index.jsp?error=failed");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=exception");
        }
    }
}