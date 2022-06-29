package repository;

import model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepositoryImpl implements IStudentRepository {
    static List<Student> studentList = new ArrayList<>();

    static {
        studentList.add(new Student(1, "Chien", "C0322G1", 1, 5));
        studentList.add(new Student(2, "Tien Dat", "C0222G1", 1, 7));
        studentList.add(new Student(3, "Hoan", "C0222G1", 0, 9));
        studentList.add(new Student(4, "Hai", "C0422G1", 0, 2));
        studentList.add(new Student(5, "Tuong", "C0322G1", 1, 7));
    }

    @Override
    public List<Student> findAll() {
        return studentList;
    }

    @Override
    public void create(Student student) {
        studentList.add(student);
    }

    @Override
    public void edit() {

    }

    @Override
    public List<Student> findByName(String name) {
        List<Student> searchList = new ArrayList<>();
        for (Student item :
                studentList) {
            if (item.getName().contains(name)){
                searchList.add(item);
            }
        }
        return searchList;
    }

    @Override
    public void delete() {

    }
}
