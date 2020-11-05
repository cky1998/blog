package com.blog.Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.blog.servive.ArticlesInfoService;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Date d= new Date();
		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat s2=new SimpleDateFormat("yyyyMMddHHmmss");
		String id = null;
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String ab = request.getParameter("ab");
		String text = request.getParameter("text1");
		String mid=request.getParameter("mid");
		ArticlesInfoService as=new ArticlesInfoService();
		boolean result=false;
		if(mid.equals("0")){
			id=s2.format(d);
			result=as.doInsertTech(id, author, title, ab, text, s.format(d));
		}else{
			id=s2.format(d);
			result=as.doInsertEssay(id, author, title, ab, text, s.format(d));
		}
		HttpSession session=request.getSession();
		if(result==false) {
			session.setAttribute("msg", "上传失败!");
			response.sendRedirect("fail.jsp");
		}else {
			JOptionPane.showMessageDialog(null, "上传成功");
			response.sendRedirect("write.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
