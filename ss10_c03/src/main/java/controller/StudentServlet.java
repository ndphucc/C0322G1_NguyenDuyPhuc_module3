package controller;

import model.Student;
import service.IStudentService;
import service.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"/student", "/"})
public class StudentServlet extends HttpServlet {

    static List<Student> studentList = new ArrayList<>();
    private IStudentService studentService = new StudentServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                saveStudent(request, response);
                break;
            case "edit":
                break;
            case "search":
                break;
            default:
                findAll(request, response);
                break;
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            case "edit":
                break;
            case "search":
                findByName(request, response);
                break;
            default:
                findAll(request, response);
                break;
        }
    }

    private void findByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameSearch = request.getParameter("nameSearch");
        studentList = studentService.findByName(nameSearch);
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("studentList.jsp").forward(request, response);
    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        studentList = studentService.findAll();
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("studentList.jsp").forward(request, response);
    }
    private void saveStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String className = request.getParameter("className");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int score = Integer.parseInt(request.getParameter("score"));

        Student student = new Student(id, name, className, gender, score);
        studentService.create(student);
        response.sendRedirect("/student");

    }
}
