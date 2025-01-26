package lk.ijse.assignment_01_aad.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CategoryDTO {
    private int id;
    private String name;
    private String description;
}
