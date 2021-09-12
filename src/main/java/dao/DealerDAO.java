package dao;

import entities.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import untils.HibernateSessionFactoryUtil;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DealerDAO {

    private static final Logger logger = Logger.getLogger(VehicleDAO.class.getName());

    public static Dealer findById(int id){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            logger.log(Level.INFO, "Dealer search query by id (findById)");
            return session.get(Dealer.class, id);
        }
    }

    public static void save(Dealer dealer){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
        Transaction transaction = session.beginTransaction();
        session.save(dealer);
        transaction.commit();
        logger.log(Level.INFO, "Was saved a dealer with id: " + dealer.getDealerId());
        }
    }

    public static void update(Dealer dealer){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
        Transaction transaction = session.beginTransaction();
        session.update(dealer);
        transaction.commit();
        logger.log(Level.INFO, "Was updated a dealer with id: " + dealer.getDealerId());
        }
    }

    public static void delete(Dealer dealer){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(dealer);
            transaction.commit();
            logger.log(Level.INFO, "Was deleted a dealer with id: " + dealer.getDealerId());
        }
    }

    public Vehicle findVehicleById (int id){
        return HibernateSessionFactoryUtil.getSessionFactory().openSession().get(Vehicle.class, id);
    }

    public static List<Dealer> findAll(){
        List<Dealer> dealers = (List<Dealer>) HibernateSessionFactoryUtil.getSessionFactory().openSession().createQuery("from Dealer").list();
        logger.log(Level.INFO, "Request for a list of all dealers");
        return dealers;
    }

    public static List<Dealer> executeHQLQuery(String hql, String p1) {
        try  {
            Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query q = session.createQuery(hql);
            q.setParameter("nameCountry", p1);
            List<Dealer> dealers = q.list();
            session.getTransaction().commit();
            session.close();
            return dealers;
        } catch (HibernateException he) {
            he.printStackTrace();
        }
        return null;
    }
}
