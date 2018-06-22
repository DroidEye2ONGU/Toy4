package com.toy.service;


import com.toy.pojo.Item;

import java.util.List;

public interface SearchService {
    List<Item> searchItem(String itemName);
}
