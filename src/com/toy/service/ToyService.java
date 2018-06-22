package com.toy.service;

import com.toy.pojo.Item;

import java.util.List;

public interface ToyService {

    List<Item> queryAllToys();

    boolean addToy(Item item);

    boolean modifyToy(Item item);

    boolean deleteToy(Integer id);

    Item queryToyById(Integer id);
}
