/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Watch;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class WatchDAO {

    private final SessionFactory sessionFactory;

    public WatchDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    // Lấy hết danh sách đồng hồ
    public List<Watch> getWatchList() {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "FROM " + Watch.class.getName();
            Query query = session.createQuery(hql);
            List<Watch> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public List<Watch> getWatchList(int start, int range) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            String hql = "FROM " + Watch.class.getName();
            Query q = session.createQuery(hql);
            q.setFirstResult(start);
            q.setMaxResults(range);
            List<Watch> list = q.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public List<Watch> getListWatchByCategory(int category, int start, int range) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            String hql = "FROM " + Watch.class.getName() + " w WHERE w.category.categoryId = :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", category);
            query.setFirstResult(start);
            query.setMaxResults(range);
            List<Watch> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public List<Watch> getWatchByCategory(Integer CateId) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "SELECT w FROM " + Watch.class.getName() + " w WHERE w.category.categoryId =:catID ";
            Query query = session.createQuery(hql);
            query.setParameter("catID", CateId);
            List<Watch> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public Watch getWatchById(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            Watch w = (Watch) session.get(Watch.class, id);
            session.getTransaction().commit();
            return w;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public boolean addOrUpdateWatch(Watch watch) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            session.saveOrUpdate(watch);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction();
            return false;
        }
    }
    
    public boolean deleteWatch(Watch watch) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            session.delete(watch);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
    
    public static void main(String[] args) {
        System.out.println(2 > Math.ceil(15/12));
    }
    

}
