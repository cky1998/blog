package com.blog.servive;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.blog.Dao.ArticlesInfoDao;

public class ArticlesInfoService {
	private ArticlesInfoDao articlesInfoDao=new ArticlesInfoDao();
	public List<Map<String, Object>> checkEssay() {
		return articlesInfoDao.SelectEssay();
	}
	public List<Map<String, Object>> checkTech() {
		return articlesInfoDao.SelectTech();
	}
	
	public boolean doInsertEssay(String id,String author,String title,String ab,String text,String d) {
		boolean flag=false;
		int row=articlesInfoDao.InsertEssay(id,author,title,ab,text,d);
		if(row>0) {
			flag=true;
		}
		return flag;
	}
	
	public boolean doInsertTech(String id,String author,String title,String ab,String text,String d) {
		boolean flag=false;
		int row=articlesInfoDao.InsertTech(id,author,title,ab,text,d);
		if(row>0) {
			flag=true;
		}
		return flag;
	}
	
	public Map<String, Object> doSelectEssay(String id) {
		Map<String, Object> item=null;
		List<Map<String, Object>> list=articlesInfoDao.SelectEssay(id);
		if(list!=null && list.size()>0) {
			item=list.get(0);
		}
		return item;
	}
	
	public Map<String, Object> doSelectTech(String id) {
		Map<String, Object> item=null;
		List<Map<String, Object>> list=articlesInfoDao.SelectTech(id);
		if(list!=null && list.size()>0) {
			item=list.get(0);
		}
		return item;
	}
}
