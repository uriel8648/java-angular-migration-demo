package com.example.todo.controller;

import com.example.todo.model.Todo;
import com.example.todo.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/todos")
public class TodoController {
    
    private final TodoService todoService;
    
    @Autowired
    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }
    
    @GetMapping
    public String listTodos(Model model) {
        List<Todo> todos = todoService.findAll();
        model.addAttribute("todos", todos);
        return "todo/list";
    }
    
    @GetMapping("/{id}")
    public String viewTodo(@PathVariable Long id, Model model) {
        Todo todo = todoService.findById(id);
        model.addAttribute("todo", todo);
        return "todo/view";
    }
    
    @GetMapping("/new")
    public String newTodoForm(Model model) {
        model.addAttribute("todo", new Todo());
        return "todo/form";
    }
    
    @GetMapping("/{id}/edit")
    public String editTodoForm(@PathVariable Long id, Model model) {
        Todo todo = todoService.findById(id);
        model.addAttribute("todo", todo);
        return "todo/form";
    }
    
    @PostMapping
    public String saveTodo(@ModelAttribute Todo todo) {
        if (todo.getId() == null) {
            todoService.save(todo);
        } else {
            todoService.update(todo);
        }
        return "redirect:/todos";
    }
    
    @GetMapping("/{id}/delete")
    public String deleteTodo(@PathVariable Long id) {
        todoService.delete(id);
        return "redirect:/todos";
    }
    
    @GetMapping("/{id}/toggle")
    public String toggleTodoStatus(@PathVariable Long id) {
        Todo todo = todoService.findById(id);
        todo.setCompleted(!todo.isCompleted());
        todoService.update(todo);
        return "redirect:/todos";
    }
}