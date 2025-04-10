<%@ include file="../common/header.jsp" %>

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">View Todo</h3>
            </div>
            <div class="panel-body">
                <h2 class="${todo.completed ? 'completed' : ''}">${todo.title}</h2>
                <p class="${todo.completed ? 'completed' : ''}">${todo.description}</p>
                
                <hr>
                
                <dl class="dl-horizontal">
                    <dt>ID:</dt>
                    <dd>${todo.id}</dd>
                    
                    <dt>Status:</dt>
                    <dd>
                        <span class="label ${todo.completed ? 'label-success' : 'label-warning'}">
                            ${todo.completed ? 'Completed' : 'Pending'}
                        </span>
                    </dd>
                    
                    <dt>Created Date:</dt>
                    <dd><fmt:formatDate value="${todo.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" /></dd>
                    
                    <c:if test="${todo.completed}">
                        <dt>Completed Date:</dt>
                        <dd><fmt:formatDate value="${todo.completedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></dd>
                    </c:if>
                </dl>
                
                <div class="btn-group">
                    <a href="<c:url value="/todos"/>" class="btn btn-default">
                        <span class="glyphicon glyphicon-list"></span> Back to List
                    </a>
                    <a href="<c:url value="/todos/${todo.id}/edit"/>" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span> Edit
                    </a>
                    <a href="<c:url value="/todos/${todo.id}/toggle"/>" class="btn ${todo.completed ? 'btn-warning' : 'btn-success'}">
                        <span class="glyphicon ${todo.completed ? 'glyphicon-repeat' : 'glyphicon-ok'}"></span>
                        ${todo.completed ? 'Mark as Pending' : 'Mark as Completed'}
                    </a>
                    <a href="<c:url value="/todos/${todo.id}/delete"/>" class="btn btn-danger"
                       onclick="return confirm('Are you sure you want to delete this todo?');">
                        <span class="glyphicon glyphicon-trash"></span> Delete
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>