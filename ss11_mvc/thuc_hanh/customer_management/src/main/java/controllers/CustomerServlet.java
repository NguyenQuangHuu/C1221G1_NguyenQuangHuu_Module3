package controllers;

import models.Customer;
import services.ICustomerService;
import services.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet" , urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action==null){
            action = "";
        }

        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            default:
                break;
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action==null){
            action = "";
        }

        switch (action){
            case "create":
                showCreateForm(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showDelete(request,response);
                break;
            case "view":
                viewCustomer(request,response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        if(customer == null){
            request.getRequestDispatcher("error-404.jsp");
        }else{
            request.setAttribute("customer",customer);
            request.getRequestDispatcher("customer/view.jsp").forward(request,response);
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        if(customer==null){
            request.getRequestDispatcher("error-404.jsp");
        }else{
            request.setAttribute("customer",customer);
            request.getRequestDispatcher("customer/delete.jsp").forward(request,response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher requestDispatcher;
        if(customer == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else{
            request.setAttribute("customer",customer);
            requestDispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }
        requestDispatcher.forward(request,response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest req,HttpServletResponse res){
        List<Customer> customerList = this.customerService.findAll();
        req.setAttribute("customers",customerList);
        try {
            req.getRequestDispatcher("/customer/list.jsp").forward(req,res);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = (int) (Math.random()*10000);
        Customer customer = new Customer(id,name,email,address);
        this.customerService.save(customer);
        request.setAttribute("message","New customer was created");
        try {
            request.getRequestDispatcher("customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = this.customerService.findById(id);
        if(customer == null){
            request.getRequestDispatcher("error-404.jsp");
        }else{
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            this.customerService.update(id,customer);
            request.setAttribute("customer",customer);
            request.setAttribute("message","Customer information was updated");
            request.getRequestDispatcher("customer/edit.jsp").forward(request,response);
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        if(customer == null){
            request.getRequestDispatcher("error-404.jsp");
        }else{
            this.customerService.remove(id);
            response.sendRedirect("/customers");
        }
    }

}
