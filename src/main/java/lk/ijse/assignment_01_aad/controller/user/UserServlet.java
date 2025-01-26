package lk.ijse.assignment_01_aad.controller.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_aad.dto.UserDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user-save")
public class UserServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("userName");
        String email = req.getParameter("userEmail");
        String password = req.getParameter("userPassword");
        String position = req.getParameter("userPosition");

        System.out.println(name);
        System.out.println(email);
        System.out.println(password);
        System.out.println(position);


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO users (name, email, password, position) VALUES (?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, password);
            pstm.setString(4, position);

            int effectedRows = pstm.executeUpdate();
            if (effectedRows > 0) {

                //success
                resp.sendRedirect("user-save?massage=Customer Saved Successfully");
            }
            else {
                //fail
                resp.sendRedirect("user-save?error=Customer Save Failed");
            }
            connection.close();
        }catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("user-save?error=Customer Save Successfully");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get method called");
        List<UserDTO> userList = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM users";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                UserDTO userDTO = new UserDTO(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5)
                );
                userList.add(userDTO);
            }

            System.out.println();

            req.setAttribute("users",userList);

            RequestDispatcher rd = req.getRequestDispatcher("user.jsp");

            rd.forward(req, resp);


        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
