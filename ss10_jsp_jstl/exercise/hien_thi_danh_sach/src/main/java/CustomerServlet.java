import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    static List<Customer> customerList= new LinkedList<>();
    static {
        customerList.add(new Customer("a","04-08-2002","Hue","https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("b","04-08-2002","Hue","https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("v","04-08-2002","Hue","https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("c","04-08-2002","Hue","https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
