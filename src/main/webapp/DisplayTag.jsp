<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page import="java.util.ArrayList,com.bean.Project"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>display tag</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
// ArrayList<Project> projectList = new ArrayList<Project>();
//   for (int i = 0; i < 500; i++) {
//     Project project = new Project();
//     project.setCity("Place " + i);
//     project.setProject("Project " + i);
//     project.setAmount(i + "");
//     project.setTask("Task " + i);
//     projectList.add(project);
//   }
//   request.setAttribute("table", projectList);
%>
<body>
	<display:table na"src/main/webapp/DisplayTag.jsp"me="table" sort="list" pagesize="20" id="table1"
		export="true">
<%-- 		<display:column property="city" title="CITY" group="1" sortable="true" --%>
<%-- 			headerClass="sortable" /> --%>
		<display:column>
			<img alt="" src="BookImages/yuvi.jpg" height="100px" width="100px">
		</display:column>
<%-- 		<display:column property="project" title="PROJECT" group="2" --%>
<%-- 			sortable="true" headerClass="sortable" /> --%>
<%-- 		<display:column property="amount" title="HOURS" /> --%>
<%-- 		<display:column property="task" title="TASK" /> --%>
<%-- 		<display:setProperty name="export.excel.filename" --%>
<%-- 			value="ActorDetails.xls" /> --%>
<%-- 		<display:setProperty name="export.pdf.filename" --%>
<%-- 			value="ActorDetails.pdf" /> --%>
<%-- 		<display:setProperty name="export.csv.filename" --%>
<%-- 			value="ActorDetails.csv" /> --%>
<%-- 		<display:setProperty name="export.pdf" value="true" /> --%>
	</display:table>
</body>
</html>