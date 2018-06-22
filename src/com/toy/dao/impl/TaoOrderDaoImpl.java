package com.toy.dao.impl;

import com.toy.dao.ToyOrderDao;
import com.toy.pojo.Content;
import com.toy.pojo.Item;
import com.toy.pojo.Toyorder;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class TaoOrderDaoImpl implements ToyOrderDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Toyorder> getAllToyOrders() {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Toyorder.class);

        List<Toyorder> list = criteria.list();

        return list;
    }

    @Override
    public Toyorder querySingleToyOrder(String id) {
        Session session = sessionFactory.openSession();

        Toyorder order = session.get(Toyorder.class, id);

        return order;
    }

    @Override
    public boolean changeToyOrder(Toyorder toyorder) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(toyorder);

        transaction.commit();

        return true;
    }
}
