package servlets;

import dao.BrandDAO;
import dao.FactoryDAO;
import dao.VehicleDAO;
import entities.Brand;
import entities.Factory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/factories")
public class FactoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("brands", BrandDAO.findAll());
        req.setAttribute("factories", FactoryDAO.findAll());
        req.getRequestDispatcher("factory.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String action = req.getParameter("action");
        switch (action){
            case "add":{
                FactoryDAO.save(new Factory(req.getParameter("name"), req.getParameter("country"), req.getParameter("city")),
                        Integer.parseInt(req.getParameter("id_brand")));
                resp.sendRedirect(req.getContextPath() + "/factories");
                break;
            }
            case "edit":{
                Factory factory = FactoryDAO.findById(Integer.parseInt(req.getParameter("id")));
                factory.setFactoryName(req.getParameter("name"));
                factory.setFactoryCountry(req.getParameter("country"));
                factory.setFactoryCity(req.getParameter("city"));
                FactoryDAO.update(factory);
                resp.sendRedirect(req.getContextPath() + "/factories");
                break;
            }
            case "delete":{
                FactoryDAO.delete(FactoryDAO.findById(Integer.parseInt(req.getParameter("id"))));
                resp.sendRedirect(req.getContextPath() + "/factories");
                break;
            }
        }
    }
}
