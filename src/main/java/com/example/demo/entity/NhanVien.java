package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "staff")
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @Column(name = "staff_code")
    @NotNull
    @NotBlank(message = "Không được để trống mã")
    private String ma;

    @Column(name = "name")
    @NotNull
    @NotBlank(message = "Không được để trống tên")
    private String ten;

    @Column(name = "created_date")
    private Long ngayTao;

    @Column(name = "last_modified_date")
    private Long ngaySua;

    @Column(name = "account_fe")
    @NotNull
    @NotBlank(message = "Không được để trống emailFE")
    @Pattern(regexp = "^[\\w.%+-]+@fe.edu.vn$", message = "Email phải sai địnhh dạng")
    private String accountFE;

    @Column(name = "account_fpt")
    @NotNull
    @NotBlank(message = "Không được để trống emailFPT")
    @Pattern(regexp = "^[\\w.%+-]+@fpt.edu.vn$", message = "Email phải sai địnhh dạng")
    private String accountFPT;

    @Column(name = "status")
    private byte trangThai;
}
