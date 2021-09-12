import dao.BrandDAO;
import entities.Brand;
import entities.Vehicle;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import untils.HibernateSessionFactoryUtil;

import java.util.List;

public class Main {
    public static void main(String[] args){
        //Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        String REQUEST_PARAM_VEHICLE_NAME_BRAND = "FROM Vehicle v, Model m, Brand b  WHERE v.model=m.modelId AND m.brand=b.brandId AND b.brandName=:nameBrand";
            Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query q = session.createQuery(REQUEST_PARAM_VEHICLE_NAME_BRAND);
            String s = "Chevrolet";
            q.setParameter("nameBrand", s);
            List<Vehicle> resultList = q.list();
        System.out.println(resultList);
            session.getTransaction().commit();
    }
}
