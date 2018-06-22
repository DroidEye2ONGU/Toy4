package com.toy.dao;

import com.toy.pojo.Item;

import java.util.List;

public interface ToyDao {

    void addToy(Item item); //添加一个玩具

    void deleteToy(Integer id); //删除ID为id的玩具

    void modifyToy(Item item); //更改玩具属性

    List<Item> queryAllToy();//查询到所有玩具并返回

    Item queryToyById(Integer id);
}
