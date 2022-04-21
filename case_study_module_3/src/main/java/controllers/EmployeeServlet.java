package controllers;

import model.Department;
import model.Employee;
import model.Level;
import model.Position;
import repository.IDepartmentRepository;
import service.i_employee.IDepartmentService;
import service.i_employee.IEmployeeService;
import service.i_employee.ILevelService;
import service.i_employee.IPositionService;
import service.i_employee.impl.DepartmentServiceImpl;
import service.i_employee.impl.LevelServiceImpl;
import service.i_employee.impl.PositionServiceImpl;
import service.impl.employees.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private final IEmployeeService service = new EmployeeServiceImpl();
    private final IDepartmentService departmentService = new DepartmentServiceImpl();
    private final ILevelService levelService = new LevelServiceImpl();
    private final IPositionService positionService = new PositionServiceImpl();
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
            case "edit":
                editEmployee(request,response);
                break;
            default:
                listEmployee(request,response);
                break;
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setId(Integer.valueOf(request.getParameter("id")));
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
        this.service.editEmployee(employee);
        request.setAttribute("message","Chỉnh sửa thành công");
        try {
            request.getRequestDispatcher("/view/employee/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
            case "edit":
                editEmployeeForm(request,response);
                break;
            default:
                listEmployee(request,response);
                break;
        }
    }

    private void editEmployeeForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.service.getEmployeeById(id);
        request.setAttribute("employee",employee);
        List<Position> positions = this.positionService.getList();
        List<Level> levels = this.levelService.getList();
        List<Department> departments = this.departmentService.getList();
        request.setAttribute("positions",positions);
        request.setAttribute("levels",levels);
        request.setAttribute("departments",departments);
        try {

            request.getRequestDispatcher("/view/employee/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployeeForm(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positions = this.positionService.getList();
        List<Level> levels = this.levelService.getList();
        List<Department> departments = this.departmentService.getList();
        try {
            request.setAttribute("positions",positions);
            request.setAttribute("levels",levels);
            request.setAttribute("departments",departments);
            request.getRequestDispatcher("view/employee/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employees = this.service.getList();
        List<Position> positions = this.positionService.getList();
        List<Level> levels = this.levelService.getList();
        List<Department> departments = this.departmentService.getList();
        try {
            request.setAttribute("employees",employees);
            request.setAttribute("positions",positions);
            request.setAttribute("levels",levels);
            request.setAttribute("departments",departments);
            request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
