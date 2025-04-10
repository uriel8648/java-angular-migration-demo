<%@ include file="../common/header.jsp" %>

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">${todo.id == null ? 'Add New Todo' : 'Edit Todo'}</h3>
            </div>
            <div class="panel-body">
                <form action="<c:url value="/todos"/>" method="post">
                    <c:if test="${todo.id != null}">
                        <input type="hidden" name="id" value="${todo.id}">
                    </c:if>
                    
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="${todo.title}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3">${todo.description}</textarea>
                    </div>
                    
                    <c:if test="${todo.id != null}">
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="completed" ${todo.completed ? 'checked' : ''}>
                                    Mark as completed
                                </label>
                            </div>
                        </div>
                    </c:if>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <a href="<c:url value="/todos"/>" class="btn btn-default">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>