/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class CategoryDAO {
    private final SessionFactory sessionFactory;
    
    public CategoryDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    public Category getCategoryById(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "FROM " + Category.class.getName() + " c WHERE c.categoryId = :cate";
            Query query = session.createQuery(hql);
            query.setParameter("cate", id);
            Category category = (Category) query.uniqueResult();
            session.getTransaction().commit();
            return category;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public List<Category> getCategoryList() {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            List<Category> list = session.createCriteria(Category.class).list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public boolean addOrUpdateCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            session.saveOrUpdate(category);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
    
    public boolean deleteCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(category);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
            

}
