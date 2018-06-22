package com.toy.dao.impl;

import com.toy.dao.AdminDao;
import com.toy.pojo.Item;
import com.toy.pojo.Manager;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    //由于主键自增策略,注册仅输入用户名和密码,由系统生成登陆ID,因此在插入一条数据后要返回该数据生成的ID
    public Integer addAdmin(Manager manager) {
        Integer id;
        try {
            sessionFactory.openSession().save(manager);

        } catch (Exception e) {
            System.out.println("增加一条管理员数据发生错误");
            id = -1;
            return id;
        }
        String hql = "from Manager order by id desc";
        Query query = sessionFactory.openSession().createQuery(hql);
        List<Manager> list = query.getResultList();
        id = list.get(0).getId();
        return id;
    }

    @Override
    public Manager queryManagerById(Integer id) {
        Session session = sessionFactory.openSession();
        Manager manager = session.get(Manager.class, id);
        return manager;
    }
}
