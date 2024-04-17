package CRUD;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AddProduct")
public class ProductMasterDriver extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Pid = req.getParameter("pid");
		String PName = req.getParameter("pname");
		String Cid = req.getParameter("cid");
		String CName = req.getParameter("cname");
		
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Nimap");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		ProductMaster PM = new ProductMaster();
		PM.setProductId(Integer.parseInt(Pid));
		PM.setProductName(PName);
		et.begin();

		CategoryMaster CM = new CategoryMaster();
		CM.setCategoryId(Integer.parseInt(Cid));
		CM.setCategoryname(CName);
		em.persist(CM);
		PM.setCm(CM);
		em.persist(PM);
		et.commit();

		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		pw.write("Record Added Successfully");
		RequestDispatcher rd = req.getRequestDispatcher("index.html");
		rd.include(req, resp);
	}
}
