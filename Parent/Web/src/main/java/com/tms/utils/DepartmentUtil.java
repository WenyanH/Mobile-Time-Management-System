package com.tms.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;

import com.tms.entity.Department;

public class DepartmentUtil {
		
	DepartmentUtil(){
		
	}
	public static DepartmentUtil instance = null;

	// 单例模式
	public static DepartmentUtil getInstance() {
		if (instance == null) {
			instance = new DepartmentUtil();
		}
		return instance;
	}
	
	
	/** 取指定部门所有子部门列表
	 * @param department 部门对象
	 * @return List<Department>
	 */
	public List<Department> getChilDepartments(Department department){
		if(department==null) return null;
		Set<Department> subs=department.getSubs();
		if(subs==null){return null;}
		List<Department> result=new ArrayList<Department>();
		for(Department sub:subs){
			if(sub.getSubs()!=null){
				result.addAll(getChilDepartments(sub));
			}
			result.add(sub);
		}
		return result;
	}
	
	/** 根据部门id取所有本身及子部门ids,以","号隔开
	 * @param department 
	 * @return
	 * @throws Exception
	 */
	public String getAllChilDepartmentList(Department department) throws Exception {
		String departstr = "";			
			List<Department> listDepartment = getChilDepartments(department);
			if (CollectionUtils.isNotEmpty(listDepartment)) {
				for (Department sub_department : listDepartment) {
					if (sub_department != null) {
						departstr += sub_department.getId() + ",";
					}
				}
			}
			departstr += department.getId();

		return departstr;
	}
}
