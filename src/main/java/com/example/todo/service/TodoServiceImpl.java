package com.example.todo.service;

import com.example.todo.model.Todo;
import com.example.todo.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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
    public List<Todo> sort(String sortType, String sortOrder) {
    	if (sortType.equalsIgnoreCase("TITLE") ) {
    		return todoRepository.findAll().stream().sorted(sortOrder.equalsIgnoreCase("ASC")?titleComparator:titleComparator.reversed() ).collect(Collectors.toList());
    	} 
    	if (sortType.equalsIgnoreCase("DESCRIPTION") ) {
    		return todoRepository.findAll().stream().sorted(sortOrder.equalsIgnoreCase("ASC")?descriptionComparator:descriptionComparator.reversed()  ).collect(Collectors.toList());
    	} 
      return todoRepository.findAll();
    }
    @Override
    public void delete(Long id) {
        todoRepository.delete(id);
    }

    @Override
    public void deleteAllById(List<Long> ids) {
        todoRepository.deleteAllById(ids);
    }
    
    Comparator<Todo> titleComparator = new Comparator<Todo>() {
    	  @Override
    	  public int compare(Todo i1, Todo i2) {
    	    return i2.getTitle().compareTo(i1.getTitle());
    	  }
    	}; 
        Comparator<Todo> descriptionComparator = new Comparator<Todo>() {
        	  @Override
        	  public int compare(Todo i1, Todo i2) {
        	    return i2.getDescription().compareTo(i1.getDescription());
        	  }
        	}; 
        	
}