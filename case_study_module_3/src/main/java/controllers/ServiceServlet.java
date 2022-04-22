package controllers;

import model.RentType;
import model.Service;
import model.ServiceType;
import service.impl.services.RentTypeServiceImpl;
import service.impl.services.ServiceTypeServiceImpl;
import service.iservices.IRentTypeService;
import service.iservices.IServiceTypeService;
import service.iservices.IServicesService;
import service.impl.services.ServicesServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceServlet",urlPatterns = "/services")
public class ServiceServlet extends HttpServlet {
    private final IServicesService service = new ServicesServiceImpl();
    private final IServiceTypeService iServiceTypeService = new ServiceTypeServiceImpl();
    private final IRentTypeService iRentTypeService = new RentTypeServiceImpl();
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
        String code = request.getParameter("code");

        String name = request.getParameter("name");

        Double area = -1.0;
        try{
            area =  Double.parseDouble(request.getParameter("area"));
        }catch (NumberFormatException numberFormatException){
            System.out.println(numberFormatException.getMessage());
        }
        Double fee = -1.0;
        try {
            fee = Double.valueOf(request.getParameter("fee"));

        }catch (NumberFormatException numberFormatException){
            System.out.println(numberFormatException.getMessage());
        }


        Integer maximum = -1;
        try{
            maximum = Integer.valueOf(request.getParameter("maximum"));

        }catch (NumberFormatException numberFormatException){
            System.out.println(numberFormatException.getMessage());
        }
        String roomType = request.getParameter("roomType");
        String convenience = request.getParameter("convenience");
        Double poolArea = -1.0;
        try{
            poolArea = Double.valueOf(request.getParameter("poolArea"));

        }catch (NumberFormatException numberFormatException){
            System.out.println(numberFormatException.getMessage());
        }
        Integer floor = -1;
        try{
            floor = Integer.valueOf(request.getParameter("floor"));
        }catch (NumberFormatException numberFormatException){
            System.out.println(numberFormatException.getMessage());
        }
        Integer renType = Integer.valueOf(request.getParameter("renType"));
        Integer serviceType = Integer.valueOf(request.getParameter("serviceType"));
        Service service = new Service(0,code,name,area,fee,maximum,roomType,convenience,poolArea,floor,renType,serviceType);
        Map<String,String> validate = this.service.addService(service);
        if(validate.isEmpty()){
            request.setAttribute("message","Tạo thành công");
            try {
                List<ServiceType> serviceTypes = this.iServiceTypeService.getServiceType();
                List<RentType> rentTypes = this.iRentTypeService.getRentType();
                request.setAttribute("serviceTypes",serviceTypes);
                request.setAttribute("rentTypes",rentTypes);
                request.getRequestDispatcher("view/service/create.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            request.setAttribute("error",validate);
            try {
                List<ServiceType> serviceTypes = this.iServiceTypeService.getServiceType();
                List<RentType> rentTypes = this.iRentTypeService.getRentType();
                request.setAttribute("serviceTypes",serviceTypes);
                request.setAttribute("rentTypes",rentTypes);
                request.getRequestDispatcher("view/service/create.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

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
        List<ServiceType> serviceTypes = this.iServiceTypeService.getServiceType();
        List<RentType> rentTypes = this.iRentTypeService.getRentType();
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
            request.getRequestDispatcher("view/service/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
