/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Invoice;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class InvoiceDAO {
    private final SessionFactory sessionFactory;
    
    public InvoiceDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    public Invoice getInvoiceById(int id) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            String hql = "FROM " + Invoice.class.getName() + " i WHERE i.invoiceId = :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            Invoice invoice = (Invoice) query.uniqueResult();
            session.getTransaction().commit();
            return invoice;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public List<Invoice> getInvoiceList() {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            String hql = "FROM " + Invoice.class.getName();
            Query query = session.createQuery(hql);
            List<Invoice> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public boolean addOrUpdateInvoice(Invoice invoice) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(invoice);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
    
   
    
}
