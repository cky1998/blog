package com.blog.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.blog.servive.UserInfoService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("u_id");
		String name = request.getParameter("u_name");
		String email = request.getParameter("u_email");
		String pwd = request.getParameter("u_pwd");
		String pwd2 = request.getParameter("u_pwd2");
		UserInfoService us=new UserInfoService();
		boolean result=us.doSave(id, name, email, pwd);
		HttpSession session=request.getSession();
		if(id==null){
			JOptionPane.showMessageDialog(null, "用户ID不能为空");
			response.sendRedirect("login.jsp");
		}else if(id.length()<3||id.length()>11){
			JOptionPane.showMessageDialog(null, "用户ID长度必须为3-11位");
			response.sendRedirect("login.jsp");
		}else if(name==null){
			JOptionPane.showMessageDialog(null, "用户名不能为空");
			response.sendRedirect("login.jsp");
		}else if(name.length()<2||name.length()>10){
			JOptionPane.showMessageDialog(null, "用户ID长度必须为2-10位");
			response.sendRedirect("login.jsp");
		}else if(email==null){
			JOptionPane.showMessageDialog(null, "用户邮箱不能为空");
			response.sendRedirect("login.jsp");
		}else if(pwd==null||pwd2==null){
			JOptionPane.showMessageDialog(null, "密码不能为空");
			response.sendRedirect("login.jsp");
		}else if(!pwd.equals(pwd2)){
			JOptionPane.showMessageDialog(null, "两次密码输入不一致");
			response.sendRedirect("login.jsp");
		}
		if(result==false) {
			session.setAttribute("msg", "注册失败!");
			response.sendRedirect("fail.jsp");
		}else {
			JOptionPane.showMessageDialog(null, "注册成功");
			response.sendRedirect("login.jsp");
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
