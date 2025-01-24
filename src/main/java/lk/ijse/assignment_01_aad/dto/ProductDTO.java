package lk.ijse.assignment_01_aad.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
    private int productId;
    private String name;
    private String description;
    private String category;
    private double price;
    private int qty;
    private String image;
}
