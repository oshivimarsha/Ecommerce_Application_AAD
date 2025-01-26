package lk.ijse.assignment_01_aad.controller.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CategotyUpdateServlet", value = "/category-update")
public class CategotyUpdateServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("update");
        String id = req.getParameter("categoryId");
        String name = req.getParameter("categoryName");
        String description = req.getParameter("categoryDescription");

        System.out.println(id);
        System.out.println(name);
        System.out.println(description);


        try {
            System.out.println("TRY");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("forname ");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "UPDATE category SET name = ?, description = ? WHERE id = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setString(3, id);

            int effectedRows = pstm.executeUpdate();
            if (effectedRows > 0) {

                //success
                resp.sendRedirect("category-save?massage=Customer Updated Successfully");
            }
            else {
                //fail
                resp.sendRedirect("category-save?error=Customer Update Failed");
            }
            connection.close();
        }catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category-save?error=Customer Update Successfully");
        }
    }
}
