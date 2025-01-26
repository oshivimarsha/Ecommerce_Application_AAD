/*
package lk.ijse.assignment_01_aad.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment_01_aad.dto.ProductDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetAllProductServlet", value = "/get-all-product")
public class GetAllProductServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> products = new ArrayList<>();

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                // Define the SQL query to retrieve all products
                String sql = "SELECT * FROM product";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();

                // Iterate over the results and populate the product list
                while (resultSet.next()) {
                    ProductDTO product = new ProductDTO();
                    product.setProductId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setCategory(resultSet.getString("category"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setImage(resultSet.getString("image_url"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
            return;
        }

        // Set the product list as a request attribute
        req.setAttribute("products", products);

        // Forward to the JSP for rendering
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
*/
