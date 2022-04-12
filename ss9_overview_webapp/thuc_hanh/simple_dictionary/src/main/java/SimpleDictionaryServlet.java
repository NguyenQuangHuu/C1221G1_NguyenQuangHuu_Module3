import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SimpleDictionaryServlet" , urlPatterns = "/translate")
public class SimpleDictionaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String> dictionaryMap = new HashMap<>();
        dictionaryMap.put("hello","xin chào");
        dictionaryMap.put("how","thế nào");
        dictionaryMap.put("book","sách");
        dictionaryMap.put("computer","máy tính");

        String search = request.getParameter("txtSearch");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<meta charset=\"UTF-8\">");


        String result = dictionaryMap.get(search);
        if(result!=null){
            writer.println("Search text : "+search);
            writer.println("");
            writer.println("Result : "+ result);
        }else{
            writer.println("Search text : "+search);

            writer.println("Result: Not Found");
        }


        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
