<%@page import="com.infinite.hidagentjsp.Gender"%>
<%@page import="com.infinite.hidagentjsp.Agent"%>
<%@page import="com.infinite.hidagentjsp.AgentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="get" action="Insert.jsp">
	<center>
		Enter Name :
		<input type="text" name="name" /><br/><br/>
		Enter City:
		<input type="text" name="city" /><br/><br/>
		Enter Gender :
		<input type="text" name="gender" /><br/><br/>
		Enter MaritalStatus :
		<input type="number" name="maritalStatus" /><br/><br/>
	    Enter premium :
	    <input type="number" name="premium" /><br/><br/>
	    <input type="submit" value ="Insert" />
	</center>
</form>
<%
 if(request.getParameter("premium") != null){
	 AgentDAO dao = new AgentDAO();
	 Agent agent = new Agent();
	 agent.setName(request.getParameter("name"));
	 agent.setCity(request.getParameter("city"));
	 agent.setGender(Gender.valueOf(request.getParameter("gender")));
	 agent.setMaritalStatus(Integer.parseInt(request.getParameter("maritalStatus")));
	 agent.setPremium(Double.valueOf(request.getParameter("premium")));
	 dao.insertAgent(agent);
 }
%>

</body>
</html>