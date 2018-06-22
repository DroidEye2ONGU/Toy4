package com.toy.service;

import com.toy.pojo.Manager;

public interface AdminService {

    boolean loginAdmin(Integer id, String password);

    Integer registerAdmin(Manager manager);

    Manager querySingleAdmin(Integer id);
}
