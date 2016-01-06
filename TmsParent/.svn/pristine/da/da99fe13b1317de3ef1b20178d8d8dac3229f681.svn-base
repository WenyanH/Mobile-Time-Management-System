package com.tms.entity.tms;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class TimeRoundingRule {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
	private String id;
	
	private int orderNumber = 0;  //序号，排序用

	private int fromTime = 0;

	private int toT = 0;

	private int value = 0;
	
	@ManyToOne
	private TimeRounding timeRounding;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFromTime() {
		return fromTime;
	}

	public void setFromTime(int fromTime) {
		this.fromTime = fromTime;
	}

	public int getToT() {
		return toT;
	}

	public void setToT(int toT) {
		this.toT = toT;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public TimeRounding getTimeRounding() {
		return timeRounding;
	}

	public void setTimeRounding(TimeRounding timeRounding) {
		this.timeRounding = timeRounding;
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	

	
}
