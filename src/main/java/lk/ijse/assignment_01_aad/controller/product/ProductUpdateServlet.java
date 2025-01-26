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

@WebServlet(name = "ProductUpdateServlet", value = "/product-update")
public class ProductUpdateServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("productId");
        String name = req.getParameter("productName");
        String description = req.getParameter("productDescription");
        String category = req.getParameter("productCategory");
        String price = req.getParameter("productPrice");
        String qty = req.getParameter("productQty");

        System.out.println(id);
        System.out.println(name);
        System.out.println(description);
        System.out.println(category);
        System.out.println(price);
        System.out.println(qty);

        try {
            System.out.println("TRY");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("forname ");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "UPDATE product SET name = ?, description = ?, category = ?, price = ?, qty = ? WHERE id = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setString(3, category);
            pstm.setString(4, price);
            pstm.setString(5, qty);
            pstm.setString(6, id);

            int effectedRows = pstm.executeUpdate();
            if (effectedRows > 0) {

                //success
                resp.sendRedirect("product-list?massage=Customer Updated Successfully");
            }
            else {
                //fail
                resp.sendRedirect("product-list?error=Customer Update Failed");
            }
            connection.close();
        }catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-list?error=Customer Update Successfully");
        }
    }
}
