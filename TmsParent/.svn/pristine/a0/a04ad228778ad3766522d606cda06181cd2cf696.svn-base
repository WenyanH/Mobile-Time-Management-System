package com.tms.dao.task;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.Task;

public interface TaskDao extends IDao<Task, String>{
	public abstract List<Task> findAllTasks(String companyId);
	public abstract Boolean validateCodeNamePunchCodeExist(String code,  String name, String punchCode, String companyId);
}
