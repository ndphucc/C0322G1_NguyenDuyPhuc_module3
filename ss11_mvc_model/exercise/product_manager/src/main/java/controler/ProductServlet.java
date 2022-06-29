package controler;

import model.Product;
import service.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/servlet")
public class ProductServlet extends HttpServlet {
    private ProductServiceImpl productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                displayAdd(request, response);
                break;
            case "find":
                search(request, response);
                break;
            case "edit":
                displayFormEdit(request, response);
                break;
            case "delete":
                displayDelete(request, response);
                break;
            case "view":
                view(request,response);
                break;
            default:
                displayList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                saveProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
        }
    }
    private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id =Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProduct(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("product/view.jsp").forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        displayList(request, response);
    }

    private void displayDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProduct(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("product/delete.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, description, producer);
        productService.add(product);
        displayList(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String find = request.getParameter("searchName");
        List<Product> productList = productService.find(find);
        request.setAttribute("list", productList);
        request.getRequestDispatcher("product/find.jsp").forward(request, response);
    }


    private void displayAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = productService.getId();
        request.setAttribute("id", id);
        request.getRequestDispatcher("product/create.jsp").forward(request, response);
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer id = productService.getId();
        String name = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        String description = request.getParameter("productDescription");
        String producer = request.getParameter("productProducer");
        Product product = new Product(id, name, price, description, producer);
        productService.add(product);
        displayList(request, response);
    }

    public void displayList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("list", productList);
        request.getRequestDispatcher("product/main.jsp").forward(request, response);
    }


    public void displayFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProduct(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("product/edit.jsp").forward(request, response);
    }
}
