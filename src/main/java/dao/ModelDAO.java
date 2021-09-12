package dao;

import entities.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import untils.HibernateSessionFactoryUtil;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModelDAO {

    private static final Logger logger = Logger.getLogger(ModelDAO.class.getName());

    public static Model findById(int id){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            logger.log(Level.INFO, "Model search query by id (findById)");
            return session.get(Model.class, id);
        }
    }

    public static void save(Model model, int id_brand){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            Brand brand = session.get(Brand.class, id_brand);
            model.setModelIdBrand(brand);
            session.update(brand);
            session.save(model);
            transaction.commit();
            logger.log(Level.INFO, "Was saved a model with id: " + model.getModelId() + " with brand_id = " + model.getModelIdBrand());
        }
    }

    public static void update(Model model){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
        Transaction transaction = session.beginTransaction();
        session.update(model);
        transaction.commit();
        logger.log(Level.INFO, "Was updated a model with id: " + model.getModelId());
        }
    }

    public static void delete(Model model){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
        Transaction transaction = session.beginTransaction();
        session.delete(model);
        transaction.commit();
        logger.log(Level.INFO, "Was deleted a model with id: " + model.getModelId());
        }
    }

    public Vehicle findVehicleById (int id){
        return HibernateSessionFactoryUtil.getSessionFactory().openSession().get(Vehicle.class, id);
    }

    public static List<Model> findAll(){
        List<Model> models = (List<Model>) HibernateSessionFactoryUtil.getSessionFactory().openSession().createQuery("from Model").list();
        logger.log(Level.INFO, "Request for a list of all models");
        return models;
    }
}
