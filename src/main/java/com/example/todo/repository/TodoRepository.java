package com.example.todo.repository;

import com.example.todo.model.Todo;
import java.util.List;

public interface TodoRepository {
    List<Todo> findAll();
    Todo findById(Long id);
    Todo save(Todo todo);
    Todo update(Todo todo);
    void delete(Long id);
    void deleteAllById(List<Long> ids);
}