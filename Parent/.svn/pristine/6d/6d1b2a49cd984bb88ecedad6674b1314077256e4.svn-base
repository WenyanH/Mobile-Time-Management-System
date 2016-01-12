package com.tms.pages;

import java.util.ArrayList;
import java.util.List;

public class PageListImpl<E> implements IPageList<E> {

	private static final long serialVersionUID = 8332174002476722533L;

	private List<E> records = new ArrayList<E>();

	private long recordTotal;

	@Override
	public long getRecordTotal() {
		return this.recordTotal;
	}

	@Override
	public List<E> getRecords() {
		return this.records;
	}

	@Override
	public void setRecordTotal(long recordTotal) {
		this.recordTotal = recordTotal;
	}

	@Override
	public void setRecords(List<E> records) {
		this.records = records;
	}

	@Override
	public boolean isEmpty() {
		return records.isEmpty();
	}

}
