package com.blog.Dao;

import java.util.List;
import java.util.Map;

import com.neu.dao.BaseDao;

public class UserInfoDao extends BaseDao{
	//��¼��֤
	public List<Map<String, Object>> login(String id,String password){
		List<Map<String, Object>> list=null;
		String sql="SELECT *"
				+ " FROM `user`" + 
				" WHERE userid=? and password=?";
		list=super.executeQuery(sql,id,password);
		return list;
	}
	
	public List<Map<String, Object>> login(String name){
		List<Map<String, Object>> list=null;
		String sql="SELECT *"
				+ " FROM `user`" + 
				" WHERE username=? ";
		list=super.executeQuery(sql,name);
		return list;
	}
	//У��
	public int Id(String id) {
		int row=0;
		//��ֹ��java��ֱ�ӱ�д
		String sql="SELECT *"
				+ " FROM `user`" + 
				" WHERE id=?";
		row=super.executeUpdate(sql, id);
		
		return row;
	}
	public int Name(String name) {
		int row=0;
		//��ֹ��java��ֱ�ӱ�д
		String sql="SELECT *"
				+ " FROM `user`" + 
				" WHERE name=?";
		row=super.executeUpdate(sql, name);
		
		return row;
	}
	
	public int Email(String email) {
		int row=0;
		//��ֹ��java��ֱ�ӱ�д
		String sql="SELECT *"
				+ " FROM `user`" + 
				" WHERE email=? ";
		row=super.executeUpdate(sql, email);
		
		return row;
	}
	
	//ע���û�
	public int save(String no,String name,String email,String password) {
		int row=0;
		//��ֹ��java��ֱ�ӱ�д
		String sql="INSERT INTO"
					+" `user`(userid,username,email,password)"
					+" VALUE(?,?,?,?)";
		row=super.executeUpdate(sql, no,name,email,password);
		
		return row;
	}

}
