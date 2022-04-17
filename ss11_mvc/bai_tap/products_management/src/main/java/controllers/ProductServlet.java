package controllers;

import models.Product;
import services.IProductService;
import services.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/products")

public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "addNew":
                createProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
            default:

                break;

        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "addNew":
                showCreateForm(request,response);
                break;
            case "update":
                showUpdateForm(request,response);
                break;
            case "remove":
                removeProduct(request,response);
                break;
            case "detail":
                detailProduct(request,response);
                break;
            case "search":
                showSearchProduct(request,response);
            default:
                showProductList(request,response);
                break;

        }
    }

    private void showSearchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/search.jsp").forward(request,response);
    }

    private void detailProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product/detail.jsp").forward(request,response);
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        this.productService.removeProduct(product);
        request.setAttribute("message","Delete Success");
        request.getRequestDispatcher("product/list.jsp").forward(request,response);
    }


    private void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = this.productService.listProduct();
        request.setAttribute("products",productList);
        request.getRequestDispatcher("product/list.jsp").forward(request,response);
    }


    //Điều hướng vào form create
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/create.jsp").forward(request,response);
    }

    //Create Product Method
    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = (int) (Math.random()*100);
        String name = request.getParameter("name_product");
        String manufacturer = request.getParameter("manufacturer");
        double price = Double.parseDouble(request.getParameter("price_product"));
        int quantity = Integer.parseInt(request.getParameter("quantity_product"));
        Product product = new Product(id,name,manufacturer,price,quantity);
        this.productService.create(product);
        request.setAttribute("message","Add new completed");
        request.getRequestDispatcher("product/create.jsp").forward(request,response);
    }

    //Điều hướng qua trang jsp update
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product/update.jsp").forward(request,response);
    }

    // Sau khi submit form update sẽ vào đây xử lí
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        Double price = Double.valueOf(request.getParameter("price"));
        Integer quantity = Integer.valueOf(request.getParameter("quantity"));
        Product product = this.productService.findById(id);
        if(product == null){
            request.getRequestDispatcher("error-404.jsp");
        }
        else{
            this.productService.updateProduct(id,name,manufacturer,price,quantity,product);
            request.setAttribute("message","Updated Information success");
            request.getRequestDispatcher("product/update.jsp").forward(request,response);
        }

    }
    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("searchTxt");
        List<Product> result = this.productService.searchByName(search);
        if(result == null){
            request.setAttribute("message","Không tồn tại sản phầm này!");
            request.getRequestDispatcher("product/search.jsp").forward(request,response);
        }else{
            request.setAttribute("productList",result);
            request.getRequestDispatcher("product/search.jsp").forward(request,response);
        }

    }

}
