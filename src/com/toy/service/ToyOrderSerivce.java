package com.toy.service;

import com.toy.pojo.Toyorder;

import java.util.List;

public interface ToyOrderSerivce {
    public Toyorder querySingleToyById(String id);

    public List<Toyorder> getAllOrders();

    public boolean changeOrders(Toyorder toyorder);
}
