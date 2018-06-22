package com.toy.dao.impl;

import com.toy.dao.ToyDao;
import com.toy.pojo.Item;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ToyDaoImpl implements ToyDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addToy(Item item) {
        sessionFactory.openSession().save(item);
    }

    @Override
    public void deleteToy(Integer id) {

        Session session = sessionFactory.openSession();

        Transaction transaction = session.beginTransaction();
        Item item = session.get(Item.class, id);
        session.delete(item);
        transaction.commit();
        //
        //String hql = "delete from Item item where item.id ="+id;
        //session.createQuery(hql).executeUpdate();

        //Item item = session.get(Item.class, id);
        //session.delete(item);

    }

    @Override
    public void modifyToy(Item item) {
        //Session session = sessionFactory.openSession();
        //session.update(item);

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(item);

        transaction.commit();
    }

    @Override
    public List<Item> queryAllToy() {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Item.class);

        List<Item> itemList = criteria.list();

        return itemList;
    }

    @Override
    public Item queryToyById(Integer id) {
        Session session = sessionFactory.openSession();
        Item item = session.get(Item.class, id);
        return item;
    }
}
