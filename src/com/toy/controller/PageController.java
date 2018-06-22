package com.toy.controller;

import com.toy.pojo.Item;
import com.toy.service.ToyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page")
public class PageController {

    @Autowired
    private ToyService toyService;

    @RequestMapping("/index")
    public String pageIndex(){
        return "index";
    }

    @RequestMapping("/login")
    public String pageLogin(){
        return "login";
    }

    @RequestMapping("/register")
    public String pageRegister(){
        return "register";
    }

    @RequestMapping("/adminLogin")
    public String adminLogin() {
        return "SY/adminLogin";
    }

    @RequestMapping("/adminRegister")
    public String adminRegister() {
        return "SY/adminRegister";
    }

    @RequestMapping("/{page}")
    public String showPage(@PathVariable String page){
        return page;
    }

    @RequestMapping("/addToy")
    public String addToyPage() {
        return "SY/adminAddToy";
    }

    @RequestMapping(value="/queryToy",method = RequestMethod.GET)
    public String queryToyPage() {
        return "redirect:/admin/queryAllToys";
    }

    @RequestMapping(value="/manageToy",method = RequestMethod.GET)
    public String manageToyPage() {
        return "redirect:/admin/modifyToySearch";
    }

    @RequestMapping("/modifyToy")
    public ModelAndView modifyToyPage(String id) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("id", id);
        mav.setViewName("SY/modifyToy");

        return mav;
    }

    @RequestMapping(value = "/queryOrders", method = RequestMethod.GET)
    public String queryAllToyOrdersPage() {
        return "redirect:/toyorder/getallorders";
    }

}

