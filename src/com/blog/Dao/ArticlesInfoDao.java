package com.blog.Dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.neu.dao.BaseDao;

public class ArticlesInfoDao extends BaseDao{
	public List<Map<String, Object>> SelectEssay(){
		List<Map<String, Object>> list=null;
		String sql="SELECT *"
				+ " from essay" ;
		list=super.executeQuery(sql);
		return list;
	}
	public List<Map<String, Object>> SelectTech(){
		List<Map<String, Object>> list=null;
		String sql="SELECT *"
				+ " from tech" ;
		list=super.executeQuery(sql);
		return list;
	}
	
	public int InsertEssay(String id,String author,String title,String ab,String text,String d) {
		int row=0;
		//禁止在java中直接编写
		String sql="INSERT INTO "
					+"`essay`(eno,author,title,ab,text,data) "
					+"VALUES(?,?,?,?,?,?)";
		row=super.executeUpdate(sql,id,author,title,ab,text,d);
		
		return row;
	}
	
	public int InsertTech(String id,String author,String title,String ab,String text,String d) {
		int row=0;
		//禁止在java中直接编写
		String sql="INSERT INTO "
					+"`tech`(tno,author,title,ab,text,data) "
					+"VALUES(?,?,?,?,?,?)";
		row=super.executeUpdate(sql,id,author,title,ab,text,d);
		
		return row;
	}
	public List<Map<String, Object>> SelectEssay(String id) {
		List<Map<String, Object>> list=null;
		//禁止在java中直接编写
		String sql="SELECT * "
					+"FROM essay "
					+"WHERE eno=?";
		list=super.executeQuery(sql,id);
		return list;
	}
	public List<Map<String, Object>> SelectTech(String id) {
		List<Map<String, Object>> list=null;
		//禁止在java中直接编写
		String sql="SELECT *"
					+" FROM tech"
					+" WHERE tno=?";
		list=super.executeQuery(sql,id);
		return list;
	}
}
