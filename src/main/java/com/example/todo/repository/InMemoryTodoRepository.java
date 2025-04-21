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
        save(new Todo(null, "Build TodoPro App", "Create an enhanced Todo application"));
        save(new Todo(null, "Document Todo App", "Document Todo application"));
        save(new Todo(null, "Document TodoPro App", "Document the TodoPro application"));
        save(new Todo(null, "Demo Todo App", "Demostrate Todo application"));
        save(new Todo(null, "Demo TodoPro App", "Demostrate TodoPro application"));
        save(new Todo(null, "Prepare Release Todo App", "Prepare and Schedule Todo application"));
        save(new Todo(null, "Release Todo App", "Release Todo application"));
        save(new Todo(null, "QA Todo App", "QA Todo application"));
        save(new Todo(null, "Prepare Release TodoPro App", "Prepare and Schedule TodoPro application"));
        save(new Todo(null, "Release TodoPro App", "Release TodoPro application"));
        save(new Todo(null, "QA TodoPro App", "QA TodoPro application"));
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