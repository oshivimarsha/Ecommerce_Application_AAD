package lk.ijse.assignment_01_aad.controller.category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_aad.dto.CategoryDTO;
import lk.ijse.assignment_01_aad.dto.UserDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category-save")
public class CategoryServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("categoryName");
        String description = req.getParameter("categoryDescription");

        System.out.println(name);
        System.out.println(description);


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO category (name, description) VALUES (?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, description);

            int effectedRows = pstm.executeUpdate();
            if (effectedRows > 0) {

                //success
                resp.sendRedirect("category-save");
            }
            else {
                //fail
                resp.sendRedirect("category-save");
            }
            connection.close();
        }catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-save");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get method called");
        List<CategoryDTO> categoryList = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM category";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3)
                );
                categoryList.add(categoryDTO);
            }

            System.out.println();

            req.setAttribute("categories",categoryList);

            RequestDispatcher rd = req.getRequestDispatcher("category.jsp");

            rd.forward(req, resp);


        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
