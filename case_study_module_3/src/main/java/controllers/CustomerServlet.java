package controllers;

import model.Customer;
import model.CustomerType;
import service.icustomer.ICustomerService;
import service.icustomer.ICustomerTypeService;
import service.icustomer.customer.CustomerServiceImpl;
import service.icustomer.customer.CustomerTypeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerServiceImpl();
    private ICustomerTypeService customerTypeService = new CustomerTypeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            default:
                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dob");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String passport = request.getParameter("passport");
        String phone = request.getParameter("phone");
        String email =request.getParameter("email");
        String address =request.getParameter("address");
        Integer customerTypeCode = Integer.parseInt(request.getParameter("type_code"));
        Integer id = Integer.valueOf(request.getParameter("id"));
        Customer customer = new Customer(id,code,name,dayOfBirth,gender,passport,phone,email,address,customerTypeCode);

        Map<String,String> validate = this.iCustomerService.editCustomer(customer);
        if(validate.isEmpty()){

            request.setAttribute("message","Chỉnh sửa thành công");
            try {
                request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }else{
            List<CustomerType> customerTypes = this.customerTypeService.listCustomerType();
            request.setAttribute("customerType",customerTypes);

            request.setAttribute("error",validate);
            try {
                request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("dob");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String passport = request.getParameter("passport");
        String phone = request.getParameter("phone");
        String email =request.getParameter("email");
        String address =request.getParameter("address");
        Integer customerTypeCode = Integer.parseInt(request.getParameter("type_code"));
        Integer id = null;
        Customer customer = new Customer(id,code,name,dayOfBirth,gender,passport,phone,email,address,customerTypeCode);
        Map<String, String> validate = this.iCustomerService.createCustomer(customer);
        if(validate.isEmpty()){
            request.setAttribute("message","Tạo mới thành công");
            request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
        }else{
            request.setAttribute("error",validate);
            List<CustomerType> customerTypes = this.customerTypeService.listCustomerType();
            request.setAttribute("customerType",customerTypes);
            request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
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
                createCustomerForm(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            case "edit":
                editCustomerForm(request,response);
                break;
            case "search":
                searchCustomer(request,response);
                break;
            default:
                listCustomer(request,response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("name_search");
        Integer typeCustomerSearch = Integer.valueOf(request.getParameter("type_customer_search"));
        String emailSearch = request.getParameter("email_search");
        List<Customer> customers = this.iCustomerService.searchCustomer(nameSearch,typeCustomerSearch,emailSearch);
        request.setAttribute("customers",customers);
        List<CustomerType> customerTypes = this.customerTypeService.listCustomerType();
        request.setAttribute("customerTypes",customerTypes);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CustomerType> customerTypes = this.customerTypeService.listCustomerType();
        Customer customer = this.iCustomerService.findCustomerById(id);
        request.setAttribute("types",customerTypes);
        request.setAttribute("customer",customer);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
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
        List<CustomerType> customerTypes = this.customerTypeService.listCustomerType();
        request.setAttribute("customerType",customerTypes);
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = this.iCustomerService.listCustomer();
        List<CustomerType> customerTypes = this.customerTypeService.listCustomerType();
        request.setAttribute("customers",customerList);
        request.setAttribute("customerTypes",customerTypes);
        request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
    }
}
