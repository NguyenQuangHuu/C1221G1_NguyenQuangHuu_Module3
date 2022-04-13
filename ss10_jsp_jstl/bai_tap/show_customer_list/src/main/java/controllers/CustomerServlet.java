package controllers;

import models.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer-list")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1,"1994-01-01","Nguyễn Văn A","Đà Nẵng","https://cdn.nguyenkimmall.com/images/detailed/555/may-anh-cho-nguoi-moi.jpg"));
        customerList.add(new Customer(2,"1992-01-01","Nguyễn Văn B","Quảng Nam","https://cdn.nguyenkimmall.com/images/detailed/555/may-anh-cho-nguoi-moi.jpg"));
        customerList.add(new Customer(3,"1993-01-01","Nguyễn Văn C","Quảng Trị","https://cdn.nguyenkimmall.com/images/detailed/555/may-anh-cho-nguoi-moi.jpg"));
        customerList.add(new Customer(4,"1996-01-01","Nguyễn Văn D","Huế","https://cdn.nguyenkimmall.com/images/detailed/555/may-anh-cho-nguoi-moi.jpg"));
        request.setAttribute("customer_list",customerList);
        request.getRequestDispatcher("/customer_list.jsp").forward(request,response);

    }
}
