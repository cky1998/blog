package com.blog.Servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.servive.ArticlesInfoService;
import com.blog.servive.UserInfoService;

/**
 * Servlet implementation class TechServlet
 */
@WebServlet("/TechServlet")
public class TechServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TechServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=(String) request.getSession().getAttribute("param1");
		UserInfoService us=new UserInfoService();
		Map<String, Object> item=us.checkLogin(uname);
		ArticlesInfoService as=new ArticlesInfoService();
		List<Map<String, Object>> list=as.checkTech();
		HttpSession session=request.getSession();
		session.setAttribute("info", item);
		session.setAttribute("e", list);
		response.sendRedirect("tech.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
