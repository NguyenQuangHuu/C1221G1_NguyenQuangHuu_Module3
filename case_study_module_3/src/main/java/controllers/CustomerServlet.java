package controllers;

import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            default:
                System.out.println(action);
                listCustomer(request,response);
                break;
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dob");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String passport = request.getParameter("passport");
        String phone = request.getParameter("phone");
        String email =request.getParameter("email");
        String address =request.getParameter("address");
        Integer customerTypeCode = Integer.parseInt(request.getParameter("type_code"));
        Integer id = null;
        Customer customer = new Customer(id,name,dayOfBirth,gender,passport,phone,email,address,customerTypeCode);
        this.iCustomerService.createCustomer(customer);
        request.setAttribute("message","Tạo mới thành công");
        request.getRequestDispatcher("customer/create.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createCustomerForm(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            case "edit":
                editCustomerForm(request,response);
                break;
            default:
                System.out.println(action);
                listCustomer(request,response);
                break;
        }
    }

    private void editCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypes = this.iCustomerService.listCustomerType();
        request.setAttribute("types",customerTypes);
        try {
            request.getRequestDispatcher("customer/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.iCustomerService.removeCustomer(id);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypes = this.iCustomerService.listCustomerType();
        request.setAttribute("customerType",customerTypes);
        try {
            request.getRequestDispatcher("customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = this.iCustomerService.listCustomer();
        List<CustomerType> customerTypes = this.iCustomerService.listCustomerType();
        request.setAttribute("customers",customerList);
        request.setAttribute("customerTypes",customerTypes);
        request.getRequestDispatcher("customer/list.jsp").forward(request,response);
    }
}
