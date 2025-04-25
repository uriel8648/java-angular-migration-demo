package com.example.todo.controller;

import com.example.todo.model.Todo;
import com.example.todo.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/todos")
public class TodoRestController {
    
    private final TodoService todoService;
    
    @Autowired
    public TodoRestController(TodoService todoService) {
        this.todoService = todoService;
    }
    
    @GetMapping
    public ResponseEntity<List<Todo>> getAllTodos() {
        List<Todo> todos = todoService.findAll();
        return new ResponseEntity<>(todos, HttpStatus.OK);
    }
    @GetMapping ("/{sortType}/{sortOrder}/{page}")
    public ResponseEntity<List<Todo>> getAllTodosSorted(@PathVariable String sortType, @PathVariable String sortOrder, @PathVariable String page) {
        List<Todo> todos = todoService.sort(sortType, sortOrder, page);
        return new ResponseEntity<List<Todo>>(todos, HttpStatus.OK);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Todo> getTodoById(@PathVariable Long id) {
        Todo todo = todoService.findById(id);
        if (todo == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(todo, HttpStatus.OK);
    }
    
    @PostMapping
    public ResponseEntity<Todo> createTodo(@RequestBody Todo todo) {
        Todo savedTodo = todoService.save(todo);
        return new ResponseEntity<>(savedTodo, HttpStatus.CREATED);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Todo> updateTodo(@PathVariable Long id, @RequestBody Todo todo) {
        Todo existingTodo = todoService.findById(id);
        if (existingTodo == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        
        todo.setId(id);
        Todo updatedTodo = todoService.update(todo);
        return new ResponseEntity<>(updatedTodo, HttpStatus.OK);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTodo(@PathVariable Long id) {
        Todo existingTodo = todoService.findById(id);
        if (existingTodo == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        
        todoService.delete(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
    
    @PutMapping("/{id}/toggle")
    public ResponseEntity<Todo> toggleTodoStatus(@PathVariable Long id) {
        Todo todo = todoService.findById(id);
        if (todo == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        
        todo.setCompleted(!todo.isCompleted());
        Todo updatedTodo = todoService.update(todo);
        return new ResponseEntity<>(updatedTodo, HttpStatus.OK);
    }
}