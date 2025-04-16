<%@ include file="common/header.jsp" %>
    <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.List" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <html>

                <head>
                    
                    <title>Pro Bulk Todo</title>
                    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                </head>

                <body ng-app="todoApp" ng-controller="TodoController">
                    <h2>Todo List (Bulk)</h2>
                    <button class="btn btn-info" onclick="selectAll()">Select All</button>
                    <button class="btn btn-success" ng-click="completeTodos()">Mark all completed</button>
                    <button class="btn btn-danger" ng-click="deleteTodos()">Remove selected</button>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Select</th>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Created Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%-- Uso de scriptlet para iterar --%>
                            <% List<com.example.todo.model.Todo> todos = (List<com.example.todo.model.Todo>)
                                    request.getAttribute("todos");
                                    for (com.example.todo.model.Todo t : todos) {
                                        String clase = t.isCompleted() ? "completed" : "";
                                        String claseLbl = t.isCompleted() ? "label-success" : "label-warning";
                                    %>
                                    <tr>
                                        <td><input type="checkbox" class="todo-checkbox" value="<%=t.getId()%>" /></td>
                                        <td>
                                            <%=t.getId()%>
                                        </td>
                                        <td class="<%= clase %>">
                                            <%=t.getTitle()%>
                                        </td>
                                        <td class="<%= clase %>">
                                            <%=t.getDescription()%>
                                        </td>
                                        <td>
                                            <%=t.getCreatedDate()%>
                                        </td>
                                        <td>
                                            <span class="label <%= claseLbl %>">
                                                <%=t.isCompleted() ? "Completed" : "Pending" %>
                                            </span>
                                        </td>
                                    </tr>
                                    <% } %>
                        </tbody>
                    </table>

                    <script>
                        function selectAll() {
                            // Manipulación directa del DOM
                            var checkboxes = document.getElementsByClassName('todo-checkbox');
                            for (var i = 0; i < checkboxes.length; i++) {
                                checkboxes[i].checked = true;
                            }
                        }

                        angular.module('todoApp', [])
                            .controller('TodoController', ['$scope', '$http', function ($scope, $http) {
                                $scope.completeTodos = function () {
                                var selected = [];
                                $('.todo-checkbox:checked').each(function () {
                                    selected.push($(this).val());
                                });
                                if (selected.length == 0) {
                                    alert('Seleccione al menos una tarea');
                                    return;
                                }
                                $.ajax({
                                    url: 'bulk/complete',
                                    type: 'POST',
                                    data: JSON.stringify(selected),
                                    contentType: 'application/json',
                                    async: false,
                                    success: function () {
                                        alert('Tareas marcadas');
                                        location.reload();
                                    },
                                    error: function () {
                                        location.reload();
                                    }
                                });
                            };

                                $scope.deleteTodos = function () {
                                    var selected = [];
                                    $('.todo-checkbox:checked').each(function () {
                                        selected.push($(this).val());
                                    });
                                    if (selected.length == 0) {
                                        alert('Seleccione al menos una tarea');
                                        return;
                                    }
                                    $.ajax({
                                        url: 'bulk/delete',
                                        type: 'POST',
                                        data: JSON.stringify(selected),
                                        contentType: 'application/json',
                                        async: false,
                                        success: function () {
                                            alert('Tareas eliminadas');
                                            location.reload();
                                        },
                                        error: function () {
                                            location.reload();
                                        }
                                    });
                                };
                            }]);
                    </script>
                </body>

                </html>