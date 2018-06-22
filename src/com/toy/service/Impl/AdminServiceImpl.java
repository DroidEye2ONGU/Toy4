package com.toy.service.Impl;

import com.toy.dao.AdminDao;
import com.toy.pojo.Manager;
import com.toy.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public boolean loginAdmin(Integer id, String password) {

        Manager manager = adminDao.queryManagerById(id);

        if (manager != null) {
            if (manager.getId().equals(id) &&
                    manager.getManagerPassword().equals(password)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    @Override
    public Integer registerAdmin(Manager manager) {
        Integer id = adminDao.addAdmin(manager);
        return id;
    }

    @Override
    public Manager querySingleAdmin(Integer id) {
        Manager manager = adminDao.queryManagerById(id);
        return manager;
    }
}
