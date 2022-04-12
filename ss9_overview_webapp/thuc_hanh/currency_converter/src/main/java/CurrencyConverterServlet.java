import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

@WebServlet(name = "CurrencyConverterServlet" , urlPatterns = "/currency")
public class CurrencyConverterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Float rate = Float.parseFloat(request.getParameter("rate"));
            Float usd = Float.parseFloat(request.getParameter("usd"));

            float vnd = rate*usd;

        PrintWriter writer = response.getWriter();

        writer.println("<html>");
        writer.println("<h1>Rate: " + rate + "</h1>");
        writer.println("<h1>USD: " + usd + "</h1>");
        writer.printf("<h1>VND: %.2f </h1>",vnd);
        writer.println("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
