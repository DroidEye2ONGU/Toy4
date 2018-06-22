package com.toy.dao;

import com.toy.pojo.Manager;

public interface AdminDao {

    Integer addAdmin(Manager manager);

    Manager queryManagerById(Integer id);


}
