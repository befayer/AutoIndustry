package dao;

import entities.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import untils.HibernateSessionFactoryUtil;

import entities.Brand;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BrandDAO {

    private static final Logger logger = Logger.getLogger(VehicleDAO.class.getName());

    public static Brand findById(int id){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            logger.log(Level.INFO, "Brand search query by id (findById)");
            return session.get(Brand.class, id);
        }
    }

    public static void save(Brand brand){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            session.save(brand);
            transaction.commit();
            logger.log(Level.INFO, "Was saved a brand with id: " + brand.getBrandId());
        }
    }

    public static void update(Brand brand){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(brand);
            transaction.commit();
            logger.log(Level.INFO, "Was updated a brand with id: " + brand.getBrandId());
        }
    }

    public static void delete(Brand brand){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
        Transaction transaction = session.beginTransaction();
        session.delete(brand);
        transaction.commit();
        logger.log(Level.INFO, "Was deleted a brand with id: " + brand.getBrandId());
        }
    }

    public Factory findFactoryById (int id){
        return HibernateSessionFactoryUtil.getSessionFactory().openSession().get(Factory.class, id);
    }

    public Model findModelById (int id){
        return HibernateSessionFactoryUtil.getSessionFactory().openSession().get(Model.class, id);
    }

    public static List<Brand> findAll(){
        List<Brand> brands = (List<Brand>) HibernateSessionFactoryUtil.getSessionFactory().openSession().createQuery("from Brand").list();
        logger.log(Level.INFO, "Request for a list of all brands");
        return brands;
    }
}