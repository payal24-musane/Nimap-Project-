<%@page import="CRUD.CategoryMaster"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.*"%>
<%@page import="CRUD.ProductMaster"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.btn:hover {
	background-color:"red";
  color: cyan;
}
</style>
</head>
<body>
	<div align="center" style="border: 10px solid black; padding:5%; margin: 5% 25% 50px 25%;">
		<h1>ProductMaster And CategoryMaster</h1>
		<form action="index.html">
			<table align="center" cellpadding="10px" border="10"
				style="background-color: lightblue">
				<tr align="center">
					<th>ProductId</th>
					<th>ProductNa me</th>
					<th>CategoryId</th>
					<th>Categoryname</th>
				</tr>
				<%
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("Nimap");
				EntityManager em = emf.createEntityManager();
				ProductMaster PM = new ProductMaster();

				String New = request.getParameter("id");
				int pageNo = Integer.parseInt(New);
				Query q = em.createQuery("Select b from ProductMaster b");
				List<ProductMaster> L = q.getResultList();
				int i = (pageNo - 1) * 10;
				for (int j = 0; j < L.size(); j++) {
					if (j >= i && j < i + 10) {
						ProductMaster P = L.get(j);
				%>
				<tr align="center">
					<td><%=P.getProductId()%></td>
					<td><%=P.getProductName()%></td>
					<td><%=P.getCm().getCategoryId()%></td>
					<td><%=P.getCm().getCategoryname()%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
			<br>
			<br> <input type="submit" value="HOME" class="btn">

		</form>
</body>
</html>