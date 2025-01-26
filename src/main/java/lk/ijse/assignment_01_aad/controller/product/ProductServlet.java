package lk.ijse.assignment_01_aad.controller.product;

import com.google.gson.Gson;
import com.mchange.v2.cfg.PropertiesConfigSource;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.assignment_01_aad.dto.ProductDTO;

import java.io.BufferedReader;
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

        System.out.println(id);
        System.out.println(name);
        System.out.println(description);
        System.out.println(category);
        System.out.println(price);
        System.out.println(qty);


        Part filePart = req.getPart("productImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = "C:/Users/CHAMA COMPUTERS/IdeaProjects/Assignment_01_AAD/target/E-Commerrce_Web-1.0-SNAPSHOT/uploads";
        // String uploadPath = "C:/ecommerce/uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        System.out.println("id: " + id);
        System.out.println("name: " + name);
        System.out.println("description: " + description);
        System.out.println("category: " + category);
        System.out.println("price: " + price);
        System.out.println("qty: " + qty);

        filePart.write(uploadPath + File.separator + fileName);
        String imageUrl = "uploads/" + fileName;

        System.out.println(imageUrl);


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO product (id, name, description, category, price, qty, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, name);
            pstm.setString(3, description);
            pstm.setString(4, category);
            pstm.setString(5, price);
            pstm.setString(6, qty);
            pstm.setString(7, imageUrl);

            int affectedRows = pstm.executeUpdate();
            if (affectedRows > 0) {
                resp.sendRedirect("product-list");
            } else {
                resp.sendRedirect("product-list");
            }

            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product-list");
        }
    }
}