import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calculatorServlet", value = "/calculate")
public class calculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result = "";
        try {
            float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
            float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
            char operator = request.getParameter("operator").charAt(0);
            switch (operator) {
                case '+':
                    result = firstOperand + "+" + secondOperand + "=" + (firstOperand + secondOperand);
                    break;
                case '-':
                    result = firstOperand + "-" + secondOperand + "=" + (firstOperand - secondOperand);
                    break;
                case '*':
                    result = firstOperand + "*" + secondOperand + "=" + (firstOperand * secondOperand);
                    break;
                case '/':
                    result = firstOperand + "/" + secondOperand + "=" + (firstOperand / secondOperand);
                    if (secondOperand==0) {
                        throw new DivisionZeroException();
                    }
                    break;
            }
        } catch (DivisionZeroException e) {
            result ="khong the chia voi 0";
        } catch (NumberFormatException e) {
            result = "khong the tinh toan chu";
        } finally {
            request.setAttribute("value", result);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        }
    }
}
