package com.toy.service.Impl;

import com.toy.dao.ToyOrderDao;
import com.toy.pojo.Toyorder;
import com.toy.service.ToyOrderSerivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ToyOrderServiceImpl implements ToyOrderSerivce {
    @Autowired
    ToyOrderDao toyOrderDao;


    @Override
    public Toyorder querySingleToyById(String id) {
        Toyorder toyorder = toyOrderDao.querySingleToyOrder(id);
        return toyorder;
    }

    @Override
    public List<Toyorder> getAllOrders() {
        List<Toyorder> list = toyOrderDao.getAllToyOrders();
        return list;
    }

    @Override
    public boolean changeOrders(Toyorder toyorder) {
        boolean isSucceed = false;
        isSucceed = toyOrderDao.changeToyOrder(toyorder);
        return isSucceed;
    }
}
