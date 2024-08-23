package com.example.demo.controller;

import com.example.demo.entity.NhanVien;
import com.example.demo.repository.NhanVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Controller
@RequestMapping("bo-mon")
public class BoMonController {
    @Autowired
    NhanVienRepository nvr;

    @RequestMapping("chuyen-nganh/{id}")
    public String getChuyenNganh(@PathVariable("id") UUID id, Model model){
        NhanVien nhanVien = nvr.findById(id).get();
        model.addAttribute("data", nhanVien);
        return "bo_mon/listBoMon";
    }
}
