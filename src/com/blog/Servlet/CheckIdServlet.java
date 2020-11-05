package com.blog.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.servive.UserInfoService;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/CheckIdServlet")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("u_id");
		String name=request.getParameter("u_name");
		String str1 = new String(name.getBytes("ISO-8859-1"),"GBK");
		String email=request.getParameter("u_email");
		UserInfoService us=new UserInfoService();
		boolean identity=us.doId(id);
		boolean username=us.doName(str1);
		boolean Email=us.doemail(email);
		response.getWriter().println(identity);
		response.getWriter().println(username);
		response.getWriter().println(Email);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
