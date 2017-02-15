/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class UserDAO {

    private final SessionFactory sessionFactory;

    public UserDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
     public List<User> getUserList() {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "FROM " + User.class.getName();
            Query query = session.createQuery(hql);
            List<User> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
     
     public User getUserById(Integer id) {
         Session session = sessionFactory.getCurrentSession();
         
         try {
             session.beginTransaction();
             User user = (User) session.get(User.class, id);
             session.getTransaction().commit();
             return user;
         } catch (Exception e) {
             e.printStackTrace();
             session.getTransaction().rollback();
             return null;
         }
     }
    
    public User getUserByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "FROM " + User.class.getName() + " u WHERE u.email =:email";
            Query query = session.createQuery(hql);
            query.setParameter("email", email);
            User user = (User)query.uniqueResult();
            session.getTransaction().commit();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public User getUserByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "FROM " + User.class.getName() + " u WHERE u.username =:username";
            Query query = session.createQuery(hql);
            query.setParameter("username", username);
            User user = (User)query.uniqueResult();
            session.getTransaction().commit();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public User getUserByUsernameAndPassword(String username, String password) {
        Session session = sessionFactory.getCurrentSession();
        
        try {
            session.beginTransaction();
            String hql = "FROM " + User.class.getName() + " e WHERE e.username = :user AND e.password = :pass";
            Query query = session.createQuery(hql);
            query.setParameter("user", username);
            query.setParameter("pass", password);
            User u = (User) query.uniqueResult();
            session.getTransaction().commit();
            return u;
            
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public boolean addOrUpdateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
         try {
            session.beginTransaction();
            session.saveOrUpdate(user);            
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
    
    public boolean deleteUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(user);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
    
  
}
