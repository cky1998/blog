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
			JOptionPane.showMessageDialog(null, "�û�ID����Ϊ��");
			response.sendRedirect("login.jsp");
		}else if(id.length()<3||id.length()>11){
			JOptionPane.showMessageDialog(null, "�û�ID���ȱ���Ϊ3-11λ");
			response.sendRedirect("login.jsp");
		}else if(name==null){
			JOptionPane.showMessageDialog(null, "�û�������Ϊ��");
			response.sendRedirect("login.jsp");
		}else if(name.length()<2||name.length()>10){
			JOptionPane.showMessageDialog(null, "�û�ID���ȱ���Ϊ2-10λ");
			response.sendRedirect("login.jsp");
		}else if(email==null){
			JOptionPane.showMessageDialog(null, "�û����䲻��Ϊ��");
			response.sendRedirect("login.jsp");
		}else if(pwd==null||pwd2==null){
			JOptionPane.showMessageDialog(null, "���벻��Ϊ��");
			response.sendRedirect("login.jsp");
		}else if(!pwd.equals(pwd2)){
			JOptionPane.showMessageDialog(null, "�����������벻һ��");
			response.sendRedirect("login.jsp");
		}
		if(result==false) {
			session.setAttribute("msg", "ע��ʧ��!");
			response.sendRedirect("fail.jsp");
		}else {
			JOptionPane.showMessageDialog(null, "ע��ɹ�");
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
