package com.example.todo.model;

import java.io.Serializable;
import java.util.Date;

public class Todo implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private Long id;
    private String title;
    private String description;
    private boolean completed;
    private Date createdDate;
    private Date completedDate;
    
    public Todo() {
        this.createdDate = new Date();
    }
    
    public Todo(Long id, String title, String description) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.completed = false;
        this.createdDate = new Date();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
        if (completed) {
            this.completedDate = new Date();
        } else {
            this.completedDate = null;
        }
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(Date completedDate) {
        this.completedDate = completedDate;
    }
    
    @Override
    public String toString() {
        return "Todo [id=" + id + ", title=" + title + ", completed=" + completed + "]";
    }
}