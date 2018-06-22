package com.toy.service.Impl;

import com.toy.dao.ToyDao;
import com.toy.pojo.Item;
import com.toy.service.ToyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ToyServiceImpl implements ToyService {

    @Autowired
    private ToyDao toyDao;

    @Override
    public List<Item> queryAllToys() {
        List<Item> toys = toyDao.queryAllToy();
        return toys;
    }

    @Override
    public boolean addToy(Item item) {
        toyDao.addToy(item);
        return true;
    }

    @Override
    public boolean modifyToy(Item item) {
        toyDao.modifyToy(item);
        return true;
    }

    @Override
    public boolean deleteToy(Integer id) {
        toyDao.deleteToy(id);
        return true;
    }

    @Override
    public Item queryToyById(Integer id) {
        Item item = toyDao.queryToyById(id);
        return item;
    }
}
