package com.blog.servive;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.blog.Dao.UserInfoDao;

public class UserInfoService {
	//创建对应dao类的对象，方便调用其中的方法
	private UserInfoDao userInfoDao=new UserInfoDao();
	//获取密码
	public Map<String, Object> checkLogin(String no,String password) {
		Map<String, Object> item=null;
		List<Map<String, Object>> list=userInfoDao.login(no,password);
		if(list!=null && list.size()>0) {
			item=list.get(0);
		}
		return item;
	}
	
	public Map<String, Object> checkLogin(String name) {
		Map<String, Object> item=null;
		List<Map<String, Object>> list=userInfoDao.login(name);
		if(list!=null && list.size()>0) {
			item=list.get(0);
		}
		return item;
	}
	
	public boolean doId(String id) {
		boolean flag=false;
		int row=userInfoDao.Id(id);
		if(row>0) {
			flag=true;
		}
		return flag;
	}
	
	public boolean doName(String name) {
		boolean flag=false;
		int row=userInfoDao.Id(name);
		if(row>0) {
			flag=true;
		}
		return flag;
	}
	
	public boolean doemail(String email) {
		boolean flag=false;
		int row=userInfoDao.Id(email);
		if(row>0) {
			flag=true;
		}
		return flag;
	}
	
	public boolean doSave(String no,String name,String email,String password) {
		boolean flag=false;
		int row=userInfoDao.save(no,name,email,password);
		if(row>0) {
			flag=true;
		}
		return flag;
	}

}
