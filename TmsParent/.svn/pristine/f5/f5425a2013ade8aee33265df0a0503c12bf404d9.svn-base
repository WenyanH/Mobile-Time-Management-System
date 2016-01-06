package com.tms.entity.customer;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tms.entity.CompanyStructure;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class TimeZone {
	@Id
	private String id;
	private String name;
	private String descr;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "timeZone")
	@JsonIgnore
	private Set<CompanyStructure> structure = new HashSet<>();
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public Set<CompanyStructure> getStructure() {
		return structure;
	}
	public void setStructure(Set<CompanyStructure> structure) {
		this.structure = structure;
	}
	
	
}
