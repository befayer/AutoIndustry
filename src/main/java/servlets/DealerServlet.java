package servlets;

import dao.*;
import entities.Brand;
import entities.Dealer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/dealers")
public class DealerServlet extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("dealers", DealerDAO.findAll());
        //req.setAttribute("requestDealers", DealerDAO.findAll());
        req.getRequestDispatcher("dealer.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String action = req.getParameter("action");
        switch (action){
            case "add":{
                DealerDAO.save(new Dealer(req.getParameter("name"), req.getParameter("country"),
                        req.getParameter("city")));
                resp.sendRedirect(req.getContextPath() + "/dealers");
                break;
            }
            case "edit":{
                Dealer dealer = DealerDAO.findById(Integer.parseInt(req.getParameter("id")));
                dealer.setDealerName(req.getParameter("name"));
                dealer.setDealerCountry(req.getParameter("country"));
                dealer.setDealerCity(req.getParameter("city"));
                DealerDAO.update(dealer);
                resp.sendRedirect(req.getContextPath() + "/dealers");
                break;
            }
            case "delete":{
                DealerDAO.delete(DealerDAO.findById(Integer.parseInt(req.getParameter("id"))));
                resp.sendRedirect(req.getContextPath() + "/dealers");
                break;
            }
            case "request": {
                String REQUEST_PARAM_DEALER_COUNTRY = "FROM Dealer WHERE country_dealer=:nameCountry";
                if (req.getParameter("country").equals("")){
                    req.removeAttribute("requestDealers");
                    req.setAttribute("requestDealers", DealerDAO.executeHQLQuery(REQUEST_PARAM_DEALER_COUNTRY,null));
                    req.setAttribute("dealers", DealerDAO.findAll());
                    req.getRequestDispatcher("dealer.jsp").forward(req, resp);
                    break;
                }
                req.removeAttribute("requestDealers");
                req.setAttribute("requestDealers", DealerDAO.executeHQLQuery(REQUEST_PARAM_DEALER_COUNTRY,
                        req.getParameter("country")));
                //req.setAttribute("request", VehicleDAO.executeHQLQuery(REQUEST_PARAM_VEHICLE_YEAR, 2005, 2015));
                //resp.sendRedirect(req.getContextPath() + "/vehicles");

                req.setAttribute("dealers", DealerDAO.findAll());
                req.getRequestDispatcher("dealer.jsp").forward(req, resp);
                break;
            }
        }
    }
}
