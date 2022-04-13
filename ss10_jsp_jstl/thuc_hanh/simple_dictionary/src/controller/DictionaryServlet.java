package controller;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "DictionaryServlet", urlPatterns = "/index")
public class DictionaryServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
            String search = request.getParameter("search");
            Map<String, String> dictionary = new HashMap<>();
            dictionary.put("hello","xin chào");
            dictionary.put("book","quyển sách");
            dictionary.put("country","quê hương");
            dictionary.put("love","tình yêu");

            String result = dictionary.get(search);

            request.setAttribute("resultText",result);
            request.getRequestDispatcher("/dictionary_result.jsp").forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
