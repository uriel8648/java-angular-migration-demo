package com.example.todo.service;

import com.example.todo.model.Todo;
import java.util.List;

public interface TodoService {
    List<Todo> findAll();
    Todo findById(Long id);
    Todo save(Todo todo);
    Todo update(Todo todo);
    List<Todo> sort(String sortType, String sortOrder);
    void delete(Long id);
}