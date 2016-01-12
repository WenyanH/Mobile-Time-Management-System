package com.tms.calculator.actors;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.util.CollectionUtils;

import akka.actor.UntypedActor;

import com.tms.calculator.actors.msg.CalMsg;
import com.tms.calculator.context.CompanyContext;
import com.tms.calculator.context.Context;
import com.tms.calculator.service.ServiceLocator;
import com.tms.calculator.utils.DateIterator;
import com.tms.calculator.vo.DayPunchPare;
import com.tms.entity.Employee;
import com.tms.entity.punch.PunchRecord;
import com.tms.service.employee.EmployeeService;
import com.tms.service.punch.PunchService;
import com.tms.service.schedule.ScheduleService;
import com.tms.service.schedule.vo.TimeRange;

public class Caculator extends UntypedActor {

	@Override
	public void onReceive(Object msg) throws Exception {

		if (msg instanceof CalMsg) {

			CalMsg cm = (CalMsg) msg;

			EmployeeService employeeService = ServiceLocator.getInstance().loadService(EmployeeService.class);
			Employee employee = employeeService.findById(cm.getUid());
			if (employee.getIsExport()) {
				return;
			}

			if (employee.getCompany() == null) {
				return;
			}

			CompanyContext companyContext = Context.getInstance().getComanyContext(employee.getCompany().getId());
			if (companyContext == null) {
				return;
			}

			ScheduleService scheduleService = ServiceLocator.getInstance().loadService(ScheduleService.class);

			DateIterator ite = new DateIterator(cm.getFrom(), cm.getTo());
			while (ite.hasNext()) {

				Date day = ite.next();
				
				PunchService ps = ServiceLocator.getInstance().loadService(PunchService.class);
				List<PunchRecord> records = ps.findUserRecordByDate(cm.getUid(), cm.getFrom(), cm.getTo());
				
				TimeRange[] ranges = scheduleService.getTimeRanges(employee.getId(), day);

				if (ranges == null || ranges.length == 0) {
					//按照打卡周期计算
				}else{
					
				}

				// 按照日期进行打卡记录配对
				Collection<DayPunchPare> pares = createPares(records, cm.getFrom(), cm.getTo());
				// Rounding
				roundingPares(pares);

				// Holiday

				// Leave

			}

		} else {
			unhandled(msg);
		}

	}

	private void roundingPares(Collection<DayPunchPare> pares) {

	}

	private Collection<DayPunchPare> createPares(Collection<PunchRecord> records, Date begin, Date end) {

		List<DayPunchPare> pares = new ArrayList<>();

		DateIterator iterator = new DateIterator(begin, end);
		while (iterator.hasNext()) {
			Date day = iterator.next();
			pares.add(new DayPunchPare(day));
		}

		if (CollectionUtils.isEmpty(records)) {

		}

		// DayPunchPare dpp = null;
		//
		//
		//
		// for (PunchRecord record : records) {
		//
		// Date punchDay = record.getPunchDay();
		//
		// if (dpp == null) {
		// dpp = new DayPunchPare(punchDay);
		// pares.add(dpp);
		// dpp.add(punchDay, record.getPunchTime());
		// }
		//
		// if (!dpp.isSameDay(punchDay)) {
		// dpp.add(punchDay, record.getPunchTime());
		// dpp.close();
		// dpp = new DayPunchPare(punchDay);
		// pares.add(dpp);
		// } else {
		// dpp.add(punchDay, record.getPunchTime());
		// }
		//
		// }
		// }

		return pares;
	}

}