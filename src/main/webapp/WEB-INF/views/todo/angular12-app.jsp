<%@ include file="../common/header.jsp" %>

<head>
  <base href="/todo/angular12-app/" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>

<div>
  <app-root></app-root>
  
</div>

<script src="<c:url value="/resources/angular12-todo/runtime.js"/>"></script>
<script src="<c:url value="/resources/angular12-todo/polyfills.js"/></script>
<script src="<c:url value="/resources/angular12-todo/main.js"/>"></script>

<%@ include file="../common/footer.jsp" %>

