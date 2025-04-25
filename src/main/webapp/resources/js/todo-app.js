(function() {
    'use strict';
    
    var todoApp = angular.module('todoApp', []);
    
    todoApp.controller('TodoController', ['$scope', '$http', function($scope, $http) {
        $scope.todos = [];
        $scope.newTodo = {
            title: '',
            description: '',
            completed: false
        };
        $scope.editMode = false;
        $scope.editIndex = -1;
        
		$scope.toggleNextPage = function() {
		      $scope.nextPage=(+$scope.nextPage) +1;
       		  $scope.loadTodos();	
			  $scope.resetForm();
			}
       $scope.togglePrevPage = function() {
			      $scope.nextPage=+$scope.nextPage -1 ;
			    $scope.loadTodos();	
			  $scope.resetForm();
		  				}
		$scope.toggleSortField = function(newvalue) {
		   if ($scope.sortField = newvalue) {
			$scope.toggleSortOrder ();
		} else {
				$scope.sortOrder='asc'
			}
			$scope.sortField=newvalue;
		   $scope.loadTodos();	
		 $scope.resetForm();
	 		  	}	
		$scope.toggleSortOrder = function() {
			console.error('$scope.sortOrder1 ',  $scope.sortOrder );
		  if($scope.sortOrder === 'asc') {
			$scope.sortOrder= 'desc';
			} else {
				$scope.sortOrder= 'asc';
			}
		}
        // Load all todos
        $scope.loadTodos = function() {
            $http.get('api/todos/' + $scope.sortField + '/' + $scope.sortOrder + '/' +$scope.nextPage)
                .then(function(response) {
					$scope.todos  =  response.data;
					if ($scope.todos.length >9) {
						$scope.showNext=true;
						} else {
							$scope.showNext=false;
						}
					if (Number($scope.nextPage) > 1) {
				    	$scope.showPrev=true;
							}else {
							$scope.showPrev=false;
							}
                }, function(error) {
                    console.error('Error loading todos:', error);
                    alert('Failed to load todos. Check console for details.');
                });
        };
        
        // Create a new todo
        $scope.createTodo = function() {
            if (!$scope.newTodo.title) {
                alert('Title is required!');
                return;
            }
            
            $http.post('api/todos', $scope.newTodo)
                .then(function(response) {
                    $scope.todos.push(response.data);
                    $scope.resetForm();
                }, function(error) {
                    console.error('Error creating todo:', error);
                    alert('Failed to create todo. Check console for details.');
                });
        };
        
        // Update an existing todo
        $scope.updateTodo = function() {
            if (!$scope.newTodo.title) {
                alert('Title is required!');
                return;
            }
            
            var todoId = $scope.newTodo.id;
            $http.put('api/todos/' + todoId, $scope.newTodo)
                .then(function(response) {
                    $scope.todos[$scope.editIndex] = response.data;
                    $scope.resetForm();
                }, function(error) {
                    console.error('Error updating todo:', error);
                    alert('Failed to update todo. Check console for details.');
                });
        };
        
        // Delete a todo
        $scope.deleteTodo = function(id, index) {
            if (confirm('Are you sure you want to delete this todo?')) {
                $http.delete('api/todos/' + id)
                    .then(function() {
                        $scope.todos.splice(index, 1);
                    }, function(error) {
                        console.error('Error deleting todo:', error);
                        alert('Failed to delete todo. Check console for details.');
                    });
            }
        };
        
        // Toggle todo status
        $scope.toggleStatus = function(todo) {
            var originalStatus = todo.completed;
            todo.completed = !todo.completed;
            
            $http.put('api/todos/' + todo.id + '/toggle', {})
                .then(function(response) {
                    angular.extend(todo, response.data);
                }, function(error) {
                    console.error('Error toggling todo status:', error);
                    alert('Failed to update todo status. Check console for details.');
                    todo.completed = originalStatus;
                });
        };
        
        // Edit a todo
        $scope.editTodo = function(todo, index) {
            $scope.newTodo = angular.copy(todo);
            $scope.editMode = true;
            $scope.editIndex = index;
        };
        
        // Cancel editing
        $scope.cancelEdit = function() {
            $scope.resetForm();
        };
        
        // Reset the form
        $scope.resetForm = function() {
            $scope.newTodo = {
                title: '',
                description: '',
                completed: false
            };
            $scope.editMode = false;
            $scope.editIndex = -1;
        };
        
        // Save a todo (create or update)
        $scope.saveTodo = function() {
            if ($scope.editMode) {
                $scope.updateTodo();
            } else {
                $scope.createTodo();
            }
        };
        
        // Initialize
		$scope.sortOrder = 'asc';
		$scope.sortField = 'ID';
		$scope.nextPage = '1';
        $scope.loadTodos();	
    }]);
})();