import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "DiscountServlet" ,urlPatterns = "/display-discount")
public class DiscountServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Integer number = Integer.parseInt(request.getParameter("listPrice"));
        Integer discountRate = Integer.parseInt(request.getParameter("discountPercent"));

        Double result = number*discountRate*0.01;

        PrintWriter writer = response.getWriter();

        writer.println("<html>");
        writer.println("<meta charset=UTF-8>");

        writer.println("<h3>Giá sau khi chiết khấu</h3>");

        writer.printf("Phần trăm chiết khấu : %.3f",result);
        writer.printf("Giá sản phẩm sau khi tính chiết khấu : %.3f",(number - result));

        writer.println("</html>");


    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
