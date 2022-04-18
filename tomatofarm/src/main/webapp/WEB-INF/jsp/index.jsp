<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="include/header.jsp"/>

<div class="mainContent">
    <sec:authorize access="isAuthenticated()">
        <a href="/user/search">
            <div class="homeLauncher">
                <h3>
                        <%--later this will be just OR also plots search?--%>
                    <span>Search (Users/plots)</span>
                </h3>
            </div>
        </a>
        <a href="/plots/allPlots">
            <div class="homeLauncher">
                <h3>
                    <span>Plots</span>
                </h3>
            </div>
        </a>
        <a href="/varieties/allVarieties">
            <div class="homeLauncher">
                <h3>
                    <span>Tomato Varieties</span>
                </h3>
            </div>
        </a>
        <sec:authorize access="hasAuthority('ADMIN')">
            <a href="/admin/userAdmin">
                <div class="homeLauncher">
                    <h3>
                        <span>User Admin</span>
                    </h3>
                </div>
            </a>
        </sec:authorize>
        <a href="/login/logout">
            <div class="homeLauncher">
                <h3>
                    <span>Logout</span>
                </h3>
            </div>
        </a>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <a href="/login/login">
            <div class="homeLauncher">
                <h3>
                    <span>Login</span>
                </h3>
            </div>
        </a>
        <a href="/register/registerForm">
            <div class="homeLauncher">
                <h3>
                    <span>Register</span>
                </h3>
            </div>
        </a>
    </sec:authorize>

    <img src="https://res.cloudinary.com/dgwzirogr/image/upload/v1649013339/frontendSBA/orangegrape_wegqti.jpg"
         id="orangeGrape" alt="tray of orange grape tomatoes">
</div>


<jsp:include page="include/footer.jsp"/>