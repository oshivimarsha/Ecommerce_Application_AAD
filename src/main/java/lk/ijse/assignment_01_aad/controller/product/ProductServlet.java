package lk.ijse.assignment_01_aad.controller.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "ProductServlet", value = "/product-save")
public class ProductServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("productId");
        String name = req.getParameter("productName");
        String description = req.getParameter("productDescription");
        String category = req.getParameter("productCategory");
        String price = req.getParameter("productPrice");
        String qty = req.getParameter("productQty");

        Part filePart = req.getPart("productImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();


        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        System.out.println("uploadPath = " + uploadPath);

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String sql = "INSERT INTO product (id, name, description, category, price, qty, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstm = connection.prepareStatement(sql)) {
                pstm.setString(1, id);
                pstm.setString(2, name);
                pstm.setString(3, description);
                pstm.setString(4, category);
                pstm.setString(5, price);
                pstm.setString(6, qty);
                pstm.setString(7, "uploads/" + fileName);

                int affectedRows = pstm.executeUpdate();
                if (affectedRows > 0) {
                    resp.sendRedirect("product-list?status=success");
                } else {
                    resp.sendRedirect("product-list?status=error");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("product-list?status=error");
        }
    }
}
