package com.toy.dao;

import com.toy.pojo.Item;

import java.util.List;

public interface SearchDao {
    List<Item> selectItemByName(String itemName);
}
