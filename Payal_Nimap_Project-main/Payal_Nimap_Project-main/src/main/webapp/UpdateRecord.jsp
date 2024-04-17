<%@page import="CRUD.ProductMaster"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">.btn:hover {
	background-color : "red";
    color: cyan;
}</style>
</head>
<body>
	<div align="center"
		style="border: 10px solid black; padding: 100px; margin: 5% 25% 50px 25%;">
		<h1>Enter Updated Record</h1>
		<%
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Nimap");
		EntityManager em = emf.createEntityManager();
		ProductMaster Pm = em.find(ProductMaster.class, id1);
		%>
		<form action="UpdateRecord" method="post">
			<table>
				<tr>
					<td>ProductId : </td>
					<td><input type="text" value="<%=Pm.getProductId()%>"
						name="pid"></td>
				</tr>
				<tr>
					<td>ProductName :</td>
					<td><input type="text" value="<%=Pm.getProductName()%>"
						name="pname"></td>
				</tr>
				<tr>
					<td>CategoryId :</td>
					<td><input type="text" value="<%=Pm.getCm().getCategoryId()%>"
						name="cid"></td>
				</tr>
				<tr>
					<td>Categoryname :</td>
					<td><input type="text"
						value="<%=Pm.getCm().getCategoryname()%>" name="cname"></td>
				</tr>

				<tr align="center">
					<td><input type="submit" value=Submit class="btn"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>