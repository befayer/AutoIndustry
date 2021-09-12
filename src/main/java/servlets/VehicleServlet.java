package servlets;

import dao.DealerDAO;
import dao.FactoryDAO;
import dao.ModelDAO;
import dao.VehicleDAO;
import entities.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/vehicles")
public class VehicleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("models", ModelDAO.findAll());
        req.setAttribute("dealers", DealerDAO.findAll());
        req.setAttribute("factories", FactoryDAO.findAll());
        req.setAttribute("vehicles", VehicleDAO.findAll());
        req.getRequestDispatcher("vehicle.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String action = req.getParameter("action");
        switch (action){
            case "add":{
                VehicleDAO.save(new Vehicle(Integer.parseInt(req.getParameter("year")), req.getParameter("color"), req.getParameter("type")),
                        Integer.parseInt(req.getParameter("id_model")),Integer.parseInt(req.getParameter("id_dealer")),
                        Integer.parseInt(req.getParameter("id_factory")));
                resp.sendRedirect(req.getContextPath() + "/vehicles");
                break;
            }
            case "edit":{
                Vehicle vehicle = VehicleDAO.findById(Integer.parseInt(req.getParameter("id")));
                vehicle.setVehicleYear(Integer.parseInt(req.getParameter("year")));
                vehicle.setVehicleColor(req.getParameter("color"));
                vehicle.setVehicleType(req.getParameter("type"));
                VehicleDAO.update(vehicle);
                resp.sendRedirect(req.getContextPath() + "/vehicles");
                break;
            }
            case "delete":{
                VehicleDAO.delete(VehicleDAO.findById(Integer.parseInt(req.getParameter("id"))));
                resp.sendRedirect(req.getContextPath() + "/vehicles");
                break;
            }
            case "request": {
                String REQUEST_PARAM_VEHICLE_YEAR = "FROM Vehicle WHERE vehicleYear>:minYear  AND vehicleYear<:maxYear";
                if (req.getParameter("minYear").equals("") || req.getParameter("maxYear").equals("")){
                    req.removeAttribute("request");
                    req.setAttribute("request", VehicleDAO.executeHQLQuery(REQUEST_PARAM_VEHICLE_YEAR,0, 0));
                    req.setAttribute("models", ModelDAO.findAll());
                    req.setAttribute("dealers", DealerDAO.findAll());
                    req.setAttribute("factories", FactoryDAO.findAll());
                    req.setAttribute("vehicles", VehicleDAO.findAll());
                    req.getRequestDispatcher("vehicle.jsp").forward(req, resp);
                    break;
                }
                req.removeAttribute("request");
                req.setAttribute("request", VehicleDAO.executeHQLQuery(REQUEST_PARAM_VEHICLE_YEAR,
                        Integer.parseInt(req.getParameter("minYear")),
                        Integer.parseInt(req.getParameter("maxYear"))));

                req.setAttribute("models", ModelDAO.findAll());
                req.setAttribute("dealers", DealerDAO.findAll());
                req.setAttribute("factories", FactoryDAO.findAll());
                req.setAttribute("vehicles", VehicleDAO.findAll());
                req.getRequestDispatcher("vehicle.jsp").forward(req, resp);
                break;
            }
            case "requestNameBrand": {
                String REQUEST_PARAM_VEHICLE_NAME_BRAND = "SELECT v FROM Vehicle v JOIN Model m on v.model=m.modelId Join Brand b on m.brand=b.brandId AND b.brandName=:nameBrand";
                if (req.getParameter("nameBrand").equals("")){
                    req.removeAttribute("requestNameBrand");
                    req.setAttribute("requestNameBrand", VehicleDAO.executeHQLQueryNameBrand(REQUEST_PARAM_VEHICLE_NAME_BRAND,null));
                    req.setAttribute("models", ModelDAO.findAll());
                    req.setAttribute("dealers", DealerDAO.findAll());
                    req.setAttribute("factories", FactoryDAO.findAll());
                    req.setAttribute("vehicles", VehicleDAO.findAll());
                    req.getRequestDispatcher("vehicle.jsp").forward(req, resp);
                    break;
                }
                req.removeAttribute("requestNameBrand");
                req.setAttribute("requestNameBrand", VehicleDAO.executeHQLQueryNameBrand(REQUEST_PARAM_VEHICLE_NAME_BRAND,
                        req.getParameter("nameBrand")));

                req.setAttribute("vehicles", VehicleDAO.findAll());
                req.setAttribute("models", ModelDAO.findAll());
                req.setAttribute("dealers", DealerDAO.findAll());
                req.setAttribute("factories", FactoryDAO.findAll());
                req.getRequestDispatcher("vehicle.jsp").forward(req, resp);
                break;
            }
        }
    }
}
