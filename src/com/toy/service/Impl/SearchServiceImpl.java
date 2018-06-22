package com.toy.service.Impl;

import com.toy.pojo.Item;
import com.toy.service.SearchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {
    @Override
    public List<Item> searchItem(String itemName) {
        return null;
    }
/*
    @Autowired
    private SearchDao searchDao;

    @Override
    public List<Item> searchItem(String itemName) {
        List<Item> result = searchDao.selectItemByName(itemName);
        return result;
    }*/
}
