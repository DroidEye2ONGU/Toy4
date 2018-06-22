package com.toy.controller;

import com.toy.Model.ItemModel;
import com.toy.pojo.Item;
import com.toy.pojo.Manager;
import com.toy.service.AdminService;
import com.toy.service.ToyService;


import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin", method = RequestMethod.POST)
@ResponseBody
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private ToyService toyService;

    @RequestMapping("/addAdmin")
    public ModelAndView addAdmin(String name, String password) {
        Manager manager = new Manager();
        manager.setManagerName(name);
        manager.setManagerPassword(password);
        ModelAndView mav = new ModelAndView();
        Integer id = adminService.registerAdmin(manager);
        if (id != -1) {
            mav.addObject("newAccountPassword", manager.getManagerPassword());
            mav.addObject("newAccountID", id);
            mav.setViewName("/SY/adminLogin");
        } else {
            mav.addObject("unknowError", "-1");
            mav.setViewName("/SY/adminRegister");
        }
        return mav;
    }


    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public ModelAndView adminLogin(String id, String password) throws IOException {
        ModelAndView mav = new ModelAndView();
        if (adminService.loginAdmin(Integer.parseInt(id), password)) {
            mav.addObject("adminAccountName", adminService.
                    querySingleAdmin(Integer.parseInt(id)).getManagerName());
            mav.setViewName("/SY/adminHome");
        } else {
            mav.addObject("isWrongAccount", "false");
            mav.setViewName("/SY/adminLogin");
        }
        return mav;
    }

    @RequestMapping(value = "/queryAllToys", method = RequestMethod.GET)
    public ModelAndView queryAllToys() {
        List<Item> items = toyService.queryAllToys();

        ModelAndView mav = new ModelAndView();

        mav.addObject("itemList", items);
        mav.setViewName("/SY/ItemList");
        return mav;
    }

//    @RequestMapping(value = "/addToy",method = RequestMethod.POST)
//    public String addToy(String a, MultipartFile picture) {
//        System.out.println("11");
//        System.out.println(picture.getOriginalFilename());
//        return "SY/adminAddToy";//??怎么两个大括号
//    }

    @RequestMapping("/addToy")
    public ModelAndView addToy(String itemName, String title, String sellPoint,
                                  String brand, String fenlei,
                                  String price, String num,
                               @RequestParam("files")MultipartFile[] files) throws IOException {

        ModelAndView mav = new ModelAndView();

        Item item = new Item();

        item.setItemName(itemName);
        item.setTitle(title);
        item.setSellPoint(sellPoint);
        item.setPrice(Integer.parseInt(price));
        item.setNum(Integer.parseInt(num));
        item.setBrand(brand);
        item.setFenlei(fenlei);



        for (int i = 0; i < files.length; i++) {
            Long size = files[i].getSize();
            switch (i) {
                case 0:
                    if (size.toString().equals("0")) {
                        item.setImage(null);
                    } else {
                        item.setImage(saveFiles(files[i]));
                    }
                    break;
                case 1:
                    if (size.toString().equals("0")) {
                        item.setImage1(null);
                    } else {
                        item.setImage1(saveFiles(files[i]));
                    }
                    break;
                case 2:
                    if (size.toString().equals("0")) {
                        item.setImage2(null);
                    } else {
                        item.setImage2(saveFiles(files[i]));
                    }
                    break;
                default:
                    System.out.println("发生了错误");
                    break;
            }

        }


        if (toyService.addToy(item)) {
            mav.addObject("isAddedSucceed", "true");
        } else {
            mav.addObject("isAddedSucceed", "false");
        }

        mav.setViewName("/SY/adminAddToy");

        return mav;
    }



    @RequestMapping(value = "/modifyToySearch", method = RequestMethod.GET)
    public ModelAndView modifyToySearch() {
        List<Item> items1 = toyService.queryAllToys();
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemList", items1);
        mav.setViewName("/SY/modifyAndDeleteToy");
        return mav;
    }

    @RequestMapping(value = "/modifyToy", method = RequestMethod.POST)
    public ModelAndView modifyToy(ItemModel items, @RequestParam("files")MultipartFile[] files,
                                  @RequestParam("files1")MultipartFile[] files1,
                                  @RequestParam("files2")MultipartFile[] files2) throws IOException {
        ModelAndView mav = new ModelAndView();

        List<Item> itemList = items.getItems();

        if (itemList == null || itemList.size() <= 0) {
        } else {
            for (int i = 0; i < itemList.size(); i++) {

                Item item = itemList.get(i);

                //第一张图片处理
                Long size = files[i].getSize();
                if (size.toString().equals("0")) {
                    item.setImage(toyService.queryToyById(item.getId()).getImage());
                } else {
                    item.setImage(saveFiles(files[i]));
                }
                //第二张图片处理
                size = files1[i].getSize();
                if (size.toString().equals("0")) {
                    item.setImage1(toyService.queryToyById(item.getId()).getImage1());
                } else {
                    item.setImage1(saveFiles(files1[i]));
                }

                //第三张图片处理
                size = files2[i].getSize();
                if (size.toString().equals("0")) {
                    item.setImage2(toyService.queryToyById(item.getId()).getImage2());
                } else {
                    item.setImage2(saveFiles(files2[i]));
                }

                toyService.modifyToy(item);
            }
        }

        List<Item> items1 = toyService.queryAllToys();
        mav.addObject("itemList", items1);
        mav.setViewName("/SY/modifyAndDeleteToy");
        return mav;

    }

    @RequestMapping(value = "/deleteToy", method = RequestMethod.GET)
    public ModelAndView deleteToy(String id) {
        ModelAndView mav = new ModelAndView();
        toyService.deleteToy(Integer.parseInt(id));
        List<Item> items1 = toyService.queryAllToys();
        mav.addObject("itemList", items1);
        mav.setViewName("/SY/modifyAndDeleteToy");
        return mav;
    }


    public String saveFiles(MultipartFile file) throws IOException {
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        String imageName = UUID.randomUUID().toString()
                .replaceAll("-", "") + "." + ext;
        System.out.println("图片名字为:" + imageName);

        File thisFile = new File("C:\\Users\\70557\\Desktop\\toyMall\\toy-portal\\src\\main\\webapp\\WEB-INF\\images\\" + imageName);
        file.transferTo(thisFile);

        return imageName;
    }

}

