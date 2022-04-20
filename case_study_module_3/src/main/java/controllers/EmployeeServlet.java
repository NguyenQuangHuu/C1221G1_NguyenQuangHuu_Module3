package controllers;

import model.Employee;
import service.IEmployeeService;
import service.impl.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private final IEmployeeService service = new EmployeeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createEmployee(request,response);
                break;
            default:
                listEmployee(request,response);
                break;
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setId(0);
        employee.setName(request.getParameter("name"));
        employee.setDayOfBirth(request.getParameter("dob"));
        employee.setGender(Integer.valueOf(request.getParameter("gender")));
        employee.setPassport(request.getParameter("passport"));
        employee.setSalary(Double.valueOf(request.getParameter("salary")));
        employee.setPhone(request.getParameter("phone"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPositionCode(Integer.valueOf(request.getParameter("positionCode")));
        employee.setLevelCode(Integer.valueOf(request.getParameter("levelCode")));
        employee.setDepartmentCode(Integer.valueOf(request.getParameter("departmentCode")));
        this.service.newEmployee(employee);
        request.setAttribute("message","Tạo mới thành công");
        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request,response);
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
                createEmployeeForm(request,response);
                break;
            default:
                listEmployee(request,response);
                break;
        }
    }

    private void createEmployeeForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
