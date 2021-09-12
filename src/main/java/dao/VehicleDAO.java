package dao;

import entities.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import untils.HibernateSessionFactoryUtil;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.logging.*;

import java.util.List;

public class VehicleDAO {

    private static final Logger logger = Logger.getLogger(VehicleDAO.class.getName());


    public static Vehicle findById (int id){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            logger.log(Level.INFO, "Vehicle search query by id (findById)");
            return session.get(Vehicle.class, id);
        }
    }

    public static void save(Vehicle vehicle, int id_model, int id_dealer,int id_factory){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            Model model = session.get(Model.class, id_model);
            Dealer dealer = session.get(Dealer.class, id_dealer);
            Factory factory = session.get(Factory.class, id_factory);
            vehicle.setVehicleIdModel(model);
            vehicle.setVehicleIdDealer(dealer);
            vehicle.setVehicleIdFactory(factory);
            session.save(vehicle);
            transaction.commit();
            logger.log(Level.INFO, "Was saved a vehicle with id: " + vehicle.getVehicleId());
        }
    }

    /*public static void update(Vehicle vehicle, int id_model, int id_dealer, int id_factory){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();){
            Transaction transaction = session.beginTransaction();
            Model model = session.get(Model.class, id_model);
            Dealer dealer = session.get(Dealer.class, id_dealer);
            Factory factory = session.get(Factory.class, id_factory);
            model.addVehicle(vehicle);
            dealer.addVehicle(vehicle);
            factory.addVehicle(vehicle);
            vehicle.setVehicleIdModel(model);
            vehicle.setVehicleIdDealer(dealer);
            vehicle.setVehicleIdFactory(factory);
            session.update(model);
            session.update(dealer);
            session.update(factory);
            session.update(vehicle);
            transaction.commit();
        }
    }*/

    public static void update(Vehicle vehicle){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(vehicle);
            transaction.commit();
            logger.log(Level.INFO, "Was updated a vehicle with id: " + vehicle.getVehicleId());
        }
    }

    public static void delete(Vehicle vehicle){
        try (Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
        Transaction transaction = session.beginTransaction();
        session.delete(vehicle);
        transaction.commit();
        logger.log(Level.INFO, "Was deleted a vehicle with id: " + vehicle.getVehicleId());
        }
    }

    public static List<Vehicle> findAll(){
        List<Vehicle> vehicles = (List<Vehicle>) HibernateSessionFactoryUtil.getSessionFactory().openSession().createQuery("from Vehicle").list();
        logger.log(Level.INFO, "Request for a list of all vehicles");
        return vehicles;
    }

    public static List<Vehicle> executeHQLQuery(String hql, int p1, int p2) {
        try {
            Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query q = session.createQuery(hql);
            q.setParameter("minYear", p1);
            q.setParameter("maxYear", p2);
            List<Vehicle> vehicles = q.list();
            session.getTransaction().commit();
            session.close();
            return vehicles;
        } catch (HibernateException he) {
            he.printStackTrace();
        }

        return null;
    }

    public static List<Vehicle> executeHQLQueryNameBrand(String hql, String p1) {
        try  {
            Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query q = session.createQuery(hql);
            q.setParameter("nameBrand", p1);
            List<Vehicle> vehicles = q.list();
            session.getTransaction().commit();
            session.close();
            return vehicles;
        } catch (HibernateException he) {
            he.printStackTrace();
        }
        return null;
    }
}
