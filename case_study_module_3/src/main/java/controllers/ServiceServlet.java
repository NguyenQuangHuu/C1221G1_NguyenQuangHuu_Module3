package controllers;

import model.RentType;
import model.Service;
import model.ServiceType;
import service.IServicesService;
import service.impl.ServicesServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet",urlPatterns = "/services")
public class ServiceServlet extends HttpServlet {
    private final IServicesService service = new ServicesServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action) {
            case "create":
                createService(request, response);
                break;
            default:
                listService(request, response);
                break;
        }

    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Double area = Double.parseDouble(request.getParameter("area"));
        Double fee = Double.valueOf(request.getParameter("fee"));
        Integer maximum = Integer.valueOf(request.getParameter("maximum"));
        String roomType = request.getParameter("roomType");
        String convenience = request.getParameter("convenience");
        Double poolArea = Double.valueOf(request.getParameter("poolArea"));
        Integer floor = Integer.valueOf(request.getParameter("floor"));
        Integer renType = Integer.valueOf(request.getParameter("renType"));
        Integer serviceType = Integer.valueOf(request.getParameter("serviceType"));
        Service service = new Service(0,name,area,fee,maximum,roomType,convenience,poolArea,floor,renType,serviceType);
        this.service.addService(service);
        request.setAttribute("message","Tạo thành công");
        try {
            request.getRequestDispatcher("view/service/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createServiceForm(request,response);
                break;
            default:
                System.out.println(action);
                listService(request,response);
                break;
        }
    }

    private void createServiceForm(HttpServletRequest request, HttpServletResponse response) {
        List<ServiceType> serviceTypes = this.service.getServiceType();
        List<RentType> rentTypes = this.service.getRentType();
        request.setAttribute("serviceTypes",serviceTypes);
        request.setAttribute("rentTypes",rentTypes);

        try {
            request.getRequestDispatcher("view/service/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> services = this.service.listService();
        request.setAttribute("services",services);
        try {
            request.getRequestDispatcher("service/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
