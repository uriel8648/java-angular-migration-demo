<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <h2>Lista de Tareas (Bulk)</h2>
                    <button onclick="selectAll()">Seleccionar todo</button>
                    <button ng-click="markSelectedCompleted()">Marcar como completadas</button>
                    <button ng-click="deleteSelected()">Eliminar seleccionadas</button>
                    <table>
                        <tr>
                            <th>Seleccionar</th>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                        </tr>
                        <%-- Uso de scriptlet para iterar --%>
                            <% List<com.example.todo.model.Todo> todos = (List<com.example.todo.model.Todo>)
                                    request.getAttribute("todos");
                                    for (com.example.todo.model.Todo t : todos) {
                                    %>
                                    <tr>
                                        <td><input type="checkbox" class="todo-checkbox" value="<%=t.getId()%>" /></td>
                                        <td>
                                            <%=t.getId()%>
                                        </td>
                                        <td>
                                            <%=t.getTitle()%>
                                        </td>
                                        <td>
                                            <%=t.isCompleted() ? "Completada" : "Pendiente" %>
                                        </td>
                                    </tr>
                                    <% } %>
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
                            .controller('TodoController', function ($scope) {
                                $scope.markSelectedCompleted = function () {
                                    var selected = [];
                                    $('.todo-checkbox:checked').each(function () {
                                        selected.push($(this).val());
                                    });
                                    if (selected.length == 0) {
                                        alert('Seleccione al menos una tarea');
                                        return;
                                    }
                                    // Llamada síncrona con jQuery
                                    $.ajax({
                                        url: 'bulk/complete',
                                        type: 'POST',
                                        data: JSON.stringify(selected),
                                        contentType: 'application/json',
                                        async: false,
                                        success: function () {
                                            alert('Tareas marcadas');
                                            location.reload();
                                        }
                                    });
                                };

                                $scope.deleteSelected = function () {
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
                                        }
                                    });
                                };
                            });
                    </script>
                </body>

                </html>