package servlets;

import dao.BrandDAO;
import dao.FactoryDAO;
import dao.ModelDAO;
import entities.Factory;
import entities.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/models")
public class ModelServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("brands", BrandDAO.findAll());
        req.setAttribute("models", ModelDAO.findAll());
        req.getRequestDispatcher("model.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String action = req.getParameter("action");
        switch (action){
            case "add":{
                ModelDAO.save(new Model(req.getParameter("name"), req.getParameter("type")),
                        Integer.parseInt(req.getParameter("id_brand")));
                resp.sendRedirect(req.getContextPath() + "/models");
                break;
            }
            case "edit":{
                Model model = ModelDAO.findById(Integer.parseInt(req.getParameter("id")));
                model.setModelName(req.getParameter("name"));
                model.setModelType(req.getParameter("type"));
                ModelDAO.update(model);
                resp.sendRedirect(req.getContextPath() + "/models");
                break;
            }
            case "delete":{
                ModelDAO.delete(ModelDAO.findById(Integer.parseInt(req.getParameter("id"))));
                resp.sendRedirect(req.getContextPath() + "/models");
                break;
            }
        }
    }
}
