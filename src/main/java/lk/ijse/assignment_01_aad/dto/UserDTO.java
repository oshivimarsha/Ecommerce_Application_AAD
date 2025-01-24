package lk.ijse.assignment_01_aad.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDTO {
    private int user_id;
    private String name;
    private String email;
    private String password;
    private String position;
}
