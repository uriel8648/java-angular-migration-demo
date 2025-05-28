This is a monolithic Java Web application (WAR) that demonstrates a Todo application with the following technologies:

- Java 8
- Spring MVC
- JSPs for the server-side rendered pages
- AngularJS embedded in JSPs for the client-side functionality
- JSTL (Java Standard Tag Library) for JSP templating
- Bootstrap 3 for styling

## Architecture

The application follows a classic monolithic architecture with:

- Server-side rendering using JSPs and JSTL for a traditional web application experience
- Client-side rendering using AngularJS embedded in JSPs for a more dynamic user experience
- RESTful API for the AngularJS front-end to interact with
- In-memory data storage (no database is used for simplicity)

## Project Structure

```
src/main/java/com/example/todo/
├── controller/         # Spring MVC controllers
│   ├── HomeController.java
│   ├── TodoController.java
│   └── TodoRestController.java
├── model/              # Domain model classes
│   └── Todo.java
├── repository/         # Data access layer
│   ├── TodoRepository.java
│   └── InMemoryTodoRepository.java
└── service/            # Business logic layer
    ├── TodoService.java
    └── TodoServiceImpl.java

src/main/webapp/
├── WEB-INF/
│   ├── spring-mvc.xml  # Spring MVC configuration
│   ├── web.xml         # Web application configuration
│   └── views/          # JSP views
│       ├── common/     # Common JSP fragments
│       │   ├── header.jsp
│       │   └── footer.jsp
│       └── todo/       # Todo-specific views
│           ├── list.jsp
│           ├── form.jsp
│           ├── view.jsp
│           └── angular-app.jsp
└── resources/          # Static resources
    └── js/
        └── todo-app.js  # AngularJS application
```

## Running the Application

1. Make sure you have Java 8 and Maven installed
2. Clone the repository
3. Run the application using Maven:

```bash
mvn tomcat7:run
```

4. Access the application at http://localhost:8080/todo

## Features

- View all todos
- Create a new todo
- Edit an existing todo
- Delete a todo
- Mark a todo as completed/pending
- Two user interfaces:
  - Traditional JSP/JSTL view
  - AngularJS view (embedded in JSP)

## Notes

- This application uses an in-memory repository for simplicity. In a real-world scenario, you would use a proper database.
- AngularJS is embedded directly in the JSP page rather than being managed through npm or other package managers.
- Both server-side rendering (JSP) and client-side rendering (AngularJS) approaches are demonstrated.
=======
# Todo Application - Java + JSP + AngularJS + Angular 12

This is a monolithic Java Web application (WAR) that demonstrates a Todo application with the following technologies:

- Java 8
- Spring MVC
- JSPs for the server-side rendered pages
- AngularJS embedded in JSPs for the client-side functionality
- Angular 12 frontend application for a modern client-side experience
- JSTL (Java Standard Tag Library) for JSP templating
- Bootstrap 3 for styling

## Architecture

The application follows a classic monolithic architecture with:

- Server-side rendering using JSPs and JSTL for a traditional web application experience
- Client-side rendering using AngularJS embedded in JSPs for a more dynamic user experience
- A separate Angular 12 frontend application for a modern SPA experience
- RESTful API for the AngularJS and Angular 12 front-ends to interact with
- In-memory data storage (no database is used for simplicity)

## Project Structure

```
src/main/java/com/example/todo/
├── controller/         # Spring MVC controllers
│   ├── HomeController.java
│   ├── TodoController.java
│   └── TodoRestController.java
├── model/              # Domain model classes
│   └── Todo.java
├── repository/         # Data access layer
│   ├── TodoRepository.java
│   └── InMemoryTodoRepository.java
└── service/            # Business logic layer
    ├── TodoService.java
    └── TodoServiceImpl.java

src/main/webapp/
├── WEB-INF/
│   ├── spring-mvc.xml  # Spring MVC configuration
│   ├── web.xml         # Web application configuration
│   └── views/          # JSP views
│       ├── common/     # Common JSP fragments
│       │   ├── header.jsp
│       │   └── footer.jsp
│       └── todo/       # Todo-specific views
│           ├── list.jsp
│           ├── form.jsp
│           ├── view.jsp
│           └── angular-app.jsp
└── resources/          # Static resources
    ├── js/
    │   └── todo-app.js  # AngularJS application
    └── angular12-todo/  # Angular 12 frontend application
        ├── angular.json
        ├── package.json
        ├── proxy.conf.json
        ├── src/
        │   ├── index.html
        │   ├── main.ts
        │   ├── polyfills.ts
        │   ├── styles.css
        │   ├── app/
        │   │   ├── app-routing.module.ts
        │   │   ├── app.component.html
        │   │   ├── app.component.scss
        │   │   ├── app.component.ts
        │   │   ├── app.module.ts
        │   │   ├── components/
        │   │   ├── models/
        │   │   ├── services/
        │   │   └── todo/
        │   └── environments/
        ├── tsconfig.app.json
        └── tsconfig.json
```

## Running the Application

1. Make sure you have Java 8, Maven, and Node.js installed
2. Clone the repository
3. Run the backend application using Maven:

```bash
mvn tomcat7:run
```

4. To run the Angular 12 frontend app separately (optional):

```bash
cd src/main/webapp/resources/angular12-todo
npm install
ng serve
```

5. Access the backend application at http://localhost:8080/todo
6. Access the Angular 12 frontend app at http://localhost:4200 (if running separately)

## Features

- View all todos
- Create a new todo
- Edit an existing todo
- Delete a todo
- Mark a todo as completed/pending
- Two user interfaces:
  - Traditional JSP/JSTL view
  - AngularJS view (embedded in JSP)
  - Angular 12 SPA frontend application

## Notes

- This application uses an in-memory repository for simplicity. In a real-world scenario, you would use a proper database.
- AngularJS is embedded directly in the JSP page rather than being managed through npm or other package managers.
- Both server-side rendering (JSP) and client-side rendering (AngularJS and Angular 12) approaches are demonstrated.
