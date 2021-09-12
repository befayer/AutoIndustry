package dao;

import entities.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import untils.HibernateSessionFactoryUtil;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FactoryDAO {

    private static final Logger logger = Logger.getLogger(VehicleDAO.class.getName());

    public static Factory findById(int id){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            logger.log(Level.INFO, "Factory search query by id (findById)");
            return session.get(Factory.class, id);
        }
    }

    public static void save(Factory factory, int id_brand){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            Brand brand = session.get(Brand.class, id_brand);
            factory.setFactoryIdBrand(brand);
            session.update(brand);
            session.save(factory);
            transaction.commit();
            logger.log(Level.INFO, "Was saved a factory with id: " + factory.getFactoryId());
        }
    }

    public static void update(Factory factory){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
        Transaction transaction = session.beginTransaction();
        session.update(factory);
        transaction.commit();
        logger.log(Level.INFO, "Was updated a factory with id: " + factory.getFactoryId());
        }
    }

    public static void delete(Factory factory){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
        Transaction transaction = session.beginTransaction();
        session.delete(factory);
        transaction.commit();
        logger.log(Level.INFO, "Was deleted a factory with id: " + factory.getFactoryId());
        }
    }

    public Vehicle findVehicleById (int id){
        return HibernateSessionFactoryUtil.getSessionFactory().openSession().get(Vehicle.class, id);
    }

    public static List<Factory> findAll(){
        List<Factory> factories = (List<Factory>) HibernateSessionFactoryUtil.getSessionFactory().openSession().createQuery("from Factory").list();
        logger.log(Level.INFO, "Request for a list of all factories");
        return factories;
    }
}
