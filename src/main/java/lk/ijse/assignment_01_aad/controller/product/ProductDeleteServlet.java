package lk.ijse.assignment_01_aad.controller.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "ProductDeleteServlet", value = "/product-delete")
public class ProductDeleteServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product_id = req.getParameter("productId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "DELETE FROM product WHERE id = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, product_id);

            int effectedRows = pstm.executeUpdate();
            if (effectedRows > 0) {

                //success
                resp.sendRedirect("product-list?massage=Customer Deleted Successfully");
            }
            else {
                //fail
                resp.sendRedirect("product-list?error=Customer Delete Failed");
            }
            connection.close();
        }catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-list?error=Customer Delete Successfully");
        }
    }
}
