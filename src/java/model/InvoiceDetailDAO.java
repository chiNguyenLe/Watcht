/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Invoice;
import entities.InvoiceDetail;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Chi Nguyen T-rex
 */
public class InvoiceDetailDAO {
    private final SessionFactory sessionFactory;
    
    public InvoiceDetailDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    
    public List<InvoiceDetail> getInvoiceDetailList() {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            String hql = "FROM " + InvoiceDetail.class.getName();
            Query query = session.createQuery(hql);
            List<InvoiceDetail> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public List <InvoiceDetail> getInvoiceDetailByInvoice(Invoice invoice) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            String hql = "FROM " + InvoiceDetail.class.getName() + " i WHERE i.invoice = :invoice";
            Query query = session.createQuery(hql);
            query.setParameter("invoice", invoice);
            List<InvoiceDetail> list = query.list();
            session.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return null;
        }
    }
    
    public boolean addOrUpdateInvoiceDetail(InvoiceDetail detail) {
        Session session = sessionFactory.getCurrentSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(detail);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            return false;
        }
    }
    
    
    
}
