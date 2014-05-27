<%--
  Created by IntelliJ IDEA.
  User: yzhai
  Date: 5/24/2014
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <h2>Login</h2>
        You must log in to access the customer support site.<br /><br />
        <%
            if((boolean)request.getAttribute("loginFailed"))
            {
        %>
        <b>The username or password you entered are not correct. Please try
            again.</b><br /><br />
        <%
            }
        %>
        <form method="POST" action="<c:url value="/login" />">
            Username<br />
            <input type="text" name="username" /><br /><br />
            Password<br />
            <input type="password" name="password" /><br /><br />
            <input type="submit" value="Log In" />
        </form>
    </body>
</html>
