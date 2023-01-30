<!--Import Java on jsp to show as html-->
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.Map" %>
<%
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
</head>

<body>
<!--Select Form Start-->

<!--Select Form Title -->
<div class="mx-auto" style="width: 1000px;">
<h3>Formulario para Usuarios</h3>
<!--Scriblet-->
<%
    if (errores != null && errores.size() > 0) {
%>
<ul class="alert alert-danger px-5">
    <% for (String error : errores.values()) {%>
    <li><%=error%>
    </li>
    <%}%>
</ul>
<%}%>

<!--Select Form Box-->

<form action="/webapp-form/registro" method="post">
    <!--Select Form Box Username-->
    <div class="row mb-3">
        <label for="username" class="col-form-label col-sm-2">Usuario</label>
            <div class="col-sm-4"><input type="text" name="username" id="username" class="form-control" value="${param.username}">
        </div>
        <%
            if (errores != null && errores.containsKey("username")) {
                out.println("<smalL class='alert alert-danger col-sm-4' style='color: red;'>" + errores.get("username") + "</small>");
            }
        %>
    </div>
    <!--Select Form Box Password-->
    <div class="row mb-3">
        <label for="password" class="col-form-label col-sm-2">Password</label>
        <div class="col-sm-4"><input type="password" name="password" id="password" class="form-control">
        </div>
        <%
            if (errores != null && errores.containsKey("password")) {
                out.println("<smalL class='alert alert-danger col-sm-4'  style='color: red;'>" + errores.get("password") + "</small>");
            }
        %>
    </div>
    <!--Select Form Box Email-->
    <div class="row mb-3">
        <label for="email" class="col-form-label col-sm-2">Email</label>
        <div class="col-sm-4"><input type="email" name="email" id="email" class="form-control" value="${param.email}"></div>
        <%
            if (errores != null && errores.containsKey("email")) {
                out.println("<smalL class='alert alert-danger col-sm-4'  style='color: red;'>" + errores.get("email") + "</small>");
            }
        %>
    </div>
    <!--Select Form Combo Box Option Multiple -->
    <div class="row mb-3">
        <label for="pais" class="col-form-label col-sm-2">Pais</label>
        <div class="col-sm-4"><select name="pais" id="pais" class="form-select">
            <option value="">-- Seleccionar --</option>
            <option value="ES" ${param.pais.equals("ES")? "selected": ""}>España</option>
            <option value="MX" ${param.pais.equals("MX")? "selected": ""}>México</option>
            <option value="CL" ${param.pais.equals("CL")? "selected": ""}>Chile</option>
            <option value="IT" ${param.pais.equals("IT")? "selected": ""}>Italia</option>
            <option value="GR" ${param.pais.equals("GR")? "selected": ""}>Alemania</option>
            <option value="FR" ${param.pais.equals("FR")? "selected": ""}>Francia</option>
            <option value="JP" ${param.pais.equals("JP")? "selected": ""}>Japón</option>
        </select></div>

        <%
            if (errores != null && errores.containsKey("pais")) {
                out.println("<smalL class='alert alert-danger col-sm-4'  style='color: red;'>" + errores.get("pais") + "</small>");
            }
        %>
    </div>
    <!--Select Form Combo Box Opcion Multiple -->
    <div class="row mb-3">
        <label for="lenguajes" class="col-form-label col-sm-2">Leguajes de Programación</label>
        <div class="col-sm-4"><select name="lenguajes" id="lenguajes" multiple class="form-select">
            <option value="java" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("java")).get()?"selected":""}>JAVA SE</option>
            <option value="jakarta" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("jakarta")).get()?"selected":""}>Jakarta EE9</option>
            <option value="spring" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("spring")).get()?"selected":""}>SpringBoot</option>
            <option value="js" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("js")).get()?"selected":""}>JavaScript</option>
            <option value="angular" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("angular")).get()?"selected":""}>Angular</option>
            <option value="react" ${paramValues.lenguajes.stream().anyMatch(v->v.equals("react")).get()?"selected":""}>React</option>
        </select></div>
        <%
            if (errores != null && errores.containsKey("lenguajes")) {
                out.println("<smalL class='alert alert-danger col-sm-4'  style='color: red;'>" + errores.get("lenguajes") + "</small>");
            }
        %>
    </div>
    <!--Select Form Check Box Multiple -->
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Roles</label>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_ADMIN" ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_ADMIN")).get()?"checked":""}
                   class="form-check-input">
            <label class="form-check-label">Administrador</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_USER" ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_USER")).get()?"checked":""}
                   checked class="form-check-input">
            <label class="form-check-label">Usuario</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="checkbox" name="roles" value="ROLE_MODERATOR" ${paramValues.roles.stream().anyMatch(v->v.equals("ROLE_MODERATOR")).get()?"checked":""}
                   class="form-check-input">
            <label class="form-check-label">Moderador</label>
        </div>
        <%
            if (errores != null && errores.containsKey("roles")) {
                out.println("<smalL class='alert alert-danger col-sm-4'  style='color: red;'>" + errores.get("roles") + "</small>");
            }
        %>
    </div>
    <!--Select Form Idioma radio button  -->
    <div class="row mb-3">
        <label class="col-form-label col-sm-2">Idiomas</label>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="es" class="form-check-input" ${param.idioma.equals("es")? "checked": ""}>
            <label class="form-check-label">Español</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="en" class="form-check-input" ${param.idioma.equals("en")? "checked": ""}>
            <label class="form-check-label">Ingles</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="fr" class="form-check-input" ${param.idioma.equals("fr")? "checked": ""}>
            <label class="form-check-label">Frances</label>
        </div>
        <div class="form-check col-sm-2">
            <input type="radio" name="idioma" value="it" class="form-check-input" ${param.idioma.equals("it")? "checked": ""}>
            <label class="form-check-label">Italiano</label>
        </div>
        <%
            if (errores != null && errores.containsKey("idioma")) {
                out.println("<smalL class='alert alert-danger col-sm-4'  style='color: red;'>" + errores.get("idioma") + "</small>");
           }
        %>
    </div>
    <!--Select Form Habiliatar check Box -->
    <div class="row mb-3">
        <label for="habilitar" class="col-form-label col-sm-2">Habilitar</label>
        <div class="form-check">
            <input type="checkbox" name="habilitar" id="habilitar" checked class="form-check-input">
        </div>
    </div>
    <!--Select Form Button -->
    <div class="row mb-3">
        <div><input type="submit" value="Enviar" class="btn btn-primary"></div>
    </div>
    <!--Select Form Hidden input habilitar -->
    <input type="hidden" name="secreto" value="123">

</form>
    <!--Select Form End-->
</div>
<!--div mx-auto  End-->
</body>

</html>
