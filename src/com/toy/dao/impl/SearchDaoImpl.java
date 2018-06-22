package com.toy.dao.impl;

import com.toy.dao.SearchDao;
import com.toy.pojo.Item;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SearchDaoImpl implements SearchDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Item> selectItemByName(String itemName) {
        Criteria criteria = sessionFactory.openSession().createCriteria(Item.class);
        criteria.add(Restrictions.eq("%itemName%",itemName));

        return criteria.list();
    }
}
