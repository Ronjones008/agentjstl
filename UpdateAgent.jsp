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
<form method="get" action="UpdateAgent.jsp">
<center>
        Enter AgentID :
        <input type="number" name="agentId" /><br/><br/>
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
    AgentDAO dao = new AgentDAO();
    Agent agentNew = dao.searchAgent("agentId");
    if(request.getParameter("premium") != null){
    	agentNew.setName(request.getParameter("name"));
    	agentNew.setCity(request.getParameter("city"));
    	agentNew.setGender(Gender.valueOf(request.getParameter("gender")));
    	agentNew.setMaritalStatus(Integer.parseInt(request.getParameter("maritalStatus")));
    	agentNew.setPremium(Double.valueOf(request.getParameter("premium")));
   	    dao.updateAgent(agentNew);
    }
  %>
</body>
</html>