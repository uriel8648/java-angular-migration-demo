<%@ include file="../common/header.jsp" %>
<%@ page import="com.example.todo.model.Todo" %>

<%-- Include AngularJS library (hosted version) --%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<div ng-app="todoApp" ng-controller="TodoController">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Todo List (AngularJS View)</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">{{editMode ? 'Edit Todo' : 'Add New Todo'}}</h3>
                                </div>
                                <div class="panel-body">
                                    <form ng-submit="saveTodo()">
                                        <div class="form-group">
                                            <label for="title">Title</label>
                                            <input type="text" class="form-control" id="title" ng-model="newTodo.title" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="description">Description</label>
                                            <textarea class="form-control" id="description" ng-model="newTodo.description" rows="3"></textarea>
                                        </div>
                                        
                                        <div class="form-group" ng-show="editMode">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" ng-model="newTodo.completed">
                                                    Mark as completed
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">{{editMode ? 'Update' : 'Add'}}</button>
                                            <button type="button" class="btn btn-default" ng-click="cancelEdit()" ng-show="editMode">Cancel</button>
                                           	<button  type="button" class="glyphicon glyphicon-forward" ng-click="toggleNextPage()" ng-show= "showNext"  class="btn btn-xs btn-danger">
                                       		<button  type="button" class="glyphicon glyphicon-backward" ng-click="togglePrevPage()" ng-show= "showPrev"  class="btn btn-xs btn-danger">
                                  		</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-8">
                            <div class="alert alert-info" ng-if="todos.length === 0">
                                No todo items found. Create a new one!
                            </div>
                            
                            <table class="table table-striped table-hover" ng-if="todos.length > 0">
                                <thead>
                                    <tr>
                                        <th>ID <button type="button" class="glyphicon glyphicon-sort" ng-click="toggleSortField('ID')" class="btn btn-xs btn-danger"> </th>
                                        <th>Title <button type="button" class="glyphicon glyphicon-sort" ng-click="toggleSortField('TITLE')" class="btn btn-xs btn-danger"></th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="todo in todos track by $index" >
                                        <td>{{todo.id}}</td>
                                        <td ng-class="{'completed': todo.completed}">{{todo.title}}</td>
                                        <td>
                                            <span class="label" ng-class="{'label-success': todo.completed, 'label-warning': !todo.completed}">
                                                {{todo.completed ? 'Completed' : 'Pending'}}
                                            </span>
                                        </td>
                                        <td class="task-actions">
                                            <button type="button" class="btn btn-xs btn-primary" ng-click="editTodo(todo, $index)">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                            <button type="button" class="btn btn-xs" 
                                                    ng-class="{'btn-warning': todo.completed, 'btn-success': !todo.completed}"
                                                    ng-click="toggleStatus(todo)">
                                                <span class="glyphicon" 
                                                      ng-class="{'glyphicon-repeat': todo.completed, 'glyphicon-ok': !todo.completed}"></span>
                                            </button>
                                            <button type="button" class="btn btn-xs btn-danger" ng-click="deleteTodo(todo.id, $index)">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <%Todo todoraw= new Todo(9999l,"RAW", "Radical Abstration Web"); %>
                            <%="Example of " +  todoraw.toString() %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- Include our AngularJS application --%>
<script src="<c:url value="/resources/js/todo-app.js"/>"></script>

<%@ include file="../common/footer.jsp" %>