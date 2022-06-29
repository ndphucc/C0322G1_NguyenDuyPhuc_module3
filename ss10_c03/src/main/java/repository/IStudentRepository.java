package repository;

import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();

    void create(Student student);

    void edit();

    List<Student> findByName(String name);

    void delete();
}
