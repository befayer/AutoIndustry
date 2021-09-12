package servlets;

import dao.BrandDAO;
import dao.VehicleDAO;
import entities.Brand;
import entities.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/brands")
public class BrandServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("brands", BrandDAO.findAll());
        req.getRequestDispatcher("brand.jsp").forward(req, resp);
}

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String action = req.getParameter("action");
        switch (action){
            case "add":{
                BrandDAO.save(new Brand(req.getParameter("name")));
                resp.sendRedirect(req.getContextPath() + "/brands");
                break;
            }
            case "edit":{
                Brand brand = BrandDAO.findById(Integer.parseInt(req.getParameter("id")));
                brand.setBrandName(req.getParameter("name"));
                BrandDAO.update(brand);
                resp.sendRedirect(req.getContextPath() + "/brands");
                break;
            }
            case "delete":{
                BrandDAO.delete(BrandDAO.findById(Integer.parseInt(req.getParameter("id"))));
                resp.sendRedirect(req.getContextPath() + "/brands");
                break;
            }
        }
    }
}
