import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Observable, throwError, BehaviorSubject } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Todo } from '../models/todo.model';

@Injectable({
  providedIn: 'root'
})
export class TodoService {
 private apiUrl = '/api/todos'; 

  private todoSource = new BehaviorSubject<Todo | null>(null);
  todo$ = this.todoSource.asObservable();

  constructor(private http: HttpClient) {}

  setTodo(todo: Todo | null) {
    this.todoSource.next(todo);
  }

  clearTodo() {
    this.todoSource.next(null);
  }

  getTodos(sortField: string = 'ID', sortOrder: string = 'asc', page: number = 1): Observable<Todo[]> {
    return this.http.get<Todo[]>(`${this.apiUrl}/sort/${sortField}/${sortOrder}/${page}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  getById(id: number): Observable<Todo> {
    return this.http.get<Todo>(`${this.apiUrl}/${id}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  createTodo(todo: Partial<Todo>): Observable<Todo> {
    return this.http.post<Todo>(this.apiUrl, todo)
      .pipe(
        catchError(this.handleError)
      );
  }

  updateTodo(todo: Todo): Observable<Todo> {
    return this.http.put<Todo>(`${this.apiUrl}/${todo.id}`, todo)
      .pipe(
        catchError(this.handleError)
      );
  }

  deleteTodo(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`)
      .pipe(
        catchError(this.handleError)
      );
  }

  toggleTodoStatus(id: number): Observable<Todo> {
    return this.http.put<Todo>(`${this.apiUrl}/${id}/toggle`, {})
      .pipe(
        catchError(this.handleError)
      );
  }

  completeTodos(ids: number[]): Observable<void> {
    return this.http.post<void>(`${this.apiUrl}/bulk/complete`, ids)
      .pipe(
        catchError(this.handleError)
      );
  }

  deleteTodos(ids: number[]): Observable<void> {
    return this.http.post<void>(`${this.apiUrl}/bulk/delete`, ids)
      .pipe(
        catchError(this.handleError)
      );
  }

  private handleError(error: HttpErrorResponse): Observable<never> {
    let errorMessage = 'An unknown error occurred';

    if (error.status === 200 && error.ok === false) {
      console.warn('API Warning: Received HttpErrorResponse with status 200 but ok false. Treating as success.');
      return new Observable<never>((observer) => {
        observer.complete();
      });
    }

    if (error.error instanceof ErrorEvent) {
      errorMessage = `Error: ${error.error.message}`;
    } else {
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
      console.error('API Error:', error);
    }

    return throwError(() => new Error(errorMessage));
  }
}
