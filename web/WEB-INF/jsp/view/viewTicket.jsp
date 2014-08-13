<%--
  Created by IntelliJ IDEA.
  User: yzhai
  Date: 5/16/2014
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- @ page session="false" --%>
<%-- @elvariable id = "ticketId", type = "java.lang.String" --%>
<%-- @elvariable id = "ticket", type = "com.wrox.Ticket" --%>
<%--
    String ticketId = (String)request.getAttribute("ticketId");
    Ticket ticket = (Ticket)request.getAttribute("ticket");
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <a href="<c:url value="/login?logout" />">Logout</a><br /><br />
        <h2>Ticket #${ticketId}: <c:out value="${ticket.subject}" /></h2>
        <i>Customer Name - <c:out value="${ticket.customerName}" /></i><br /><br />
        <%--= ticket.getBody() --%>
        <c:out value="${ticket.body}" />
        <br /><br />

        <c:if test="${ticket.numberOfAttachments > 0}">
            Attachment:
            <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="
                        <c:url value="/tickets">
                            <c:param name="action" value="download" />
                            <c:param name="ticketId" value="${ticketId}" />
                            <c:param name="attachment" value="${attachment.name}" />
                        </c:url>">
                        <c:out  value="${attachment.name}" />
                </a>
            </c:forEach><br /><br />
        </c:if>
        <a href="<c:url value="/tickets" />">Return to list tickets</a>
    </body>
</html>