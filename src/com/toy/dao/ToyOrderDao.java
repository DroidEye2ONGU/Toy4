package com.toy.dao;

import com.toy.pojo.Toyorder;

import java.util.List;

public interface ToyOrderDao {
    public List<Toyorder> getAllToyOrders();

    public Toyorder querySingleToyOrder(String id);

    public boolean changeToyOrder(Toyorder toyorder);
}
