<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <h2>User's plots:</h2>
    <table class="table" id="plotTable">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Soil type</th>
            <th scope="col">Cultivation style</th>
            <th scope="col">Filled</th>
            <th scope="col">Available</th>
            <th scope="col">Slots Total</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="plot" items="${userPlots}">
            <tr>
                <th scope="row">${plot.id}</th>
                <td>${plot.soilMakeup}</td>
                <td>${plot.cultivationStyle}</td>
                <td>${plot.spacesTaken}</td>
                <td>${plot.spacesTotal - plot.spacesTaken}</td>
                <td>${plot.spacesTotal}</td>
                <td><a href="/plots/editPlot/${plot.id}">
                    <button class="btn btn-primary">edit</button>
                </a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/directory"><button class="btn btn-primary">Back</button></a>
<%--TODO: create dropdown list to reassign a plot to this user.--%>
    <%--    <hr>--%>
<%--    <h3>Reassign a plot to this user</h3>--%>
<%--<c:forEach var="plot" items="${allPlots}">--%>
<%--</c:forEach>--%>

    <hr>
    <sec:authorize access="hasAuthority('ADMIN')">
        <h3>Edit user:</h3>
        <p>${user.firstName} ${user.lastName}</p>
        <form action="/admin/userSubmit" method="get">
            <input type="hidden" name="id" value="${form.id}">

            <label for="firstNameId">First name:</label>
            <input type="text" name="firstName" id="firstNameId" value="${form.firstName}">
            <c:forEach items='${bindingResult.getFieldErrors("firstName")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>

            <label for="lastNameId">Last name:</label>
            <input type="text" name="lastName" id="lastNameId" value="${form.lastName}">
            <c:forEach items='${bindingResult.getFieldErrors("lastName")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
            <p>Current permissions:
            <c:forEach var="role" items="${userRoles}">
                ${role.userRole}
            </c:forEach>
            </p>
            <h4>Edit permissions</h4>
            <label for="adminCheckbox">Admin permissions?</label>
            <form:checkbox path="form.admin" id="adminCheckbox"/>
<%--            <p>WARNING: this can only be undone on the back end by a SQL DBA.</p>--%>
            <button class="btn btn-success" type="submit">Submit</button>
        </form>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>
    </sec:authorize>
</div>

<jsp:include page="../include/footer.jsp"/>

