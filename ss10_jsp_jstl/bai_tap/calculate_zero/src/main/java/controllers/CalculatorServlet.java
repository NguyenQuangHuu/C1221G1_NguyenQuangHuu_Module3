package controllers;

import models.Calculate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet",urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        char operator = request.getParameter("operator").charAt(0);
        Calculate calculate = new Calculate();
        String message = "";
        int num1 = 0;
        int num2 = 0;
        try{
            num1 = Integer.parseInt(request.getParameter("number1"));
            num2 = Integer.parseInt(request.getParameter("number2"));
        }catch (NumberFormatException numberFormatException){
            message = numberFormatException.getMessage();
        }
        float result = 0.0f;
        try{

        result = calculate.calculate(num1,num2,operator);
        }catch (RuntimeException runtimeException){
            message = runtimeException.getMessage();
        }

        request.setAttribute("result",result);
        request.setAttribute("num1",num1);
        request.setAttribute("num2",num2);
        request.setAttribute("operator",operator);
        request.setAttribute("message",message);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
//        response.sendRedirect("/");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
