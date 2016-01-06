package com.tms.dao.job;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.Job;

public interface JobDao extends IDao<Job, String>{
	public abstract List<Job> findAllJobs(String companyId);
	public abstract Boolean validateCodeNamePunchCodeExist(String code,  String name, String punchCode, String companyId);
}
