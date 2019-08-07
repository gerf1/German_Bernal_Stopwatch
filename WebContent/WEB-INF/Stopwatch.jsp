    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.Date" %>
    <%@ page import = "java.time.format.DateTimeFormatter" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
    <%@ page import = "java.util.Calendar" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "java.util.concurrent.TimeUnit" %>
    <%@ page import = "com.codingdojo.web.models.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<h1>Stopwatch</h1>
		<% Calendar cal = Calendar.getInstance(); %>
		<% Calendar cal2 = Calendar.getInstance(); %>
		<% ArrayList<Timer> times = (ArrayList<Timer>) request.getSession().getAttribute("times"); %>
		<% cal2.setTime((Date)request.getSession().getAttribute("currentTime")); %>
		<% if(request.getSession().getAttribute("startTime") != null){ %>
		<% cal.setTime((Date) request.getSession().getAttribute("startTime")); %>
		<p>Start: <%=cal.get(Calendar.HOUR_OF_DAY) %>:<%=cal.get(Calendar.MINUTE) %>:<%=cal.get(Calendar.SECOND) %></p>
		<p>Current: <%=cal2.get(Calendar.HOUR_OF_DAY) %>:<%=cal2.get(Calendar.MINUTE) %>:<%=cal2.get(Calendar.SECOND) %></p>
		<p>Total Time: <%=TimeUnit.MILLISECONDS.toSeconds(Timer.getDifference((Date)request.getSession().getAttribute("currentTime"), (Date) request.getSession().getAttribute("startTime"))) %></p>
		<a href="/Stopwatch/Stopwatch?action=stop">Stop</a>
		<% }else{ %>
		<a href="/Stopwatch/Stopwatch?action=start">Start</a>
		<%} %>
		<a href="/Stopwatch/Stopwatch?action=reset">Reset</a>
		<table>
			<tr>
				<th>Start</th>
				<th>Stop</th>
				<th>Total</th></tr>
		
			<% for(Timer time : times){%>
				<tr>
					<td><%=new SimpleDateFormat("hh:mm:ss a").format(time.getStart()) %></td>
					<td><%=new SimpleDateFormat("hh:mm:ss a").format(time.getStop()) %></td>
					<td> <%=TimeUnit.MILLISECONDS.toSeconds(time.getDifference()) %> seconds</td>
				</tr>
			<% } %>
		</table>
		
</body>
</html>