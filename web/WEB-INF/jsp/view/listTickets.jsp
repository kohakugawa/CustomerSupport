<%--
  Created by IntelliJ IDEA.
  User: yzhai
  Date: 5/16/2014
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%-- @elvariable id = "ticketDatabase" type = "java.util.Map<Integer, com.wrox.Ticket>"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%--
    @SuppressWarnings("unchecked")
    Map<Integer, Ticket> ticketDatabase =
            (Map<Integer, Ticket>)request.getAttribute("ticketDatabase");
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <a href="<c:url value="/login?logout" />">Logout</a><br /><br />
        <h2>Tickets</h2>
        <a href="<c:url value="/tickets">
                <c:param name="action" value="create" />
            </c:url>">Create Ticket</a><br /><br />
        <c:choose>
            <c:when test="${fn:length(ticketDatabase) == 0}">
                <i>There are no tickets in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ticketDatabase}" var="entry">
                    Ticket #${entry.key}: <a href="<c:url value="/tickets">
                                <c:param name="action" value="view" />
                                <c:param name="ticketId" value="${entry.key}" />
                                </c:url>"><c:out value="${entry.value.subject}" /></a>
                                (customer:<c:out value="${entry.value.customerName}"/> )<br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
