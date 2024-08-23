package com.example.demo.controller;

import com.example.demo.entity.NhanVien;
import com.example.demo.repository.NhanVienRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("nhan-vien")
public class NhanVienController {
    @Autowired
    NhanVienRepository nvr;

    @RequestMapping("hien-thi")
    public String getAll(){
        return "nhan_vien/list";
    }
    @GetMapping("hien-thi")
    public String getAll(Model model){
        List<NhanVien> list = nvr.findAll();
        model.addAttribute("list", list);
        return "nhan_vien/list";
    }

    @RequestMapping ("{id}")
    public String trangThai(@PathVariable("id") UUID id, RedirectAttributes redirectAttributes){
        NhanVien nhanVien = nvr.findById(id).get();

        byte trangThai;
        if(nhanVien.getTrangThai() == 1){
            nhanVien.setTrangThai(trangThai = 0);
            nvr.save(nhanVien);
            redirectAttributes.addFlashAttribute("message", "Đổi trạng thái thành công");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/nhan-vien/hien-thi";
        }
        if (nhanVien.getTrangThai() == 0){
            nhanVien.setTrangThai(trangThai = 1);
            nvr.save(nhanVien);
            redirectAttributes.addFlashAttribute("message", "Đổi trạng thái thành công");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:hien-thi";
        }
        return "redirect:/nhan-vien/hien-thi";
    }

    @RequestMapping("edit/{id}")
    public String edit(@PathVariable("id") UUID id, Model model){
        NhanVien nhanVien = nvr.findById(id).get();
        model.addAttribute("data", nhanVien);
        return "nhan_vien/update";
    }

    @PostMapping("update/{id}")
    public String edit(Model model, @Valid NhanVien nv, BindingResult validateResule){
        if(validateResule.hasErrors()){
            List<FieldError> listFieldError = validateResule.getFieldErrors();
            Map<String, String> errors = new HashMap<>();
            for (FieldError e: listFieldError) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data", nv);
            return "nhan_vien/update";
        }
        nvr.save(nv);
        return "redirect:/nhan-vien/hien-thi";
    }

    @RequestMapping("add")
    public String add(){
        return "nhan_vien/add";
    }

    @PostMapping("store")
    public String add(Model model, @Valid NhanVien nv, BindingResult validateResule, RedirectAttributes redirectAttributes){
        byte trangThai = 1;
        if(validateResule.hasErrors()){
            List<FieldError> listFieldError = validateResule.getFieldErrors();
            Map<String, String> errors = new HashMap<>();
            for (FieldError e: listFieldError) {
                errors.put(e.getField(), e.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            model.addAttribute("data", nv);
            return "nhan_vien/add";
        }
        if(nvr.existsByMa(nv.getMa())){
            redirectAttributes.addFlashAttribute("message", "Mã của bạn bị trùng");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
            return "redirect:/nhan-vien/add";
        }
        if(nvr.existsByAccountFE(nv.getAccountFE())){
            redirectAttributes.addFlashAttribute("message", "Email FE của bạn bị trùng");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
            return "redirect:/nhan-vien/add";
        }
        if(nvr.existsByAccountFPT(nv.getAccountFPT())){
            redirectAttributes.addFlashAttribute("message", "Email FPT của bạn bị trùng");
            redirectAttributes.addFlashAttribute("alertClass", "alert-danger");
            return "redirect:/nhan-vien/add";
        }
        nv.setTrangThai(trangThai);
        nvr.save(nv);
        return "redirect:/nhan-vien/hien-thi";
    }
}
