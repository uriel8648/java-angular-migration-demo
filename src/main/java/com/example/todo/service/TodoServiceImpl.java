package com.example.todo.service;

import com.example.todo.model.Todo;
import com.example.todo.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoServiceImpl implements TodoService {
    
    private final TodoRepository todoRepository;
    
    @Autowired
    public TodoServiceImpl(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }
    
    @Override
    public List<Todo> findAll() {
        return todoRepository.findAll();
    }
    
    @Override
    public Todo findById(Long id) {
        return todoRepository.findById(id);
    }
    
    @Override
    public Todo save(Todo todo) {
        return todoRepository.save(todo);
    }
    
    @Override
    public Todo update(Todo todo) {
        return todoRepository.update(todo);
    }
    
    @Override
    public void delete(Long id) {
        todoRepository.delete(id);
    }
}