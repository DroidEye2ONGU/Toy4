package com.toy.Model;

import com.toy.pojo.Item;

import java.util.List;

public class ItemModel {
    private List<Item> items;

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public ItemModel(List<Item> items) {
        this.items = items;
    }

    public ItemModel() {
    }
}
