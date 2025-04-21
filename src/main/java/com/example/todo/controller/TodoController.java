package com.example.todo.controller;

import com.example.todo.model.Todo;
import com.example.todo.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

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
        List<Todo> todos = todoService.findAll().stream()
				.skip(0)
				.limit(10).collect(Collectors.toList());
        model.addAttribute("todos", todos);
        model.addAttribute("sort" + "TITLE", "desc");
        model.addAttribute("sort" + "DESCRIPTION", "desc");
        model.addAttribute("currentSort", "ID");
        model.addAttribute("currentOrder", "asc");
        model.addAttribute("nextPage", "2");       
        return "todo/list";
    }
    
    @GetMapping("/{id}")
    public String viewTodo(@PathVariable Long id, Model model) {
        Todo todo = todoService.findById(id);
        model.addAttribute("todo", todo);
        model.addAttribute("sort" + "TITLE", "desc");
        model.addAttribute("sort" + "DESCRIPTION", "desc");
        model.addAttribute("currentSort", "ID");
        model.addAttribute("currentOrder", "asc");
        model.addAttribute("nextPage", "2");       
       return "todo/view";
    }
    
    @GetMapping("/new")
    public String newTodoForm(Model model) {
        model.addAttribute("todo", new Todo());
        model.addAttribute("sort" + "TITLE", "desc");
        model.addAttribute("sort" + "DESCRIPTION", "desc");
        model.addAttribute("currentSort", "ID");
        model.addAttribute("currentOrder", "asc");
       model.addAttribute("nextPage", "2");       
        return "todo/form";
    }
    
    @GetMapping("/{id}/edit")
    public String editTodoForm(@PathVariable Long id, Model model) {
        Todo todo = todoService.findById(id);
        model.addAttribute("todo", todo);
        model.addAttribute("sort" + "TITLE", "desc");
        model.addAttribute("sort" + "DESCRIPTION", "desc");
        model.addAttribute("currentSort", "ID");
        model.addAttribute("currentOrder", "asc");
        model.addAttribute("nextPage", "2");       
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
    @GetMapping("/sort/{sortType}/{sortOrder}/{page}")
    public String toggleTodoStatus(Model model, @PathVariable String sortType, @PathVariable String sortOrder, @PathVariable String page) {
    	List<Todo> todos = todoService.sort(sortType, sortOrder, page);
    	if (page==null)
    		page ="1";
    	if (sortType==null)
    		sortType ="ID";
    	
        model.addAttribute("todos", todos);
        model.addAttribute("sort" + "TITLE", "desc");
        model.addAttribute("sort" + "DESCRIPTION", "desc");
        if (sortOrder.equalsIgnoreCase("DESC")) {
        	model.addAttribute("sort" + sortType, "asc");
        }
        model.addAttribute("currentSort", sortType);
        model.addAttribute("currentOrder", sortOrder);
        model.addAttribute("nextPage", "0" + (Integer.parseInt(page)+1));   
        
        return "todo/list";
    }
}