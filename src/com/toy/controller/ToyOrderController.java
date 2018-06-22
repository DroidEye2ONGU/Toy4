package com.toy.controller;

import com.toy.pojo.Toyorder;
import com.toy.service.ToyOrderSerivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/toyorder")
public class ToyOrderController {
    @Autowired
    ToyOrderSerivce toyOrderSerivce;

    @RequestMapping(value = "/getallorders", method = RequestMethod.GET)
    public ModelAndView getAllOrders() {
        ModelAndView mav = new ModelAndView();

        List<Toyorder> list;
        list = toyOrderSerivce.getAllOrders();

        mav.addObject("orderList", list);
        mav.setViewName("SY/OrderList");

        return mav;
    }

    @RequestMapping(value = "/changeToyOdersSearch")
    public ModelAndView toySearch() {
        ModelAndView mav = new ModelAndView();

        List<Toyorder> list = toyOrderSerivce.getAllOrders();

        mav.addObject("orderList", list);
        mav.setViewName("/SY/modifyAndDeleteOrder");

        return mav;
    }

    @RequestMapping(value = "/changeorders", method = RequestMethod.POST)
    public ModelAndView changeOrderStatus(@RequestParam("orderId") String[] orderId,
                                          @RequestParam("shippingCode") String[] shippingCode) {
        ModelAndView mav = new ModelAndView();

        if (orderId.length == 0 || orderId == null) {
            mav.setViewName("/SY/modifyAndDeleteOrder");
        } else {
            for (int i = 0; i < orderId.length; i++) {
                if ((toyOrderSerivce.querySingleToyById(orderId[i]).getStatus().equals("2"))
                        ||(shippingCode[i].isEmpty() ||
                        shippingCode[i].trim().equals(""))) {
                    continue;
                } else {
                    Toyorder order = toyOrderSerivce.querySingleToyById(orderId[i]);
                    order.setStatus("2");
                    order.setShippingCode(shippingCode[i]);
                    toyOrderSerivce.changeOrders(order);
                }
            }
            List<Toyorder> list = toyOrderSerivce.getAllOrders();
            mav.addObject("orderList", list);
            mav.setViewName("/SY/modifyAndDeleteOrder");
        }

        return mav;
    }
}
