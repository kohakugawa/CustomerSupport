<%--
  Created by IntelliJ IDEA.
  User: yzhai
  Date: 5/26/2014
  Time: 3:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%!
    private static String toString(long timeInterval)
    {
        if (timeInterval < 1_000)
            return "less than a second";
        if (timeInterval < 60_000)
            return (timeInterval / 1_000) + " seconds";
        return "about " + (timeInterval / 60_000) + " minutes";
    }
%>
<%
    int numberOfSessions = (Integer)request.getAttribute("numberOfSessions");
    @SuppressWarnings("unchecked")
    List<HttpSession> sessions = (List<HttpSession>)request.getAttribute("sessionList");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <a href="<c:url value="/login?logout" />">Logout</a><br /><br />
        <h2>Sessions</h2>
        There are a total of <%= numberOfSessions %> active sessions in this
        application.<br /><br />
        <%
            long timestamp = System.currentTimeMillis();
            for (HttpSession s : sessions)
            {
                out.print(s.getId() + " - " + s.getAttribute("username"));
                if(s.getId().equals(session.getId()))
                    out.print(" (you)");
                out.print(" - last active " +
                        toString(timestamp - s.getLastAccessedTime()));
                out.println(" ago<br />");
            }
        %>
    </body>
</html>
