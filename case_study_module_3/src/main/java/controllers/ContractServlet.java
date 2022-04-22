package controllers;

import model.Customer;
import model.Employee;
import model.Service;
import service.contract.IContractService;
import service.contract.impl.ContractServiceImpl;
import service.i_employee.IEmployeeService;
import service.icustomer.ICustomerService;
import service.icustomer.customer.CustomerServiceImpl;
import service.impl.employees.EmployeeServiceImpl;
import service.impl.services.ServicesServiceImpl;
import service.iservices.IServicesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    private final IContractService contractService = new ContractServiceImpl();
    private final IEmployeeService employeeService = new EmployeeServiceImpl();
    private final ICustomerService customerService =  new CustomerServiceImpl();
    private final IServicesService service = new ServicesServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action="";
        }
        switch (action){
            case "create":
                createContractForm(request,response);
                break;
            default:
                listContract(request,response);
                break;
        }
    }

    private void createContractForm(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employees = this.employeeService.getList();
        List<Customer> customers = this.customerService.listCustomer();
        List<Service> services = this.service.listService();
        request.setAttribute("employees",employees);
        request.setAttribute("customers",customers);
        request.setAttribute("services",services);
        try {
            request.getRequestDispatcher("view/contract/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listContract(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/contract/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
