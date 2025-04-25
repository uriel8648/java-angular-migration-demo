<%@ include file="../common/header.jsp" %>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Todo List (JSP + JSTL View)</h3>
            </div>
            <div class="panel-body">
                <a href="<c:url value="/todos/new"/>" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span> Add New Todo
                </a>
                <a href="<c:url value="/todos/bulk"/>" class="btn btn-info">
                    <span class="glyphicon glyphicon-plus"></span> Todo Bulk Update
                </a>
                <script>
                    function filterTableRows() {
                        const selectedValue = document.getElementById("statusFilter").value;
                        const rows = document.querySelectorAll("tbody tr");

                        rows.forEach(row => {
                            const statusCell = row.children[4];
                            const statusText = statusCell.textContent.trim();

                            if (selectedValue === "All" || statusText === selectedValue) {
                                row.classList.remove("hidden");
                            }
                            else {
                                row.classList.add("hidden");
                            }
                        });
                    }
                </script>
                <c:set var="statuses" value="${fn:split('All,Completed,Pending,Unknown',',')}"/>
                <label>Filter by:</label>
                <select id="statusFilter" name="filterStatus" class="btn" onchange="filterTableRows()">
                    <c:forEach var="option" items="${statuses}" varStatus="status">
                        <option value="${option}" <c:if test="${status.index == 0}">selected</c:if>>${option}</option>
                    </c:forEach>
                </select>
                <hr>
                <c:choose>
                    <c:when test="${empty todos}">
                        <div class="alert alert-info">No todo items found. Create a new one!</div>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title<a href="<c:url value="/todos/sort/TITLE/${sortTITLE}/1"/>" class="btn btn-xs btn-danger" 
                                               onclick="return confirm('Sort by Title?');">
                                                <span class="glyphicon glyphicon-sort"></span>
                                            </a> </th>
                                    <th>Description<a href="<c:url value="/todos/sort/DESCRIPTION/${sortDESCRIPTION}/1"/>" class="btn btn-xs btn-danger" 
                                               onclick="return confirm('Sort by Description?');">
                                                <span class="glyphicon glyphicon-sort"></span>
                                            </a></th>
                                    <th>Created Date</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${todos}" var="todo">
                                	<tr>
                                        <td>${todo.id}</td>
                                        <td class="${todo.completed ? 'completed' : ''}">${todo.title}</td>
                                        <td class="${todo.completed ? 'completed' : ''}">${todo.description}</td>
                                        <td><fmt:formatDate value="${todo.createdDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                                        <td>
                                            <span class="label ${todo.completed ? 'label-success' : 'label-warning'}">
                                                ${todo.completed ? 'Completed' : 'Pending'}
                                            </span>
                                        </td>
                                        <td class="task-actions">
                                            <a href="<c:url value="/todos/${todo.id}"/>" class="btn btn-xs btn-info">
                                                <span class="glyphicon glyphicon-eye-open"></span>
                                            </a>
                                            <a href="<c:url value="/todos/${todo.id}/edit"/>" class="btn btn-xs btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </a>
                                            <a href="<c:url value="/todos/${todo.id}/toggle"/>" class="btn btn-xs ${todo.completed ? 'btn-warning' : 'btn-success'}">
                                                <span class="glyphicon ${todo.completed ? 'glyphicon-repeat' : 'glyphicon-ok'}"></span>
                                            </a>
                                            <a href="<c:url value="/todos/${todo.id}/delete"/>" class="btn btn-xs btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this todo?');">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
               		 	<c:if test="${!empty todos && todos.size() gt 9 }">
                        	<a href="<c:url value="/todos/sort/${currentSort}/${currentOrder}/${nextPage}"/>" class="btn btn-xs btn-danger">
                              <span class="glyphicon glyphicon-forward"></span></a>
                    	</c:if>
                    	<c:if test="${Integer.parseInt(nextPage) gt 2 }">
                        	<a href="<c:url value="/todos/sort/${currentSort}/${currentOrder}/${Integer.parseInt(nextPage + '-2') }"/>" class="btn btn-xs btn-danger">
                              <span class="glyphicon glyphicon-backward"></span></a>
                    	</c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>