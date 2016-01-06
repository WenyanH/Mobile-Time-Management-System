package com.tms.service.tms;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.companystructure.CStructureDao;
import com.tms.dao.core.Hints;
import com.tms.dao.employeeholiday.EHolidayDao;
import com.tms.dao.holiday.HolidayDao;
import com.tms.dao.job.JobDao;
import com.tms.dao.paygroup.PayGroupDao;
import com.tms.dao.paytype.PayTypeDao;
import com.tms.dao.position.PositionDao;
import com.tms.dao.schedule.ScheduleDao;
import com.tms.dao.task.TaskDao;
import com.tms.dao.timerounding.TimeRoundingDao;
import com.tms.entity.CompanyStructure;
import com.tms.entity.tms.EmployeeHoliday;
import com.tms.entity.tms.Holiday;
import com.tms.entity.tms.Job;
import com.tms.entity.tms.PayGroup;
import com.tms.entity.tms.PayType;
import com.tms.entity.tms.Position;
import com.tms.entity.tms.Schedule;
import com.tms.entity.tms.Task;
import com.tms.entity.tms.TimeRounding;
import com.tms.pages.IPageList;

@Service
@Transactional(readOnly = true)
public class TMSService {

	@Autowired
	private PayGroupDao payGroupDao;

	@Autowired
	private PayTypeDao payTypeDao;

	@Autowired
	private TimeRoundingDao timeRoundingDao;

	@Autowired
	private PositionDao positionDao;

	@Autowired
	private JobDao jobDao;

	@Autowired
	private TaskDao taskDao;
	
	@Autowired
	private HolidayDao holidayDao;

	@Autowired
	private EHolidayDao eholidayDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private  CStructureDao cstructureDao;

	@Transactional
	private EmployeeHoliday saveEmployeeHoliday(EmployeeHoliday holiday) {
		EmployeeHoliday tmp = eholidayDao.findHolidayByDate(holiday.getDate(), holiday.getCompany().getId());
		if (tmp == null) {
			tmp = eholidayDao.save(holiday);
		} else {
			tmp.getUsers().addAll(holiday.getUsers());
		}
		return tmp;
	}

	@Transactional
	private void removeEmployeeHoliday(Date holiday, String company) {
		eholidayDao.removeHolidayByDate(holiday, company);
	}
	
	@Transactional
	private void removeEmployeeHoliday(EmployeeHoliday holiday) {
		eholidayDao.update(holiday);
	}

	@Transactional
	public TimeRounding saveTimeRounding(TimeRounding timeRounding) {
		return timeRoundingDao.save(timeRounding);
	}

	@Transactional
	public void updateTimeRounding(TimeRounding timeRounding) {
		timeRoundingDao.update(timeRounding);
	}

	@Transactional
	public void removeTimeRounding(final String timeRoundingId) {
		timeRoundingDao.remove(timeRoundingId);
	}

	public IPageList<TimeRounding> findAllTimeRoundings(Hints hints, String company) {
		return timeRoundingDao.findTimeRoundings(company, hints);
	}

	public TimeRounding findTimeRoundingbyId(String id) {
		return timeRoundingDao.find(id);
	}

	public List<TimeRounding> findAllTimeRoundingsByCompanyId(String companyId) {
		return timeRoundingDao.findAllTimeRoundings(companyId);
	}

	public Boolean validateTimeRoundingCodeNameExist(String code, String name, String companyId) {
		return timeRoundingDao.validateCodeNameExist(code, name, companyId);
	}

	@Transactional
	public PayType savePayType(PayType payType) {
		return payTypeDao.save(payType);
	}

	@Transactional
	public void removePayType(String payTypeId) {
		payTypeDao.remove(payTypeId);
	}

	@Transactional
	public void updatePayType(PayType payType) {
		payTypeDao.update(payType);
	}

	public List<PayType> findPayTypes(String companyId) {
		return payTypeDao.findPayTypes(companyId);
	}

	public PayType findPayTypeById(String id) {
		return payTypeDao.find(id);
	}

	public Position findPositionById(String id) {
		return positionDao.find(id);
	}

	public Boolean validatePayTypeCodeNameExist(String code, String name, String companyId) {
		return payTypeDao.validateCodeNameExist(code, name, companyId);
	}

	@Transactional
	public PayGroup savePayGroup(PayGroup payGroup) {
		return payGroupDao.save(payGroup);
	}

	@Transactional
	public void removePayGroup(String payGroupId) {
		payGroupDao.remove(payGroupId);
	}

	@Transactional
	public void updatePayGroup(PayGroup payGroup) {
		payGroupDao.update(payGroup);
	}

	public IPageList<PayGroup> findAllPageGroups(Hints hints, String company) {
		return payGroupDao.findPayGroups(hints, company);
	}

	public List<PayGroup> findAllPageGroups(String companyId) {
		return payGroupDao.findPayGroups(companyId);
	}

	public PayGroup findPayGroupById(String id) {
		return payGroupDao.find(id);
	}

	public Boolean validatePayGroupCodeNameExist(String code,String name,  String companyId) {
		return payGroupDao.validateCodeNameExist(code, name, companyId);
	}

	@Transactional
	public Position savePosition(Position position) {
		return positionDao.save(position);
	}

	@Transactional
	public void updatePosition(Position position) {
		positionDao.update(position);
	}

	@Transactional
	public void removePosition(String id) {
		positionDao.remove(id);
	}

	public IPageList<Position> findPositionPage(String searchStr, String companyId, String order, String sort, Hints hints) {
		return positionDao.findPositionPage(searchStr, companyId, order, sort, hints);
	}

	public List<Position> findAllPosition(String companyId) {
		return positionDao.findAllPosition(companyId);
	}

	public Position findById(String id) {
		return positionDao.find(id);
	}

	public Boolean validatePositionCodeNamePunchCodeExist(String code, String name, String punchCode, String companyId) {
		return positionDao.validateCodeNamePunchCodeExist(code, name, punchCode, companyId);
	}

	public List<Job> findAllJobs(String companyId) {
		return jobDao.findAllJobs(companyId);
	}

	public Job findJobByid(String id) {
		return jobDao.find(id);
	}

	@Transactional
	public Job saveJob(Job job) {
		return jobDao.save(job);
	}

	@Transactional
	public void updateJob(Job job) {
		jobDao.update(job);
	}

	@Transactional
	public void removeJob(String id) {
		jobDao.remove(id);
	}

	public Boolean validateJobCodeNamePunchCodeExist(String code, String name, String punchCode, String companyId) {
		return jobDao.validateCodeNamePunchCodeExist(code, name, punchCode, companyId);
	}

/*	public Boolean validateJobNameExist(String name, String companyId) {
		return jobDao.validateNameExist(name, companyId);
	}

	public Boolean validateJobPunchCodeExist(String punchCode, String companyId) {
		return jobDao.validatePunchCodeExist(punchCode, companyId);
	}*/
	
	
	public List<Task> findAllTasks(String companyId) {
		return taskDao.findAllTasks(companyId);
	}

	public Task findTaskByid(String id) {
		return taskDao.find(id);
	}

	@Transactional
	public Task saveTask(Task task) {
		return taskDao.save(task);
	}

	@Transactional
	public void updateTask(Task task) {
		taskDao.update(task);
	}

	@Transactional
	public void removeTask(String id) {
		taskDao.remove(id);
	}

	public Boolean validateTaskCodeNamePunchCodeExist(String code, String name, String punchCode, String companyId) {
		return taskDao.validateCodeNamePunchCodeExist(code, name, punchCode, companyId);
	}

/*	public Boolean validateTaskNameExist(String name, String companyId) {
		return taskDao.validateNameExist(name, companyId);
	}

	public Boolean validateTaskPunchCodeExist(String punchCode, String companyId) {
		return taskDao.validatePunchCodeExist(punchCode, companyId);
	}*/

	@Transactional
	public Holiday saveHoliday(final Holiday holiday) {
		return holidayDao.save(holiday);
	}

	public Holiday findHolidayById(final String holidayId) {
		return holidayDao.find(holidayId);
	}

	public List<Holiday> findAllHoliday(String companyId) {
		return holidayDao.findAllHoliday(companyId);
	}

	@Transactional
	public void updateHoliday(Holiday holiday) {
		holidayDao.update(holiday);
	}

	@Transactional
	public void removeHoliday(final String holidayId) {
		holidayDao.remove(holidayId);
	}

	public Boolean validateHolidayCodeExist(String code, String companyId) {
		return holidayDao.validateCodeExist(code, companyId);
	}

	@Transactional
	public Schedule saveSchedule(Schedule schedule) {
		return scheduleDao.save(schedule);
	}

	@Transactional
	public void updateSchedule(Schedule schedule) {
		scheduleDao.update(schedule);
	}

	@Transactional
	public void removeSchedule(String id) {
		scheduleDao.remove(id);
	}

	public List<Schedule> findSchedules(String companyId) {
		return scheduleDao.findSchedules(companyId);
	}

	public Schedule findScheduleById(String id) {
		return scheduleDao.find(id);
	}

	public Boolean validateScheduleCodeNameExist(String code, String name, String companyId) {
		return scheduleDao.validateCodeNameExist(code, name, companyId);
	}
	
	
	public List<CompanyStructure> findActiveStructures(final String compnayId){
		return cstructureDao.findActiveStructures(compnayId);
	}
	
	public List<CompanyStructure> findAllStructures(final String compnayId){
		return cstructureDao.findAllStructures(compnayId);
	}
	
	public Boolean validateStructureNameExist(String name, String companyId) {
		return cstructureDao.validateNameExist(name, companyId);
	}
	@Transactional
	public void updateStructure(CompanyStructure structure) {
		cstructureDao.update(structure);
	}
	public CompanyStructure findStructureById(String id) {
		return cstructureDao.find(id);
	}
}
