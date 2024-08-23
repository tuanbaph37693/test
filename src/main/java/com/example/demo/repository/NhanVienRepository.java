package com.example.demo.repository;

import com.example.demo.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface NhanVienRepository extends JpaRepository
        <NhanVien, UUID> {
    boolean existsByAccountFE(String accountFE);

    boolean existsByMa(String ma);

    boolean existsByAccountFPT(String accountFPT);
}
