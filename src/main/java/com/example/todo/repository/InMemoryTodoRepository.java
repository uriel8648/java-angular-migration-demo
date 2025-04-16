package com.example.todo.repository;

import com.example.todo.model.Todo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

@Repository
public class InMemoryTodoRepository implements TodoRepository {
    
    private Map<Long, Todo> todos = new HashMap<>();
    private AtomicLong idGenerator = new AtomicLong(1);
    
    public InMemoryTodoRepository() {
        // Add some sample data
        save(new Todo(null, "Learn Spring MVC", "Study Spring MVC with JSP and JSTL"));
        save(new Todo(null, "Learn AngularJS", "Study AngularJS and integrate with JSP"));
        save(new Todo(null, "Build Todo App", "Create a complete Todo application"));
    }
    
    @Override
    public List<Todo> findAll() {
        return new ArrayList<>(todos.values());
    }
    
    @Override
    public Todo findById(Long id) {
        return todos.get(id);
    }
    
    @Override
    public Todo save(Todo todo) {
        if (todo.getId() == null) {
            todo.setId(idGenerator.getAndIncrement());
        }
        todos.put(todo.getId(), todo);
        return todo;
    }
    
    @Override
    public Todo update(Todo todo) {
        if (todo.getId() != null && todos.containsKey(todo.getId())) {
            todos.put(todo.getId(), todo);
            return todo;
        }
        return null;
    }
    
    @Override
    public void delete(Long id) {
        todos.remove(id);
    }

    @Override
    public void deleteAllById(List<Long> ids) {
        ids.forEach(todos::remove);
    }
}